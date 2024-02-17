package cassandra.driver;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.exceptions.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


public class App {
    static Session session;

    public static void main( String[] args )
    {
        try {
            connect("127.0.0.1", 9042);

            System.out.println("Exercicio a)");

            // Listar todos os utilizadores
            queryData("SELECT * FROM users");
            // Insere um novo utilizador
            insertData("INSERT INTO users (id, username, name, email, registration_timestamp) VALUES (?, ?, ?, ?, ?)", 11, "TJI", "Tiago Pereira", "tji@email.com", new Timestamp(System.currentTimeMillis()));
            // Listar todos os utilizadores novamente para verificar que o utilizador foi inserido
            queryData("SELECT * FROM users");
            // Atualizar o nome do utilizador
            updateData("UPDATE users SET name = ? WHERE id = ?", "Tiago Silva", 11);
            // Listar todos os utilizadores novamente para verificar que o utilizador foi atualizado
            queryData("SELECT * FROM users");

            System.out.println("Exercicio b)");

            // 4. Os últimos 5 eventos de determinado vídeo realizados por um utilizador
            queryData("SELECT * FROM video_events WHERE video_id = ? AND username = ? LIMIT 5", 1, "PTM");

            // 8. Todos os comentários (dos vídeos) que determinado utilizador está a seguir (following)
            getCommentsForFollowedVideos("Tiagovski"); //Com a ajuda da parte cliente já foi possível realizar esta query

            // 13. Rating máximo e mínimo de cada vídeo
            queryVideoRatings();

            // 12. Quantidade de comentários por vídeo
            queryCommentCountByVideo();
            

        } catch (NoHostAvailableException e) {
            System.err.println("No host in the cluster can be contacted to execute this query.");
        } catch (QueryExecutionException e) {
            System.err.println("An exception was thrown by Cassandra because it cannot successfully execute the query.");
        } catch (QueryValidationException e) {
            System.err.println("A query validation exception was thrown by Cassandra.");
        } catch (Exception e) {
            System.err.println("An unexpected error occurred: " + e.getMessage());
        } finally {
            close();
        }

    }

    public static void connect(String node, int port) {
        Cluster cluster = Cluster.builder()
            .addContactPoint(node)
            .withPort(port)
            .build();
        session = cluster.connect("cbd_108215_ex2");
        System.out.println("Connected to cluster: " + cluster.getMetadata().getClusterName());
    }

    public static void close() {
        if (session != null){
            session.close();
            System.out.println("Connection closed");
     }   
    }

    public static void queryData(String query, Object... args) {
        try{
            PreparedStatement statement = session.prepare(query);
            BoundStatement boundStatement = new BoundStatement(statement);
            ResultSet rs = session.execute(boundStatement.bind(args));
            for (Row row : rs) {
                System.out.println(row.toString());
            }
        } catch (Exception e) {
            System.err.println("An unexpected error occurred: " + e.getMessage());
        }
    }

    public static void insertData(String query, Object... args) {
        try{
            PreparedStatement statement = session.prepare(query);
            BoundStatement boundStatement = new BoundStatement(statement);
            session.execute(boundStatement.bind(args));
            System.out.println("Insertion successful.");
        } catch (Exception e) {
            System.err.println("An unexpected error occurred: " + e.getMessage());
        }
    }

    public static void updateData(String query, Object... args) {
        try{
            PreparedStatement statement = session.prepare(query);
            BoundStatement boundStatement = new BoundStatement(statement);
            session.execute(boundStatement.bind(args));
            System.out.println("Update successful.");
        } catch (Exception e) {
            System.err.println("An unexpected error occurred: " + e.getMessage());
        }
    }

    public static void deleteData(String query, Object... args) {
        try{
            PreparedStatement statement = session.prepare(query);
            BoundStatement boundStatement = new BoundStatement(statement);
            session.execute(boundStatement.bind(args));
            System.out.println("Deletion successful.");
        } catch (Exception e) {
            System.err.println("An unexpected error occurred: " + e.getMessage());
        }
    }
    
    private static List<Integer> getFollowedVideosIds(String username){
        try {
            List<Integer> videosIds = new ArrayList<>();
            String query = "SELECT video_id FROM video_followers WHERE follower_username = ? ALLOW FILTERING";
            PreparedStatement statement = session.prepare(query);
            BoundStatement boundStatement = new BoundStatement(statement);
            ResultSet rs = session.execute(boundStatement.bind(username));

            for (Row row : rs) {
                videosIds.add(row.getInt("video_id"));
            }

            return videosIds;

        } catch (Exception e) {
            System.out.println("Cannot get followed videos ids: " + e.getMessage());
            return null;
        }
    }

    private static void queryCommentsByVideo(int videoId){
        try {
            String query = "SELECT * FROM comments_by_video WHERE video_id = ?";
            PreparedStatement statement = session.prepare(query);
            BoundStatement boundStatement = new BoundStatement(statement);
            ResultSet rs = session.execute(boundStatement.bind(videoId));

            for (Row row : rs) {
                System.out.println("Video ID: " + videoId + " - Comment: " + row.getString("comment"));
            }

        } catch (Exception e) {
            System.out.println("Cannot get comments by video: " + e.getMessage());
        }
    }

    public static void getCommentsForFollowedVideos(String username){
        try {
            List<Integer> videosIds = getFollowedVideosIds(username);
            for (int videoId : videosIds) {
                queryCommentsByVideo(videoId);
            }
        } catch (Exception e) {
            System.out.println("Cannot get comments for followed videos: " + e.getMessage());
        }
    }

    public static void queryVideoRatings() {
        String query = "SELECT video_id, MAX(rating_value) as max_rating, MIN(rating_value) as min_rating FROM video_ratings GROUP BY video_id";
        try {
            PreparedStatement statement = session.prepare(query);
            BoundStatement boundStatement = new BoundStatement(statement);
            ResultSet rs = session.execute(boundStatement);
    
            for (Row row : rs) {
                int videoId = row.getInt("video_id");
                int maxRating = row.getInt("max_rating");
                int minRating = row.getInt("min_rating");
                System.out.println("Video ID: " + videoId + " - Max Rating: " + maxRating + ", Min Rating: " + minRating);
            }
        } catch (Exception e) {
            System.out.println("Cannot get video ratings: " + e.getMessage());
        }
    }

    public static void queryCommentCountByVideo() {
        String query = "SELECT video_id, COUNT(*) as comment_count FROM comments_by_video GROUP BY video_id";
        try {
            PreparedStatement statement = session.prepare(query);
            BoundStatement boundStatement = new BoundStatement(statement);
            ResultSet rs = session.execute(boundStatement);
    
            for (Row row : rs) {
                int videoId = row.getInt("video_id");
                long commentCount = row.getLong("comment_count");
                System.out.println("Video ID: " + videoId + " - Comment Count: " + commentCount);
            }
        } catch (Exception e) {
            System.out.println("Cannot get comment count by video: " + e.getMessage());
        }
    }
    
    


}   
