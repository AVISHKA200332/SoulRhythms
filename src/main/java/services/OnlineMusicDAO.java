package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Song;
import model.User;

public class OnlineMusicDAO {
	
	public Connection dbConnection() {
		Connection con = null;
		
		String url="jdbc:mysql://localhost:3306/onlinmusic";
		String un="root";
		String pw="2259933";
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection(url,un,pw);
		System.out.println("DataBase Connection Success");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public boolean userCheck(String un, String up) {
		Connection con=dbConnection();
	
		try {
			String query = "SELECT * FROM udetail WHERE un=? AND pw=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, un);
			ps.setString(2, up);
			
			ResultSet rs=ps.executeQuery();
			
			
			if(rs.next()) {
				return true;
			}
			}catch(Exception e) {
		}
		return false;
}

	public List<Song> getAllSong() {
		List<Song>sList = new ArrayList<>();
		Connection con= dbConnection();
		
		String query ="SELECT * FROM song";
		
		try {
			PreparedStatement sl=con.prepareStatement(query);
			ResultSet rs=sl.executeQuery();
			
			while(rs.next()) {
				int sId= rs.getInt("sId");
				String sName=rs.getString("sName");
				String aName=rs.getString("aName");
				String price=rs.getString("price");
				
				sList.add(new Song(sId,sName,aName,price));
			}
		}catch(Exception e) {
			e.printStackTrace();
			}
		return sList;
	}


	public void registerUser(User us) {
	    Connection con = dbConnection();
	    String sql = "INSERT INTO udetail(un, pw, address, email) VALUES (?, ?, ?, ?)";

	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, us.getUsername());
	        ps.setString(2, us.getPassword());
	        ps.setString(3, us.getAddress());
	        ps.setString(4, us.getEmail());

	        ps.executeUpdate();
	        System.out.println("User inserted into database.");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}

	
