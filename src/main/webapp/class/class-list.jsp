<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스</title>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<table border="15" style="border-color: green; border-style: dashed;">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>desc</th>
	</tr>
<%
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "SELECT CI_NUM, CI_NAME, CI_DESC FROM CLASS_INFO";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) {
%>
		<tr>
			<td><%=rs.getInt("CI_NUM")%></td>
			<td>
				<a href="<%=root%>/class/class-view.jsp?ciNum=<%=rs.getInt("CI_NUM")%>">
					<%=rs.getString("CI_NAME")%>
				</a>
			</td>
			<td><%=rs.getString("CI_DESC")%></td>
		</tr>
<%
	}
%>
	<tr>
		<th><button onclick="location.href = '/web/class/class-insert.jsp'">등록</button></th>
	</tr>
</table>
</body>
</html>