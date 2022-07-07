
import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	public static Connection getCon() {
		try {
			String url = "jdbc:mysql://localhost:3306/osp";
			String username = "root";
					
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, null);
			
			return con;
			
		} catch(Exception e){
			System.out.print(e);
			return null;
		}
		
	}

}
