package com.marondal.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MysqlService {
	
	private Connection connection;
	
	// 클래스를 설계하는 입장에서 
	// 해당 클래스의 객체가 하나 이상 만들어 지지 않도록 관리한다
	// 하나의 객체를 공유해서 사용하도록한다. 
	// Singleton pattern
	// static 멤버변수 : 객체 생성없이 사용할 수 있는 멤버변수 
	private static MysqlService mysqlService = null;
	
	private MysqlService() {
		
	}
	
	// static 메소드 : 객체 생성없이 호출할 수 있는 메소드
	public static MysqlService getInstance() {
		
		if(mysqlService == null) {
			mysqlService = new MysqlService();
		}
		
		return mysqlService;
		
	}
	
	// 데이터 베이스 접속
	public boolean connect() {
		
		// 데이터베이스 접속이 되어 있는 경우 접속 과정 진행하지 않음
		try {
			if(connection != null && !connection.isClosed()) {
				return false;
			}
		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}
		
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
	public List<Map<String, Object>> select(String query) {
		 try {
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(query);
			
			// [
			//		{"id":3, "name":"네이버", "url":"https://naver.com"},
			//		{"id":4, "name":"마론달", "url":"http://marondal.com"},
			// ]
			
			// 조회된 결과 컬럼 목록 
			ResultSetMetaData rsmd = resultSet.getMetaData();
			int columnCount = rsmd.getColumnCount();
			
			List<String> columnList = new ArrayList<>();
			for(int i = 1; i <= columnCount; i++) {
				columnList.add(rsmd.getColumnName(i));
			}
			
			List<Map<String, Object>> resultList = new ArrayList<>();
			
			while(resultSet.next()) {
				
				Map<String, Object> resultMap = new HashMap<>();
				
				for(String column:columnList) {
					resultMap.put(column, resultSet.getObject(column));
				}
				
				resultList.add(resultMap);
			}
			
			statement.close();
			return resultList;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			return null;
		}
		 
	}
	
	// 저장, 수정, 삭제 쿼리 수행기능 
	public int update(String query) {
		
		try {
			Statement statement = connection.createStatement();
			
			return statement.executeUpdate(query);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			return -1;
		}
		
	}
	
	
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
