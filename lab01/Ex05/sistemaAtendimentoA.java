package redis.ex3.Ex05;

import java.util.Set;

import redis.clients.jedis.Jedis;

public class sistemaAtendimentoA {
    Jedis jedis;
    String user;
    int maxProducts;
    int maxTime;

    public sistemaAtendimentoA(int maxProducts, int maxTime) {
        this.jedis = new Jedis();
        this.maxProducts = maxProducts;
        this.maxTime = maxTime;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public boolean canMakeOrder(String username, long currentTime) {
        String timeSlotKey = getkey(username, currentTime);

        // verifica quantos pedidos o user fez no slot de tempo atual
        long ordersPerSlot = jedis.scard(timeSlotKey);

        if (ordersPerSlot >= maxProducts) {
            System.out.println("User " + username + " exceeded max orders per time slot (" + maxProducts + ")");
            System.out.println("Time remaining to start a new order: " + jedis.ttl(timeSlotKey) + " seconds");
            return false;
        } else {
            long timeRemaining = jedis.ttl(timeSlotKey);
            if (timeRemaining == -2) {
                System.out.println("Time slot reseted or expired");
            }
            return true;
        }
    }

    public String getkey(String username, long currentTime) {
        String userKey = "user:" + username;
        String timeSlotKey = userKey + ":timeslot:" + (currentTime / maxTime) * maxTime;
        return timeSlotKey;
    }

    public boolean makeOrder(String username, String product) {
        long currentTime = System.currentTimeMillis() / 1000; // converte para segundos
        String timeSlotKey = getkey(username, currentTime);

        if (jedis.ttl(timeSlotKey) == -1) {
            jedis.expire(timeSlotKey, maxTime);
        }

        if (!canMakeOrder(username, currentTime)) {
            return false;
        }

        jedis.sadd(timeSlotKey, product);

        System.out.println("User " + username + " made order " + product);

        return true;
    }

    public Set<String> getOrders(String username) {
        long currentTime = System.currentTimeMillis() / 1000; // converte para segundos
        String timeSlotKey = getkey(username, currentTime);
        return jedis.smembers(timeSlotKey);
    }

    public void clearOrders(String username) {
        long currentTime = System.currentTimeMillis() / 1000; // converte para segundos
        String timeSlotKey = getkey(username, currentTime);
        jedis.del(timeSlotKey);
    }

    public void clearAllOrders() {
        jedis.flushAll();
        jedis.flushDB();
    }

   public static void main(String[] args) {
        sistemaAtendimentoA sistema = new sistemaAtendimentoA(5, 10);
        sistema.setUser("user1");
    
        // Simulando a compra de 6 produtos em menos de 10 segundos
        for (int i = 0; i < 6; i++) {
            sistema.makeOrder("user1", "produto" + i);
            try {
                // Aguarda 2 segundos entre as compras
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    
        // Simulando a compra de mais 6 produtos após o tempo de expiração
        try {
            Thread.sleep(10000); // Espera 10 segundos para que os produtos expirem
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    
        for (int i = 6; i < 12; i++) {
            sistema.makeOrder("user1", "produto" + i);
        }
    
        // Obtendo os pedidos atuais do usuário
        Set<String> orders = sistema.getOrders("user1");
        System.out.println("Pedidos atuais do usuário:");
        for (String order : orders) {
            System.out.println(order);
        }
    }
}