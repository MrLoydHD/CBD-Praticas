package pokemon;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Query;
import org.neo4j.driver.Result;
import org.neo4j.driver.Session;
import org.neo4j.driver.Record;

public class Neo4jCsvLoader {
    private final Driver driver;

    public Neo4jCsvLoader(String uri, String user, String password){
        driver = GraphDatabase.driver(uri, AuthTokens.basic(user, password));
    }

    public void close(){
        driver.close();
    }

    public void resetDatabase() {
        try (Session session = driver.session()) {
            // Primeiro, remove todas as relações
            String deleteRelationshipsQuery = "MATCH (n) DETACH DELETE n";
            session.run(deleteRelationshipsQuery);
    
            // Depois, remove todos os nós
            String deleteNodesQuery = "MATCH (n) DELETE n";
            session.run(deleteNodesQuery);
        }
    }


    public void runQueriesAndSaveResults() {
        Map<String, String> queries = new HashMap<>();

        // Buscat Todos os Pokemons do tipo Fogo (Fire)
        queries.put("Buscar Todos os Pokémon de um Tipo Específico (Fogo)", "MATCH (p:Pokemon)-[:É_DE_TIPO]->(:Type {name: 'fire'}) RETURN p.name");
        
        // Buscar Todos os Pokemons que tenham um tipo duplo (sendo um deles rock) e a habilidade "Sturdy"
        queries.put("Buscar Todos os Pokemons que tenham um tipo duplo (sendo um deles rock) e a habilidade \"Sturdy\"", "MATCH (p:Pokemon)-[:É_DE_TIPO]->(t1:Type), (p)-[:É_DE_TIPO]->(t2:Type), (p)-[:TEM_HABILIDADE]->(h:Ability)\n" + //
                "WHERE t1.name = 'rock' AND t2.name <> 'rock' AND h.name = 'Sturdy'\n" + //
                "RETURN p.name, t1.name, t2.name, h.name\n" + //
                "");
            
        //Buscar Todos os pokemons da primeira geração que tenham a habilidade "Sturdy" e que sejam do tipo rock ou ground
        queries.put("Buscar Todos os Pokemons da primeira geração com habilidade 'Sturdy' e tipo rock ou ground", 
        "MATCH (p:Pokemon)-[:TEM_HABILIDADE]->(:Ability {name: 'Sturdy'}), " +
        "(p)-[:É_DE_TIPO]->(t:Type) " +
        "WHERE p.generation = 1 AND t.name IN ['rock', 'ground'] " +
        "RETURN p.name, t.name");

        //Buscar Todos os pokemons que tenham mais que uma habilidade
        queries.put("Buscar Todos os Pokemons com mais de uma habilidade", 
        "MATCH (p:Pokemon)-[:TEM_HABILIDADE]->(h:Ability) " +
        "WITH p, COUNT(h) AS numHabilidades " +
        "WHERE numHabilidades > 1 " +
        "RETURN p.name, numHabilidades");

        //Buscar número de pokemons por geração
        queries.put("Buscar número de Pokemons por geração", 
        "MATCH (p:Pokemon) " +
        "RETURN p.generation AS Geracao, COUNT(p) AS NumeroDePokemons " +
        "ORDER BY Geracao");

        //Os pokemons com número de pokedex entre 100 e 150 que tenham mais de 10 kg
        queries.put("Pokemons com número de pokedex entre 100 e 150 e mais de 10 kg", 
        "MATCH (p:Pokemon) " +
        "WHERE p.pokedexNumber >= 100 AND p.pokedexNumber <= 150 AND p.weightKg > 10 " +
        "RETURN p.name, p.pokedexNumber, p.weightKg");

        //Buscar Pokémon Lendários por Geração
        queries.put("Buscar Pokémon Lendários por Geração", 
        "MATCH (p:Pokemon) " +
        "WHERE p.isLegendary = true " +
        "RETURN p.generation AS Geracao, COLLECT(p.name) AS Lendarios " +
        "ORDER BY p.generation");


        //Relações Entre Tipos de pokémon (fire, water, grass, etc)
        queries.put("Relações Entre Tipos de Pokémon", 
        "MATCH (p:Pokemon)-[:É_DE_TIPO]->(t1:Type), (p)-[:É_DE_TIPO]->(t2:Type) " +
        "WHERE t1.name < t2.name " +
        "RETURN t1.name AS Tipo1, t2.name AS Tipo2, COUNT(p) AS NumeroDePokemons " +
        "ORDER BY NumeroDePokemons DESC");

        //Buscar Pokémon por Categoria (Lendário, Normal) e Geração
        queries.put("Buscar Pokémon por Categoria e Geração", 
        "MATCH (p:Pokemon)-[:PERTENCE_A_GERAÇÃO]->(g:Generation), " +
        "(p)-[:É_CATEGORIA]->(c:Category) " +
        "RETURN g.number AS Geracao, c.name AS Categoria, COUNT(p) AS Quantidade " +
        "ORDER BY g.number, c.name");

        //Buscar média de peso e altura dos Pokémon por tipo
        queries.put("Buscar média de peso e altura dos Pokémon por tipo", 
        "MATCH (p:Pokemon)-[:É_DE_TIPO]->(t:Type) " +
        "WITH t.name AS Tipo, AVG(p.weightKg) AS PesoMedio, AVG(p.heightM) AS AlturaMedia " +
        "RETURN Tipo, PesoMedio, AlturaMedia " +
        "ORDER BY Tipo");
        

        try (BufferedWriter writer = new BufferedWriter(new FileWriter("CBD_L44c_output.txt"))) {
            for (Map.Entry<String, String> entry : queries.entrySet()) {
                try (Session session = driver.session()) {
                    Result result = session.run(entry.getValue());
                    writer.write("Título da Consulta: " + entry.getKey() + "\n");
                    writer.write("Query: " + entry.getValue() + "\n");
                    writer.write("Resultado: ");
                    while (result.hasNext()) {
                        writer.write(result.next().toString() + "\n");
                    }
                    writer.write("\n");
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void loadPokemonData() {
        try (Session session = driver.session()) {
            String cypherQuery = 
                "LOAD CSV WITH HEADERS FROM 'file:///pokemon.csv' AS row " +
                "MERGE (p:Pokemon {pokedexNumber: toInteger(row.pokedex_number)}) " +
                "ON CREATE SET p.name = row.name, " +
                "               p.weightKg = toFloat(row.weight_kg), " +
                "               p.heightM = toFloat(row.height_m), " +
                "               p.generation = toInteger(row.generation), " +
                "               p.isLegendary = (row.is_legendary = '1') " +
                "ON MATCH SET  p.weightKg = toFloat(row.weight_kg), " +
                "              p.heightM = toFloat(row.height_m), " +
                "              p.generation = toInteger(row.generation), " +
                "              p.isLegendary = (row.is_legendary = '1') " +
                "WITH row, p " +
                "WHERE row.type1 IS NOT NULL " +
                "MERGE (t1:Type {name: row.type1}) " +
                "MERGE (p)-[:É_DE_TIPO]->(t1) " +
                "WITH row, p " +
                "WHERE row.type2 IS NOT NULL " +
                "MERGE (t2:Type {name: row.type2}) " +
                "MERGE (p)-[:É_DE_TIPO]->(t2) " +
                "WITH row, p, SPLIT(REPLACE(REPLACE(row.abilities, '[', ''), ']', ''), ',') AS abilities " +
                "UNWIND abilities AS ability " +
                "MERGE (h:Ability {name: TRIM(REPLACE(REPLACE(ability, '\"', ''), \"'\", ''))}) " +
                "MERGE (p)-[:TEM_HABILIDADE]->(h) " +
                "WITH row, p " +
                "WITH row, p " +
                "MERGE (g:Generation {number: toInteger(row.generation)}) " +
                "MERGE (p)-[:PERTENCE_A_GERAÇÃO]->(g) " +
                "WITH row, p " +
                "MERGE (c:Category {name: CASE WHEN row.is_legendary = '1' THEN 'Lendário' ELSE 'Normal' END}) " +
                "MERGE (p)-[:É_CATEGORIA]->(c) ";
                
            session.run(cypherQuery);

       }
    }
    

    
}
