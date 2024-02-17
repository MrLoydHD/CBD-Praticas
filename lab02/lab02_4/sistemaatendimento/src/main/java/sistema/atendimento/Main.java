package sistema.atendimento;

import java.util.Scanner;

import org.bson.Document;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class Main {
 public static void main(String[] args) {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("SistemaAtendimento");
        MongoCollection<Document> users = database.getCollection("users");

        Scanner mainScanner = new Scanner(System.in);
        System.out.println("Bem vindo ao sistema de atendimento!\n"+
        "Indique o limite de compras por utilizador: ");
        int limiteDeCompras = mainScanner.nextInt();
        System.out.println("Indique o tempo limite de compras (segundos): ");
        long tempoLimite = mainScanner.nextLong();
        boolean sair = false;


        sistemaAtendimento sistema = new sistemaAtendimento(limiteDeCompras, tempoLimite); //unidade , segundos
        while (!sair) {
            sistema.menu();
            System.out.print("Digite a opção desejada: ");
            int opcao = mainScanner.nextInt();
                switch (opcao) {
                    case 1: 
                        sistema.loginOrRegisterUser(users);
                        break;
                    case 2:
                        sistema.comprarProduto(users);
                        break;
                    case 3:
                        sistema.verificarProdutosComprados(users);
                        break;
                    case 4:
                        sistema.limiteDeCompras(users);
                        break;
                    case 5:
                        System.out.println("Saindo do sistema...");
                        sair = true;
                        mongoClient.close();
                        mainScanner.close();
                        break;
                    default:
                        System.out.println("Opção inválida");
                        break;
            }
        }
    }
}
