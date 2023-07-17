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
<table border="15" style="border-color: green; border-style: dashed;">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>장르</th>
		<th>개봉일</th>
		<th>관객수</th>
		<th>삭제</th>
	</tr>
<%
	Connection con = DBCon.getCon();
	String sql = "SELECT MI_NUM, MI_TITLE, MI_DESC, MI_GENRE, MI_CREDATE, MI_CNT FROM MOVIE_INFO";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
%>
		<tr>
			<td><%=rs.getString("MI_NUM") %></td>
			<td>
				<a href="<%=root%>/movie/movie-view.jsp?miNum=<%=rs.getString("MI_NUM") %>">
					<%=rs.getString("MI_TITLE") %>
				</a>
			</td>
			<td><%=rs.getString("MI_GENRE") %></td>
			<td><%=rs.getString("MI_CREDATE") %></td>
			<td><%=rs.getString("MI_CNT") %></td>
			<td>
				<button onclick="location.href='<%=root%>/movie/movie-delete-ok.jsp?miNum=<%=rs.getString("MI_NUM")%>'">삭제</button>
			</td>
		</tr>
<%
	}
%>
	<tr>
		<th colspan="6" align="right">
			<button onclick="location.href='<%=root %>/movie/movie-insert.jsp'">등록</button>
		</th>
	</tr>
</table>
</body>
</html>