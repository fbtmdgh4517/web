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
<title>사용자</title>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<table border="15" style="border-color: green; border-style: dashed;">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
	</tr>
<%
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "SELECT UI_NUM, UI_ID, UI_PWD, UI_NAME FROM USER_INFO";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) {
%>
		<tr>
			<td><%=rs.getInt("UI_NUM")%></td>
			<td>
				<a href="<%=root%>/user/user-view.jsp?uiNum=<%=rs.getInt("UI_NUM")%>">
					<%=rs.getString("UI_ID")%>
				</a>
			</td>
			<td><%=rs.getString("UI_PWD")%></td>
			<td><%=rs.getString("UI_NAME")%></td>
		</tr>
<%
	}
%>
	<tr>
		<th>
			<button onclick="location.href='/web/user/user-insert.jsp'">등록</button>
		</th>
	</tr>
</table>
</body>
</html>