package com.marondal.database.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marondal.common.MysqlService;

@WebServlet("/db/user/create")
public class UserCreateController extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
//		response.setContentType("text/plain");
//		PrintWriter out = response.getWriter();	
		
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String introduce = request.getParameter("introduce");
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		mysqlService.connect();
		
		String query = "INSERT INTO `new_user`\r\n"
				+ "(`name`, `yyyymmdd`, `email`, `introduce`)\r\n"
				+ "VALUE \r\n"
				+ "('" + name + "', '" + birthday + "', '" + email + "', '" + introduce + "');";
		
		int count = mysqlService.update(query);
		
//		out.println(query);
//		out.println("삽입 결과 : " + count);
		
		// 클라이언트야 내려줄 정보는 없고, list.jsp 페이지를 새롭게 요청하면 입력한 결과를 볼 수 있을꺼야
		// response - list.jsp 로 새로운 요청을 해 
		// redirect
		
		response.sendRedirect("/db/user/list.jsp");
		
	}

}
