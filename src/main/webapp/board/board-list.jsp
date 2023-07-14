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
<title>게시판</title>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<table border="15" style="border-color: green; border-style: dashed;">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
<%
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "SELECT BI_NUM, BI_TITLE, BI_WRITER, ";
	sql += " BI_CREDAT, BI_CNT FROM BOARD_INFO";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) {
%>
		<tr>
			<td><%=rs.getInt("BI_NUM")%></td>
			<td>
				<a href="<%=root%>/board/board-view.jsp?biNum=<%=rs.getInt("BI_NUM")%>">
					<%=rs.getString("BI_TITLE")%>
				</a>
			</td>
			<td><%=rs.getString("BI_WRITER")%></td>
			<td><%=rs.getString("BI_CREDAT")%></td>
			<td><%=rs.getInt("BI_CNT")%></td>
		</tr>
<%
	}
%>
	<tr>
		<td colspan="5" align="right">
			<button onclick="location.href='/web/board/board-insert.jsp'">등록</button>
		</td>
	</tr>
</table>
</body>
</html>