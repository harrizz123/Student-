package stu_info1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/student_info3";
    private static final String USER = "root"; 
    private static final String PASSWORD = "Trini@4002"; 
    public static Connection getConnection() throws SQLException {
        Connection conn = null;
        
        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");  
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connection established: " + conn);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL JDBC Driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Database connection failed.");
        }
        
        return conn;
    }
    public static void closeConnection(Connection conn) {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Connection closed.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}