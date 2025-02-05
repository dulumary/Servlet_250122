package com.marondal.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/db/ex01")
public class Ex01Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		// used_goods 테이블의 모든 행을 조회해서 response 에 담기 
		
		try {
			// database 서버 접속
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			// 접속 주소, 포트, 사용할 데이터베이스
			String url = "jdbc:mysql://localhost:3306/dulumary_250108";
			// 사용자 이름, 비밀번호 
			String id = "root";
			String password = "root";
			
			Connection connection = DriverManager.getConnection(url, id, password);
			
			// 쿼리 작성
			String query = "SELECT * FROM `used_goods`";
			
			// 쿼리 수행
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(query);
			
			while(resultSet.next()) {				
				String title = resultSet.getString("title");
				int price = resultSet.getInt("price");
				String description = resultSet.getString("description");
				
				// 제목 : ~~ 가격 : ~~ 설명 : ~~
				out.println("제목 : " + title + " 가격 : " + price + " 설명 : " + description);
			}
			
			statement.close();
			
//			statement = connection.createStatement();
//			
//			query = "INSERT INTO `used_goods`\r\n"
//					+ "(`sellerId`, `title`, `price`, `description`)\r\n"
//					+ "VALUES \r\n"
//					+ "(3, '고양이 간식 팝니다', 2000, '저희 고양이가 입맛이 까다로워서 안먹어요');";
//			
//			// INSERT, UPDATE, DELETE
//			// 실행된 행의 개수
//			int count = statement.executeUpdate(query);
//			
//			out.println("삽입 결과 : " + count);
//			
//			statement.close();
			 
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	

}
