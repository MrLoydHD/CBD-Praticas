    package redis.ex3.Ex05;

    import java.util.HashMap;
    import java.util.Map;

    import redis.clients.jedis.Jedis;


    public class sistemaAtendimentoB {
        Jedis jedis;
        String user;
        int maxProducts;
        int maxTime;

        public sistemaAtendimentoB(int maxProducts, int maxTime) {
            this.jedis = new Jedis();
            this.maxProducts = maxProducts;
            this.maxTime = maxTime;
        }

        public void setUser(String user) {
            this.user = user;
        }

        public String getkey(String username){
            String userKey = "user:"+ username;
            long currentTime = System.currentTimeMillis() / 1000; //converte para segundos
            return userKey + ":timeslot:" + (currentTime / maxTime) * maxTime;  
        }

        public boolean canMakeOrder(String username, long currentTime, int quantity, String product){
            String timeSlotKey = getkey(username);        
            
            //verifica quantos pedidos o user fez no slot de tempo atual
            String totalQuantityStr = jedis.hget(timeSlotKey, product);
            int totalQuantity = Integer.parseInt(totalQuantityStr != null ? totalQuantityStr : "0");
            // long ordersPerSlot = jedis.scard(timeSlotKey);

            if (totalQuantity + quantity > maxProducts){
                System.out.println("User " + username + " exceeded max orders per time slot (" + maxProducts + ")");
                return false;
            } else {
                return true;
            }
        }

        public boolean makeOrder(String username, String product, int quantity){
            String timeSlotKey = getkey(username);
            long currentTime = System.currentTimeMillis() / 1000; //converte para segundos


            if (jedis.ttl(timeSlotKey) == -1){
                jedis.expire(timeSlotKey, maxTime);
            } 
            
            if (!canMakeOrder(username, currentTime, quantity, product)){
                return false;
            }
            
            jedis.hincrBy(timeSlotKey, product, quantity);

            System.out.println("User " + username + " made order " + product);

            return true;
        }

        public Map<String, Integer> getOrders(String username) {
            String timeSlotKey = getkey(username);
            Map<String, String> orderData = jedis.hgetAll(timeSlotKey);
            Map<String, Integer> orders = new HashMap<>();
        
            if (orderData.isEmpty()) {
                System.out.println("User " + username + " has no orders");
                return orders;
            }
        
            for (Map.Entry<String, String> entry : orderData.entrySet()) {
                String product = entry.getKey();
                int quantity = Integer.parseInt(entry.getValue());
                orders.put(product, quantity);
            }
        
            System.out.println("User " + username + " ordered:");
            for (Map.Entry<String, Integer> entry : orders.entrySet()) {
                String product = entry.getKey();
                int quantity = entry.getValue();
                System.out.println(quantity + " of " + product);
            }
        
            return orders;
        }

        public void clearOrders(String username){
            String timeSlotKey = getkey(username);
            jedis.del(timeSlotKey);
        }

        public void clearAllOrders(){
            jedis.flushAll();
            jedis.flushDB();
        }

        public static void main(String[] args) {
            sistemaAtendimentoB sistema = new sistemaAtendimentoB(30, 10);
            sistema.clearAllOrders();
            sistema.setUser("user1");
            for (int i = 0; i < 31; i++) {
                sistema.makeOrder("user1", "produtoA" , 1);
            }

            for (int i = 0; i < 31; i++) {
                sistema.makeOrder("user1", "produtoB" , 1);
            }

            sistema.getOrders("user1");


            try {
                Thread.sleep(10000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            sistema.makeOrder("user1", "produtoA" , 1);

            sistema.getOrders("user1");

            for (int i = 0; i < 10; i++) {
                sistema.makeOrder("user1", "produtoA" , 1);
                try {
                    Thread.sleep(5000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

            sistema.getOrders("user1");
            
        }
        
    }





        