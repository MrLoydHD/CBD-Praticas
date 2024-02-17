package sistema.atendimento.c;

import org.bson.Document;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class MainC {
    public static void main(String[] args) {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("SistemaAtendimento");
        MongoCollection<Document> users = database.getCollection("users");


        sistemaAtendimentoC sistema = new sistemaAtendimentoC(20, 60); //unidade , segundos
    
        long startTime, endTime, duration;

        sistema.loginOrRegisterUser(users, "user1");

        startTime = System.nanoTime();
        for (int i = 0; i < 20; i++) {
            sistema.comprarProduto(users);
        }
        endTime = System.nanoTime();
        duration = (endTime - startTime) / 1000000;
        System.out.println("Tempo de execução: " + duration + "ms");

        startTime = System.nanoTime();
        sistema.verificarProdutosComprados(users);
        endTime = System.nanoTime();
        duration = (endTime - startTime) / 1000000;
        System.out.println("Tempo de execução: " + duration + "ms");

    }

}
