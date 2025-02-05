package com.marondal.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	
	private Connection connection;
	
	
	// 데이터 베이스 접속
	public boolean connect() {
		
		// database 서버 접속
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			// 접속 주소, 포트, 사용할 데이터베이스
			String url = "jdbc:mysql://localhost:3306/dulumary_250108";
			// 사용자 이름, 비밀번호 
			String id = "root";
			String password = "root";
			
			connection = DriverManager.getConnection(url, id, password);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		}
		
		return true;
		
		
	}
	
	// 조회 쿼리 수행 기능
	public ResultSet select(String query) {
		 try {
			Statement statement = connection.createStatement();
			
			return statement.executeQuery(query);
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			return null;
		}
		 
	}
	
	// 저장, 수정, 삭제 쿼리 수행기능 
	
	
	// 데이터 베이스 접속 끊기
	public boolean disconnect() {
		try {
			connection.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	

}
