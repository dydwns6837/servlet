package com.test.lesson04;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/quiz01")
public class Lesson04Quiz01 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/plain");
		
		MysqlService ms = MysqlService.getInstance();
		ms.connect();
		
		String insertQuery = "insert into `real_estate`"
				+ "(`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`)"
				+ "values"
				+ "(3, '헤라펠리스 101동 5305호', 125, '매매', 1500000, NULL)";
				
		try {
			ms.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 쿼리문 수행 (select) & 결과 출력
		String selectQuery = "select * from `real_estate`";
		PrintWriter out = response.getWriter();
		
		try {
			ResultSet resultSet = ms.select(selectQuery);
			while (resultSet.next()) { // 결과 행이 있는 동안 반복.
				out.print("매물주소: ");
				out.print(resultSet.getString("address"));
				out.print(", 면적: ");
				out.print(resultSet.getInt("area"));
				out.print(", 타입: ");
				out.print(resultSet.getString("type"));
				out.println("");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ms.disconnect();
	}
}
