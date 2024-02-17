package mongo.drivers;

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

public class RestaurantDriver 
{
        static String separator = "---------------------------------";
    public static void main( String[] args ) throws ParseException
    {   
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoCollection<Document> restaurants = mongoClient.getDatabase("lab02_02").getCollection("restaurants");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");

        Document restauranteBacano = new Document("_id", new ObjectId())
                        .append("address", new Document()
                                .append("building", "1089")
                                .append("coord", Arrays.asList(-63.856077, 45.848447))
                                .append("rua", "Rua do Bacano")
                                .append("zipcode", "10462"))
                        .append("localidade", "Bacano City")
                        .append("gastronomia", "Bakery")
                        .append("grades", Arrays.asList(
                                new Document()
                                        .append("date", dateFormat.parse("2014-03-03T00:00:00.000+0000"))
                                        .append("grade", "B")
                                        .append("score", 2),
                                new Document()
                                        .append("date", dateFormat.parse("2014-07-10T00:00:00.000+0000"))
                                        .append("grade", "A")
                                        .append("score", 6),
                                new Document()
                                        .append("date", dateFormat.parse("2015-03-03T00:00:00.000+0000"))
                                        .append("grade", "C")
                                        .append("score", 10),
                                new Document()
                                        .append("date", dateFormat.parse("2015-09-01T00:00:00.000+0000"))
                                        .append("grade", "A")
                                        .append("score", 9),
                                new Document()
                                        .append("date", dateFormat.parse("2016-04-29T00:00:00.000+0000"))
                                        .append("grade", "B")
                                        .append("score", 14)))
                        .append("nome", "Bacano Bakery")
                        .append("restaurant_id", "31111111");


        System.out.println("-------- Exercise 2.3 a) --------");
        insertRestaurant(restaurants, restauranteBacano);

        // O método editRestaurant recebe como parâmetros a coleção de restaurantes, um filtro e um documento de atualização.
        // Generalizado para conseguir cumprir diferentes requisitos.
        editRestaurant(restaurants, Filters.eq("restaurant_id", "31111111"), 
                new Document("$set", 
                new Document("nome", "Bacano Bakery 2")));
        
        // O método searchRestaurant recebe como parâmetros a coleção de restaurantes, um filtro, uma projeção, uma classificação, um limite e um skip.
        // Alguns destes parâmetros podem ser null, caso não sejam necessários para a pesquisa.
        // Generalizado para conseguir cumprir diferentes requisitos.
        Bson filter = Filters.eq("nome", "Bacano Bakery 2");
        Bson projection = Projections.fields(Projections.include("nome", "gastronomia"), Projections.excludeId());
        Bson sort = Sorts.ascending("nome");
        int limit = 0;
        int skip = 0;
        searchRestaurant(restaurants, filter, projection, sort, limit, skip);


        System.out.println("-------- Exercise 2.3 b) --------");

        // Testar o tempo de demora de pesquisa sem a criação de indexes
        long startTime, endTime, duration;
        System.out.println("Teste de pesquisa por localidade sem index:");
        System.out.println("Pesquisa sem index:");
        startTime = System.nanoTime();
        searchRestaurant(restaurants, Filters.eq("localidade", "Bronx"), null, null, 0, 0);
        endTime = System.nanoTime();
        duration = (endTime - startTime);
        System.out.println("Tempo de pesquisa sem index: " + duration + " nanosegundos");

        // Criar index para o campo localidade
        createIndex(restaurants, "localidade", IndexType.ASCENDING, null, null);

        // Testar o tempo de demora de pesquisa com a criação de indexes
        System.out.println("Pesquisa com index:");
        startTime = System.nanoTime();
        searchRestaurant(restaurants, Filters.eq("localidade", "Bronx"), null, null, 0, 0);
        endTime = System.nanoTime();
        duration = (endTime - startTime);
        System.out.println("Tempo de pesquisa com index: " + duration + " nanosegundos");

        System.out.println("Teste de pesquisa por gastronomia sem index:");
        System.out.println("Pesquisa sem index:");
        startTime = System.nanoTime();
        searchRestaurant(restaurants, Filters.eq("gastronomia", "Bakery"), null, null, 0, 0);
        endTime = System.nanoTime();
        duration = (endTime - startTime);
        System.out.println("Tempo de pesquisa sem index: " + duration + " nanosegundos");

        // Criar index para o campo gastronomia
        createIndex(restaurants, "gastronomia", IndexType.ASCENDING, null, null);

        // Testar o tempo de demora de pesquisa com a criação de indexes
        System.out.println("Pesquisa com index:");
        startTime = System.nanoTime();
        searchRestaurant(restaurants, Filters.eq("gastronomia", "Bakery"), null, null, 0, 0);
        endTime = System.nanoTime();
        duration = (endTime - startTime);
        System.out.println("Tempo de pesquisa com index: " + duration + " nanosegundos");

        System.out.println("Teste de pesquisa por nome sem index:");
        System.out.println("Pesquisa sem index:");
        startTime = System.nanoTime();
        searchRestaurant(restaurants, Filters.eq("nome", "Bacano Bakery 2"), null, null, 0, 0);
        endTime = System.nanoTime();
        duration = (endTime - startTime);
        System.out.println("Tempo de pesquisa sem index: " + duration + " nanosegundos");

        // Criar um text index para o campo nome
        createIndex(restaurants, "nome", IndexType.TEXT, null, "english");

        // Testar o tempo de demora de pesquisa com a criação de indexes
        System.out.println("Pesquisa com index:");
        startTime = System.nanoTime();
        searchRestaurant(restaurants, Filters.eq("nome", "Bacano Bakery 2"), null, null, 0, 0);
        endTime = System.nanoTime();
        duration = (endTime - startTime);
        System.out.println("Tempo de pesquisa com index: " + duration + " nanosegundos");

        System.out.println("-------- Exercise 2.3 c) --------");

        //23. Indique os restaurantes que têm gastronomia "Portuguese", o somatório de score é superior a 50 e estão numa latitude inferior a -60.
        System.out.println("23. Indique os restaurantes que têm gastronomia \"Portuguese\", o somatório de score é superior a 50 e estão numa latitude inferior a -60.");
        System.out.println(separator);
        List<Bson> pipeline = new ArrayList<>();
        //$match
        pipeline.add(Aggregates.match(Filters.eq("gastronomia", "Portuguese")));

        //$project
        pipeline.add(Aggregates.project(
                Projections.fields(
                    Projections.include("nome", "gastronomia"),
                    Projections.computed("totalScore", new Document("$sum", "$grades.score")),
                    Projections.computed("latitude", new Document("$arrayElemAt", Arrays.asList("$address.coord", 0)))
                )
            ));
        //$match
        pipeline.add(Aggregates.match(Filters.and(Filters.gt("totalScore", 50), Filters.lt("latitude", -60))));
        
        aggregateRestaurants(restaurants, pipeline);

        //13. Liste o nome, a localidade, o score e gastronomia dos restaurantes que alcançaram sempre pontuações inferiores ou igual a 3
        //db.restaurants.find({"grades.score": {$not: {$gt: 3}}} ,{nome: 1 , localidade: 1, "grades.score": 1, gastronomia: 1, _id: 0})
        System.out.println("13. Liste o nome, a localidade, o score e gastronomia dos restaurantes que alcançaram sempre pontuações inferiores ou igual a 3");
        System.out.println(separator);
        Bson filter13 = Filters.not(Filters.gt("grades.score", 3));
        Bson projection13 = Projections.fields(Projections.include("nome", "localidade", "grades.score", "gastronomia"), Projections.excludeId());
        searchRestaurant(restaurants, filter13, projection13, null, 0, 0);

        //7. Encontre os restaurantes que obtiveram uma ou mais pontuações (score) entre [80 e 100].
        //db.restaurants.find({"grades": {$elemMatch: {"score": { $gte: 80, $lte: 100 }}}}, { nome: 1, localidade: 1, restaurant_id: 1, _id: 0, "grades.score": 1})
        System.out.println("7. Encontre os restaurantes que obtiveram uma ou mais pontuações (score) entre [80 e 100].");
        System.out.println(separator);
        Bson filter7 = Filters.elemMatch("grades", Filters.and(Filters.gte("score", 80), Filters.lte("score", 100)));
        Bson projection7 = Projections.fields(Projections.include("nome", "localidade", "restaurant_id", "grades.score"), Projections.excludeId());
        searchRestaurant(restaurants, filter7, projection7, null, 0, 0);

        //5. Apresente os primeiros 15 restaurantes localizados no Bronx, ordenados por ordem crescente de nome.
        //db.restaurants.find({localidade: "Bronx"}, {nome:1, localidade:1}).sort({nome:1}).limit(15)

        System.out.println("5. Apresente os primeiros 15 restaurantes localizados no Bronx, ordenados por ordem crescente de nome.");
        System.out.println(separator);
        Bson filter5 = Filters.eq("localidade", "Bronx");
        Bson projection5 = Projections.fields(Projections.include("nome", "localidade"), Projections.excludeId());
        Bson sort5 = Sorts.ascending("nome");
        int limit5 = 15;
        int skip5 = 0;
        searchRestaurant(restaurants, filter5, projection5, sort5, limit5, skip5);
        
        //21. Apresente o número total de avaliações (numGrades) em cada dia da semana
        System.out.println("21. Apresente o número total de avaliações (numGrades) em cada dia da semana");
        System.out.println(separator);

        List<Bson> pipeline21 = new ArrayList<>();
        //$unwind
        pipeline21.add(Aggregates.unwind("$grades"));

        //$project
        pipeline21.add(Aggregates.project(
                Projections.fields(
                    Projections.computed("diaDaSemana", new Document("$dayOfWeek", "$grades.date"))
                )
            ));
        
        //$group
        pipeline21.add(Aggregates.group("$diaDaSemana", Accumulators.sum("numGrades", 1)));

        //$sort
        pipeline21.add(Aggregates.sort(Sorts.ascending("_id")));

        //$project: { diaDaSemana: { $switch: {branches: [{ case: { $eq: ["$_id", 1] }, then: "Domingo" }, { case: { $eq: ["$_id", 2] }, then: "Segunda" }, { case: { $eq: ["$_id", 3] }, then: "Terça" }, { case: { $eq: ["$_id", 4] }, then: "Quarta" }, { case: { $eq: ["$_id", 5] }, then: "Quinta" }, { case: { $eq: ["$_id", 6] }, then: "Sexta" }, { case: { $eq: ["$_id", 7] }, then: "Sábado" }]}}}
        pipeline21.add(Aggregates.project(
                Projections.fields(
                    Projections.computed("diaDaSemana", new Document("$switch", new Document("branches", Arrays.asList(
                        new Document("case", new Document("$eq", Arrays.asList("$_id", 1))).append("then", "Domingo"),
                        new Document("case", new Document("$eq", Arrays.asList("$_id", 2))).append("then", "Segunda"),
                        new Document("case", new Document("$eq", Arrays.asList("$_id", 3))).append("then", "Terça"),
                        new Document("case", new Document("$eq", Arrays.asList("$_id", 4))).append("then", "Quarta"),
                        new Document("case", new Document("$eq", Arrays.asList("$_id", 5))).append("then", "Quinta"),
                        new Document("case", new Document("$eq", Arrays.asList("$_id", 6))).append("then", "Sexta"),
                        new Document("case", new Document("$eq", Arrays.asList("$_id", 7))).append("then", "Sábado")
                    )))),
                        Projections.excludeId(),
                        Projections.include("numGrades")
                )
            ));

        aggregateRestaurants(restaurants, pipeline21);
        
        System.out.println("-------- Exercise 2.3 d) --------");
        System.out.println("Número de localidades: " + countLocalidades(restaurants));
        
        Map <String, Integer> countRestPerLocal = countRestByLocalidade(restaurants);
        System.out.println("Número de restaurantes por localidade:");
        for (Map.Entry<String, Integer> entry : countRestPerLocal.entrySet()) {
                System.out.println("-> " + entry.getKey() + " - " + entry.getValue());
            }

        List <String> results = getRestWithCloserTo("Park", restaurants);
        System.out.println("Nome de restaurantes contendo 'Park' no nome:");
        for (String result : results) {
                System.out.println("-> " + result);
        }
        
}

        public static void insertRestaurant(MongoCollection<Document> restaurants, Document restaurante) {
                //verificar se já existe um restaurante com restaurant_id
                Document restauranteExistente = restaurants.find(Filters.eq("restaurant_id", restaurante.get("restaurant_id"))).first();
                if (restauranteExistente != null) {
                System.out.println("Já existe um restaurante com o id " + restaurante.get("restaurant_id"));
                return;
                }
                restaurants.insertOne(restaurante);
                System.out.println("Restaurante inserido com sucesso!");
        }

        public static void editRestaurant(MongoCollection<Document> restaurants, Bson filter, Bson update) {
                Document restauranteExistente = restaurants.find(filter).first();
                if (restauranteExistente == null) {
                System.out.println("Restaurante não encontrado com as condições especificadas.");
                return;
                }
                restaurants.updateOne(filter, update);
                System.out.println("Restaurante editado com sucesso!");
        }

        public static void searchRestaurant(MongoCollection<Document> restaurants, Bson filter, Bson projection, Bson sort, int limit, int skip) {
                FindIterable<Document> findIterable = restaurants.find(filter);
        
                // Aplicar projeção, classificação, limite e skip, se fornecidos
                if (projection != null) {
                findIterable.projection(projection);
                }
                if (sort != null) {
                findIterable.sort(sort);
                }
                if (skip > 0) {
                findIterable.skip(skip);
                }
                if (limit > 0) {
                findIterable.limit(limit);
                }
        
                List<Document> results = new ArrayList<>();
                for (Document document : findIterable) {
                results.add(document);
                }

                for (Document document : results) {
                        System.out.println(document.toJson());
                }

        
        }

        public static void createIndex(MongoCollection<Document> restaurants, String fieldName, IndexType indexType, IndexOptions indexOptions, String textLanguage) {
                IndexOptions options = new IndexOptions();
                if (indexOptions != null) {
                        options = indexOptions;
                }

                //validar se o indexType é TEXT e se o textLanguage é válido
                if (indexType == IndexType.TEXT) {
                        if (textLanguage == null || textLanguage.isEmpty()) {
                                System.out.println("É necessário especificar um idioma para o índice de texto.");
                                return;
                        }
                        options.defaultLanguage(textLanguage);
                }

                switch (indexType) {
                        case ASCENDING:
                                restaurants.createIndex(Indexes.ascending(fieldName), options);
                                System.out.println("Index Ascending criado com sucesso.");
                                break;
                        case DESCENDING:
                                restaurants.createIndex(Indexes.descending(fieldName), options);
                                System.out.println("Index Descending criado com sucesso.");
                                break;
                        case TEXT:
                                restaurants.createIndex(Indexes.text(fieldName), options);
                                System.out.println("Index Text criado com sucesso.");
                                break;
                        case HASHED:
                                restaurants.createIndex(Indexes.hashed(fieldName), options);
                                System.out.println("Index Hashed criado com sucesso.");
                                break;
                        case GEO2D:
                                restaurants.createIndex(Indexes.geo2d(fieldName), options);
                                System.out.println("Index Geo2D criado com sucesso.");
                                break;
                        case GEO2DSPHERE:
                                restaurants.createIndex(Indexes.geo2dsphere(fieldName), options);
                                System.out.println("Index Geo2DSphere criado com sucesso.");
                                break;
                        default:
                                System.out.println("IndexType inválido.");
                                break;
                }

        }

        public static void aggregateRestaurants(MongoCollection<Document> restaurants, List<Bson> pipeline) {
                
                if (pipeline == null || pipeline.isEmpty()) {
                        System.out.println("É necessário especificar um pipeline para a agregação.");
                        return;
                }

                AggregateIterable<Document> aggregateIterable = restaurants.aggregate(pipeline);

                for (Document document : aggregateIterable) {
                        System.out.println(document.toJson());
                }
        }

        public static int countLocalidades(MongoCollection<Document> restaurants) {
                List<String> localidades = new ArrayList<>();
                localidades = restaurants.distinct("localidade", String.class).into(new ArrayList<>());
                return localidades.size();
        }

        public static Map<String, Integer> countRestByLocalidade(MongoCollection<Document> restaurants) {
                List<Bson> pipeline = new ArrayList<>();
                HashMap<String, Integer> countRestPerLocal = new HashMap<>();

                //$group
                pipeline.add(Aggregates.group("$localidade", Accumulators.sum("numRest", 1)));

                AggregateIterable<Document> aggregateIterable = restaurants.aggregate(pipeline);

                for (Document document : aggregateIterable) {
                        countRestPerLocal.put(document.getString("_id"), document.getInteger("numRest"));
                }

                return countRestPerLocal;

        }
        
        public static List<String> getRestWithCloserTo(String name, MongoCollection<Document> restaurants) {
                List<String> results = new ArrayList<>();
                //db.restaurants.find({nome: {$regex: ".*Park.*"}}, {nome: 1, _id: 0})
                Bson filter = Filters.regex("nome", ".*" + name + ".*");
                Bson projection = Projections.fields(Projections.include("nome"), Projections.excludeId());
                FindIterable<Document> findIterable = restaurants.find(filter).projection(projection);
                for (Document document : findIterable) {
                        results.add(document.getString("nome"));
                }
                return results;
        }

//     public static void deleteRestaurant(MongoCollection<Document> restaurants, String restaurant_id) {
//         //verificar se já existe um restaurante com restaurant_id
//         Document restauranteExistente = restaurants.find(Filters.eq("restaurant_id", restaurant_id)).first();
//         if (restauranteExistente == null) {
//             System.out.println("Não existe um restaurante com o id " + restaurant_id);
//             return;
//         }
//         restaurants.deleteOne(restauranteExistente);
//         System.out.println("Restaurante removido com sucesso!");
//     }


}
