package redis.ex3.Ex04;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.resps.Tuple;


public class autocompleteB {
    public static void main(String[] args) throws IOException {
        Jedis jedis = new Jedis();
        jedis.flushDB();


        String filePath = "src/main/java/redis/ex3/nomes-pt-2021.csv";
        String nameKey = "names";

        try (BufferedReader fileScanner = new BufferedReader(new FileReader(filePath));
             Scanner inputScanner = new Scanner(System.in)) {

            String line;
            while((line = fileScanner.readLine()) != null){
                String[] parts = line.split(";");
                if (parts.length == 2){
                    String name = parts[0];
                    int popularity = Integer.parseInt(parts[1]);
                    jedis.zincrby(nameKey, popularity, name);
                }
            }

            String search;
            do {
                System.out.println();
                System.out.print("Search for ('Enter' for quit):");
                search = inputScanner.nextLine().toLowerCase();
                List<Tuple> results = jedis.zrevrangeByScoreWithScores(nameKey, "+inf", "-inf");
                for (Tuple result : results) {
                    String name = result.getElement();
                    double score = result.getScore();
                    if (name.toLowerCase().startsWith(search)) {
                        System.out.println(String.format("%-20s %10.2f", name, score));
                    }
                }
            } while (!search.isEmpty());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            jedis.close();
        }
    }
}
