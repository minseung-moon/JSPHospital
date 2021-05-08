package DBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "abc";
		String password = "1234";
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			System.out.println("successe Connect");
		}catch(ClassNotFoundException e){
			System.out.println("can't worng Driver");
		}catch(SQLException e){
			System.out.println("fail connect");
		}
		
		return con;
	}
	
//	public static void main(String[] args) {
//		DBConn.getConnection();
//	}
}
