<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://localhost:3306/kd";
	String user = "root";
	String password = "kd1824java";
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	String sql = "SELECT * FROM CLASS_INFO";
	ResultSet rs = stmt.executeQuery(sql);
%>
<table border="1">
	<tr>
		<th>과목번호</th>
		<th>과목명</th>
		<th>DESC</th>
	</tr>
	
	<%
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getInt("CI_NUM") + "</td>");
			out.println("<td>" + rs.getString("CI_NAME") + "</td>");
			out.println("<td>" + rs.getString("CI_DESC") + "</td>");
			out.println("</tr>");
		}
	%>
</table>
</body>
</html>