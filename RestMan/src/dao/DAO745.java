package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO745 {
	public static Connection con;
	public DAO745() {
		if(con == null) {
			String dbUrl = "jdbc:mysql://localhost:3306/restman?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=UTF-8";
			String dbClass = "com.mysql.jdbc.Driver";
			try {
				Class.forName(dbClass);
				con = DriverManager.getConnection(dbUrl, "root", "123456VU");
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}