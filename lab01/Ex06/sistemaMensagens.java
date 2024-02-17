package redis.ex3.Ex06;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

import redis.clients.jedis.Jedis;

public class sistemaMensagens {

    private boolean loggedIn = false;
    private Jedis jedis;
    private String user;
    private static String separator = "---------------------------------";
    private static String userKey = "users"; //set(userKey, usernames)
    private static String followersKey; //set(followersKey, username) 
    private static String userPostsKey; //list(userPostsKey, post) 

    public sistemaMensagens(String user) {
        this.jedis = new Jedis();
        this.user = user;
        if (jedis.sismember(userKey, user)){
            System.out.println("Utilizador já existe!");
            System.out.println("Deseja fazer login? (y/n)");
            Scanner inputScanner = new Scanner(System.in);
            String opcao = inputScanner.nextLine();
            if (opcao.equalsIgnoreCase("y")){
                loggedIn = true;
                setKeys(user);
            } else {
                System.out.println("A sair do sistema...");
                loggedIn = false;
                inputScanner.close();
            }
        } else {
            System.out.println("Utilizador criado com sucesso!");
            jedis.sadd(userKey, user);
            loggedIn = true;
            setKeys(user);
        }
    }

    public static void setKeys(String user){
        followersKey = user + ":followers";
        userPostsKey = user + ":posts";
    }

    public void menu() {
        Scanner inputScanner = new Scanner(System.in);
        System.out.println(separator);

        String menu = this.user + " logado no sistema\n"
                + "1 - Seguir utilizador\n" +
                "2 - Deixar de seguir utilizador\n" +
                "3 - Listar seguidores\n" + 
                "4 - Listar seguidos\n" +
                "5 - Fazer um post\n" +
                "6 - Ver timeline de mensagens de utilizador\n" +
                "7 - Lista de utilizadores\n" +
                "8 - Eliminar utilizador\n" +
                "9 - Sair\n";
        System.out.println(menu);

        int opcao = inputScanner.nextInt();

        switch(opcao){
            case 1: 
                System.out.println(separator);
                seguirUtilizador();
                break;
            case 2: 
                System.out.println(separator);
                deixarSeguir();
                break;
            case 3: 
                System.out.println(separator);
                listSeguidores();
                break;
            case 4: 
                System.out.println(separator);
                listSeguidos();
                break;
            case 5: 
                System.out.println(separator);
                fazerPost();
                break;
            case 6: 
                System.out.println(separator);
                verTimelineUtilizador();
                break;
            case 7: 
                System.out.println(separator);
                System.out.println("Lista de utilizadores:");
                jedis.smembers(userKey).forEach(System.out::println);
                break;
            case 8:
                System.out.println(separator);
                eliminarUtilizador();
            case 9: 
                System.out.println(separator);
                System.out.println("A sair do sistema...");
                loggedIn = false;
                inputScanner.close();
                break;
            default:
                System.err.println("Opção inválida! Escolha uma opção entre 1 e 9");
        }

    }

    private void eliminarUtilizador() {
        String user = this.user;

        //eliminar o user dos seguidores dos utilizadores que o seguem
        Set<String> users = jedis.smembers(userKey);
        for (String u: users){
            if (jedis.sismember(u + ":followers", user)){
                jedis.srem(u + ":followers", user);
            }
        }

        //eliminar o user dos utilizadores que ele segue
        Set<String> seguidos = jedis.smembers(userKey);
        for (String u: seguidos){
            if (jedis.sismember(user + ":followers", u)){
                jedis.srem(user + ":followers", u);
            }
        }

        //eliminar os posts do user
        jedis.del(userPostsKey);

        //eliminar o user
        jedis.srem(userKey, user);

        System.out.println("Utilizador eliminado com sucesso!");

    }

    public void seguirUtilizador(){
        Scanner inputScanner = new Scanner(System.in);
        System.out.println("Insira o username do utilizador que pretende seguir:");
        String usernameASeguir = inputScanner.nextLine();

        if (usernameASeguir.equals(this.user)){
            System.out.println("Não pode seguir-se a si próprio!");
            return;
        }

        //se ja seguir o utilizador nao faz nada
        if (jedis.sismember(userKey, usernameASeguir) && jedis.sismember(usernameASeguir + ":followers", this.user)){
            System.out.println("Já está a seguir o utilizador " + usernameASeguir);
            return;
        }

        if (jedis.sismember(userKey, usernameASeguir)){
            String usertoFollow = usernameASeguir + ":followers";
            jedis.sadd(usertoFollow, this.user);
            System.out.println("Agora está a seguir o utilizador " + usernameASeguir);
        } else {
            System.out.println("O utilizador " + usernameASeguir + " não existe!");
        }

    }

    public void deixarSeguir(){
        Scanner inputScanner = new Scanner(System.in);
        System.out.println("Insira o username do utilizador que pretende deixar de seguir:");
        String usernameADeixarDeSeguir = inputScanner.nextLine();

        String userToUnfollow = usernameADeixarDeSeguir + ":followers";

        if (jedis.sismember(userKey, usernameADeixarDeSeguir)){
            jedis.srem(userToUnfollow, this.user);
            System.out.println("Deixou de seguir o utilizador " + usernameADeixarDeSeguir);
        } else {
            System.out.println("O utilizador " + usernameADeixarDeSeguir + " não existe!");
        }

    }

    public void listSeguidores(){
        System.out.println("Seguidores:");
        jedis.smembers(followersKey).forEach(System.out::println);
    }

    public void listSeguidos(){
        System.out.println("Seguidos:");
        Set<String> users = jedis.smembers(userKey);
        List<String> seguidos = new ArrayList<>();
        for (String u: users){
            if (jedis.sismember(u + ":followers", this.user) && !u.equals(this.user)){
                seguidos.add(u);
            }
        }

        if (seguidos.isEmpty()){
            System.out.println("O utilizador não segue ninguém!");
        } else {
            seguidos.forEach(System.out::println);
        }
        
    }

    public void fazerPost(){
        Scanner inputScanner = new Scanner(System.in);
        System.out.println("Insira o texto do post:");
        //tempo atual em horas:minutos:segundos
        String timestamp = java.time.LocalTime.now().toString() + " - ";
        String post = timestamp + inputScanner.nextLine();


        jedis.rpush(userPostsKey, post);
        System.out.println("Post feito com sucesso!");

    }

    public void verTimelineUtilizador(){
        Scanner inputScanner = new Scanner(System.in);
        System.out.println("Insira o username:");
        String username = inputScanner.nextLine();

        String userPosts = username + ":posts";
        List<String> posts = jedis.lrange(userPosts, 0, -1);

        if (posts.isEmpty()){
            System.out.println("O utilizador não tem posts!");
        } else {
            posts.forEach(System.out::println);
        }

    }


    public void cleanSystem(){
        jedis.flushDB();
    }

    public static void main(String[] args) {
        Scanner inputScanner = new Scanner(System.in);

        
        System.out.println("Bem vindo ao sistema de mensagens!");
        System.out.println(separator);
        System.out.println("Insira o seu username:");
        String username = inputScanner.nextLine();


        //cria o sistema de mensagens para o utilizador
        sistemaMensagens sistema = new sistemaMensagens(username);

        //menu principal
        while (sistema.loggedIn){
            sistema.menu();
        }

        inputScanner.close();
        

    }
}
