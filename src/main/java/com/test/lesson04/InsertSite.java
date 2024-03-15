package com.test.lesson04;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/quiz02_insert")
public class InsertSite extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		// request params
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		// DB 연결
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		// DB insert
		String insertQuery = "insert into `site`"
				+ "(`name`, `url`)"
				+ "values"
				+ "('" + name + "', '" + url + "')";
		try {
			ms.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// DB 연결 해제
		ms.disconnect();
		
		// 목록 화면으로 이동 - 302 Redirect
		response.sendRedirect("/lesson04/quiz02/quiz02_1.jsp");
	}
}
