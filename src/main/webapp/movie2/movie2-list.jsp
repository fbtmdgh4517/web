<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = DBCon.getCon();
	String sql = "SELECT MI_NUM, MI_TITLE, MI_GENRE, MI_CREDATE, MI_CNT FROM movie_info";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<table border="15" style="border-color: green; border-style: dashed;">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>장르</th>
		<th>개봉일</th>
		<th>관객수</th>
	</tr>
<%
	while(rs.next()) {
%>		
		<tr>
			<td><%=rs.getString("MI_NUM") %></td>
			<td>
				<a href="<%=root%>/movie2/movie2-view.jsp?miNum=<%=rs.getString("MI_NUM")%>">
					<%=rs.getString("MI_TITLE") %>
				</a>
			</td>
			<td><%=rs.getString("MI_GENRE") %></td>
			<td><%=rs.getString("MI_CREDATE") %></td>
			<td><%=rs.getString("MI_CNT") %></td>
		</tr>
<%
	}
%>
	<tr>
		<th colspan="5" align="right">
			<button onclick="location.href='<%=root%>/movie2/movie2-insert.jsp'">등록</button>
		</th>
	</tr>
</table>
</body>
</html>