package redis.ex3.Ex04;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.Set;

import redis.clients.jedis.Jedis;


public class autocompleteA {
    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        jedis.flushDB();


        String filePath = "src/main/java/redis/ex3/names.txt";
        String nameKey = "names";

        try (Scanner fileScanner = new Scanner(new File(filePath));
             Scanner inputScanner = new Scanner(System.in)) {

            while (fileScanner.hasNextLine()) {
                String name = fileScanner.nextLine();
                jedis.zadd(nameKey, 0, name);
            }

            // Verifique se os nomes foram adicionados ao conjunto.
            // System.out.println(jedis.zrange(nameKey, 0, -1));

            String search;
            do {
                System.out.println();
                System.out.print("Search for ('Enter' for quit):");
                search = inputScanner.nextLine().toLowerCase();
                jedis.zrangeByLex("names", "[" + search, "[" + search + "\u00ff").forEach(System.out::println);
            } while (!search.isEmpty());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            jedis.close();
        }
    }
}
