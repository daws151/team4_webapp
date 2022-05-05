package client.team4_webapp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {

        Class.forName("org.mariadb.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts","TravelExpertsAdmin","password");
        return conn;
    }
}
