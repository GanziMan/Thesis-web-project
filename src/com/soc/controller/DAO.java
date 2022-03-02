
package com.soc.controller;
import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet;
import java.text.SimpleDateFormat; 
import java.util.Date;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
public class DAO { 
	private String userID; private String userPassword;  
	private String userDate; private Date nowTime = new Date();
	private Connection con; private ResultSet rs; String time; 
	public DAO() { 
		try { 
			String dbURL = "jdbc:mysql://localhost:3307/jspPj"; 
			String dbID = "root"; String dbPassword = "0955"; Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection(dbURL, dbID, dbPassword); } catch (Exception e) { e.printStackTrace(); } }  
			
	public int login(String userID, String userPassword) { 
		try { 
			PreparedStatement pst = con.prepareStatement("SELECT userPassword FROM loginDB WHERE userID = ?"); 
			pst.setString(1, userID); rs = pst.executeQuery(); 
			if (rs.next()) { 
				return rs.getString(1).equals(userPassword) ? 1 : 0; } 
			else { return -2; } 
			} catch (Exception e) { 
				e.printStackTrace(); return -1; }
			} 

	public boolean ID_Check(String userID) { 
		try { 
			PreparedStatement pst = con.prepareStatement("SELECT * FROM loginDB WHERE userID = ?"); 
			pst.setString(1, userID); rs = pst.executeQuery(); 
			if (rs.next()) { 
				return false; 
				} 
			else {
				return true; 
				}
			} catch (Exception e) 
			{
			e.printStackTrace(); 
			} return false; }  

	public int join(DAO userDAO) { 
		if(!ID_Check(userDAO.getUserID())) return 0; 
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") ;
			time=fm.format(nowTime);
			try { 
					PreparedStatement pst = con.prepareStatement("INSERT INTO loginDB VALUES (?,?,?,?)");
					pst.setString(1, userDAO.getUserID()); 
					pst.setString(2, userDAO.getUserPassword());   
					pst.setString(3, userDAO.getUserDate());
					pst.setString(4, time); return pst.executeUpdate(); } catch (Exception e) { e.printStackTrace(); return -1; } }
			public DAO getUser(String userID) { 
				try { 
						PreparedStatement pst = con.prepareStatement("SELECT * FROM loginDB WHERE userID = ?"); 
						pst.setString(1, userID); rs = pst.executeQuery(); 
						if (rs.next()) { DAO userDAO = new DAO();
							userDAO.setUserID(rs.getString(1)); 
							userDAO.setUserPassword(rs.getString(2)); 
							userDAO.setUserDate(rs.getString(3)); 
							userDAO.settime(rs.getString(4));
							return userDAO; 
							} 
					} catch (Exception e) 
					{ 
						e.printStackTrace(); 
						} return null; 
											} 
		public String getUserID() { return userID; }
		public void setUserID(String userID) { this.userID = userID; }
		public String getUserPassword() { return userPassword; } 
		public void setUserPassword(String userPassword) { this.userPassword = userPassword; } 
		public String getUserDate() { return userDate; } 
		public void setUserDate(String userDate) { this.userDate = userDate; } 
		public String gettime() {
			return time;
		}
			public void settime(String time) { 
			this.time=time;
		}

}



