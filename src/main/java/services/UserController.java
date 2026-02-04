package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.AdminUserModel;
import model.adminModel;
import util.DBConnection;

public class UserController {
	
	//connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//Insert Data Function
	public static boolean insertdata (String name, String email, String role) {
		boolean isSuccess = false;
		try {
			//DB Connection Call
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//SQL QUERY
			String sql = "Insert into users (name, email, role) values('"+name+"', '"+email+"', '"+role+"')";
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//GetById
	public static List<AdminUserModel> getById (String Id){
		
		int convertedID = Integer.parseInt(Id);
		
		ArrayList <AdminUserModel> user = new ArrayList<>();
		
		try {
			
			//DBconnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from users where id '"+convertedID+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String role = rs.getString(4);
				
				AdminUserModel us = new AdminUserModel(id, name, email, role);
				user.add(us);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	//GetAll Data
	public static List<AdminUserModel> getAllUser(){
		ArrayList <AdminUserModel> users = new ArrayList<>();
		
		try {
			
			//DBconnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from users";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String role = rs.getString(4);
				
				AdminUserModel us = new AdminUserModel(id, name, email, role);
				users.add(us);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	//Update Data
	public static boolean updateData(String id, String name, String email, String role) {
	    try {
	        // DB connection
	        con = DBConnection.getConnection();
	        stmt = con.createStatement();
	        
	        //SQL Query
	        String sql = "update users set name='"+name+"', email='"+email+"', role='"+role+"'"+"where id='"+id+"'";
	        
	        int rs = stmt.executeUpdate(sql);
	        
	        if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
	        
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    	return isSuccess;
	}
	
	//Delete Data
	public static boolean deletedata(String id) {
		int convID = Integer.parseInt(id);
		
		try {
			 //DBConnection
			 con = DBConnection.getConnection();
		     stmt = con.createStatement();
		     
		     //SQL
		     String sql = "delete from users where id='"+convID+"'";
		     int rs = stmt.executeUpdate(sql);
		     
		     if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//getTotal Users
	public int getTotalUsers() {
	    int totalUsers = 0;
	    Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;

	    try {
	        // Get DB connection
	        con = DBConnection.getConnection();

	        // Create and execute SQL query
	        String sql = "SELECT COUNT(*) FROM users";
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(sql);

	        // Process the result
	        if (rs.next()) {
	            totalUsers = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // Clean up resources
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
	        try { if (con != null) con.close(); } catch (Exception e) {}
	    }

	    return totalUsers;
	}
	
	//Login validate
	public static List<adminModel> loginvalidate (String email, String password){

	ArrayList<adminModel> admin = new ArrayList<>();

	try {
		//DBConnection
		 con = DBConnection.getConnection();
	     stmt = con.createStatement();

	     String sql = "select * from admin where email='"+email+"' and password='"+password+"'";
	     rs = stmt.executeQuery(sql);

	     if (rs.next()) {

	    	 int id = rs.getInt(1);
	    	 String name = rs.getString(2);
	    	 String nic = rs.getString(3);
	    	 String gmail = rs.getString(4);
	    	 String phone = rs.getString(5);
	    	 String pass = rs.getString(6);

	    	 adminModel p = new adminModel(id,name,nic,gmail,phone,pass);
	    	 admin.add(p);
	     }

		} catch (Exception e) {

			e.printStackTrace();
		}

			return admin;

		}

}
