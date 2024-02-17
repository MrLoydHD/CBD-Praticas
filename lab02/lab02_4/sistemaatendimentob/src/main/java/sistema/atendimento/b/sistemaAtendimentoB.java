package sistema.atendimento.b;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerAddress;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.IndexOptions;
import com.mongodb.client.model.Indexes;
import com.mongodb.client.model.Projections;
import com.mongodb.client.model.Sorts;
import com.mongodb.client.MongoClient;
import static com.mongodb.client.model.Aggregates.*;
import static com.mongodb.client.model.Filters.*;

import java.io.*;
import java.util.*;
import java.nio.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class sistemaAtendimentoB {

    List<Document> users;
    List<Document> produtos;
    protected int limiteDeCompras; //por utilizador
    protected long tempoLimite; //em segundos
    protected String nomeUtilizadorLogado;

    public sistemaAtendimentoB(int limiteDeCompras, long tempoLimite) {
        this.limiteDeCompras = limiteDeCompras;
        this.tempoLimite = tempoLimite;
        this.users = new ArrayList<Document>();
        this.nomeUtilizadorLogado = null;
    }

    public long getTempoLimite() {
        return tempoLimite;
    }

    public int getLimiteDeCompras() {
        return limiteDeCompras;
    }

    //add user
    public void loginOrRegisterUser(MongoCollection<Document> users) {
        try {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Digite o nome do utilizador: ");
            String nome = scanner.next();

            //verifica se o utilizador já existe
            Document user = users.find(eq("nome", nome)).first();

            if (user != null) {
                System.out.println("Utilizador já existe, logado como: " + nome);
                this.nomeUtilizadorLogado = nome; // Define o nome do utilizador logado
                return;
            } else {
                System.out.println("Utilizador: " + nome);
            }

            //cria um novo utilizador
            user = new Document("_id", new ObjectId()).append("nome", nome).append("produtos", new ArrayList<Document>());

            //adiciona o utilizador à lista de utilizadores
            users.insertOne(user);

            System.out.println("Utilizador adicionado com sucesso");
            this.nomeUtilizadorLogado = nome; // Define o nome do utilizador logado
        } catch (Exception e) { 
            System.out.println("Erro ao adicionar utilizador");
        }
    }


    public Document getUser(String nome, MongoCollection<Document> users) {
        for (Document user : users.find()) {
            if (users.find(user).first().getString("nome").equals(nome)) {
                return user;
            }
        }
        return null;
    }

    public void limiteDeCompras(MongoCollection<Document> users) {
        if (this.nomeUtilizadorLogado == null) {
            System.out.println("Utilizador não logado");
            return;
        }

        Document user = getUser(this.nomeUtilizadorLogado, users);
        int limiteDeCompras = getLimiteDeCompras();
        //get quantidade de produtos comprados
        List<Document> produtos = user.getList("produtos", Document.class);
        int comprasFeitas = 0;
        for (Document produto : produtos) {
            comprasFeitas += produto.getInteger("quantidade");
        }
        int comprasRestantes = limiteDeCompras - comprasFeitas;

        System.out.println("Limite de compras: " + limiteDeCompras + "\n" + "Compras feitas: " + comprasFeitas + "\n" + "Compras restantes: " + comprasRestantes);
    }

    public void verificarProdutosComprados(MongoCollection<Document> users) {
        if (this.nomeUtilizadorLogado == null) {
            System.out.println("Utilizador não logado");
            return;
        }
    
        Document user = getUser(this.nomeUtilizadorLogado, users);
    
        List<Document> produtos = user.getList("produtos", Document.class);
        List<Document> produtosNoCarrinho = new ArrayList<>(); // Lista para armazenar produtos válidos
    
        long currentTime = System.currentTimeMillis() / 1000; // Tempo atual em segundos
    
        // Filtra os produtos que ainda não atingiram o tempo limite
        for (Document produto : produtos) {
            long tempoLimite = produto.getLong("tempoLimite");
            long tempoRestante = tempoLimite - currentTime;
    
            if (tempoRestante > 0) {
                produtosNoCarrinho.add(produto);
            }
        }
    
        // Atualiza a lista de produtos no carrinho do usuário
        user.put("produtos", produtosNoCarrinho);
    
        // Atualiza o documento do usuário no banco de dados
        Bson filter = Filters.eq("_id", user.getObjectId("_id"));
        users.replaceOne(filter, user);
    
        // Exibe os produtos válidos
        if (produtosNoCarrinho.isEmpty()) {
            System.out.println("Não existem produtos no carrinho");
        } else {
            System.out.println("Produtos no carrinho: ");
            for (Document produto : produtosNoCarrinho) {
                String nomeProduto = produto.getString("nome");
                long tempoLimite = produto.getLong("tempoLimite");
                long tempoRestante = tempoLimite - currentTime;
                int quantidade = produto.getInteger("quantidade");
                System.out.println("Nome: " + nomeProduto + " Quantidade: " + quantidade + " Tempo restante: " + tempoRestante + " segundos");
            }
        }
    }
    

    public void comprarProduto(MongoCollection<Document> users) {
        
        if (this.nomeUtilizadorLogado == null) {
            System.out.println("Utilizador não logado");
            return;
        }

        Document user = getUser(this.nomeUtilizadorLogado, users);

        try {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Digite o nome do produto: ");
            String nomeProduto = scanner.next();
            System.out.println("Digite a quantidade de produtos: ");
            int quantidade = scanner.nextInt();

            //limite de tempo de cada produto no carrinho
            long tempoLimiteProduto =  getTempoLimite();
            long limiteDeComprasProduto = getLimiteDeCompras();
            long currentTime = System.currentTimeMillis() / 1000; // tempo atual em segundos
            long tempoLimite = currentTime + tempoLimiteProduto; // tempo limite em segundos

            //remove os produtos que já passaram do tempo limite
            List<Document> produtos = user.getList("produtos", Document.class);
            Iterator<Document> iterator = produtos.iterator();
            while (iterator.hasNext()) {
                Document produto = iterator.next();
                long tempolimite = produto.getLong("tempoLimite");
                if (tempolimite < currentTime) {
                    iterator.remove(); // Remove o produto da lista
                }
            }

            List<Bson> pipeline = Arrays.asList(
                match(Filters.eq("nome", this.nomeUtilizadorLogado)),
                project(Projections.fields(Projections.excludeId(), Projections.include("produtos"))),
                unwind("$produtos"),
                group("$produtos.nome", Accumulators.sum("total", "$produtos.quantidade"))
            );

            AggregateIterable<Document> iterable = users.aggregate(pipeline);
            Document doc = iterable.first();

            int quantidadeTotalJaComprada = 0;

            if (doc != null) {
                quantidadeTotalJaComprada = doc.getInteger("total");
            }

            if (quantidadeTotalJaComprada + quantidade > limiteDeComprasProduto) {
                System.out.println("Quantidade de produtos excede o limite de compras");
                return;
            }

            //adiciona o produto ao carrinho
            Document produto = new Document("_id", new ObjectId()).append("nome", nomeProduto).append("tempoLimite", tempoLimite).append("quantidade", quantidade);

            //adiciona o produto ao carrinho do utilizador
            user.getList("produtos", Document.class).add(produto);
            users.updateOne(eq("nome", this.nomeUtilizadorLogado), new Document("$set", user));

            System.out.println("Produto adicionado com sucesso");
        } catch (InputMismatchException e) {
            System.out.println("Erro ao adicionar produto\n" + "Input inválido");
        }
    }

    public void menu() {

        String menu = "1 - Login ou registar utilizador\n" +
            "2 - Comprar produto\n" +
            "3 - Verificar produtos comprados\n" +
            "4 - Limite de compras\n" +
            "5 - Sair";

        System.out.println(menu);

    }   
    
}