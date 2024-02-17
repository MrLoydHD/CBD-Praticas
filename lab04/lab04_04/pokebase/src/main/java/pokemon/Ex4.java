package pokemon;

import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Query;
import org.neo4j.driver.Result;
import org.neo4j.driver.Session;
import org.neo4j.driver.Record;

public class Ex4{


    Neo4jCsvLoader loader;

    public static void main( String[] args ){
        Neo4jCsvLoader loader = new Neo4jCsvLoader("bolt://localhost:7687", "neo4j", "12345678");
        
        // Reset the database (use with caution!)
        loader.resetDatabase();

        // Load the Pokémon data
        loader.loadPokemonData();

        loader.runQueriesAndSaveResults();

        loader.close();
    }
}
