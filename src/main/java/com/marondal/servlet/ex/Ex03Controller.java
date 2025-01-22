package com.marondal.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/servlet/ex03")
public class Ex03Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html");
		response.setContentType("application/json");
		
		// 이름과 생년월일을 전달 받고
		// 이름과 나이를 html로 표현 
		
		PrintWriter out = response.getWriter();
		
		// request 로 부터 name이란 이름으로 이름을 얻어다 쓸꺼니 
		// 이 기능 쓰고 싶으면 name 이란 이름으로 이름을 전달해!
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");  // 20040312
		
		String yearString = birthday.substring(0, 4);
		
		int year = Integer.parseInt(yearString);
		
		int age = 2025 - year + 1;
		
		// 이름:김인규, 나이:25
		// 데이터를 문자열로 표현하기 위한 규격
		// JSON (javascript Object notation)
		// ["김인규", "유재석"]
		// {"국어":90, "영어":80}
		// {"name":"김인규", "age":25}
		
		out.println("{\"name\":\"" + name + "\", \"age\":" + age + "}");
		
		
//		out.println(""
//				+ "<html>\n"
//				+ "		<head><title>정보</title></head>\n"
//				+ "		<body>\n"
//				+ "			<h3>이름 : " + name + "</h3>\n"
//				+ "			<h3>나이 : " + age + "</h3>\n"
//				+ "		</body>\n"
//				+ "</html>");
		
		
	}

}
