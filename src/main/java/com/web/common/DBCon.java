package com.web.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {
	private static final String URL = "jdbc:mariadb://localhost:3306/kd";
	private static final String DRIVER_NAME = "org.mariadb.jdbc.Driver";
	private static final String USER = "root";
	private static final String PASSWORD = "kd1824java";
	
	static {
		try {
			Class.forName(DRIVER_NAME);
			System.out.println("이거 나오면 드라이버 찾은거임");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	public static Connection getCon() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("커넥션 잘 나옴");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void main(String[] args) {
		getCon();
	}
	
//	public static int changeStringToInt(String str) throws Exception {
//		try {
//			return Integer.parseInt(str);
//		} catch(Exception e) {
//			throw new Exception("숫자 서");
//		}
//	}
//	
//	public static void main(String[] args) {
//		int num;
//		try {
//			num = changeStringToInt("onetwo");
//			System.out.println(num);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("프로그램이 종료되었다.");	
//		// try catch를 하면 마지막거 실행됨, 그래서 오류처리할거 뒤에 꼭 실행해야 할거 있으면 throws Exception 하지 말고 try catch
//	}
}
