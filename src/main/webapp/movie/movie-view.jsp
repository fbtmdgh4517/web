<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.web.common.DBCon"%>
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
	String miNum = request.getParameter("miNum");
	
	Connection con = DBCon.getCon();
	String sql = "SELECT MI_NUM, MI_TITLE, MI_DESC, MI_GENRE, MI_CREDATE, MI_CNT FROM MOVIE_INFO";
	sql += " WHERE MI_NUM=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, miNum);
	ResultSet rs = pstmt.executeQuery();
	if(!rs.next()) {
%>
		<script>
			alert("이미 삭제된");
			location.href = '<%=root%>/movie/movie-list.jsp';
		</script>
<%
	}
%>
<table border="15" style="border-color: green; border-style: dashed;">
	<tr>
		<th>등록번호</th>
		<td><%=rs.getString("MI_NUM") %></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%=rs.getString("MI_TITLE") %></td>
	</tr>
	<tr>
		<th>장르</th>
		<td><%=rs.getString("MI_GENRE") %></td>
	</tr>
	<tr>
		<th>설명</th>
		<td><%=rs.getString("MI_DESC") %></td>
	</tr>
	<tr>
		<th>상영일</th>
		<td><%=rs.getString("MI_CREDATE") %></td>
	</tr>
	<tr>
		<th>관객수</th>
		<td><%=rs.getString("MI_CNT") %></td>
	</tr>
	<tr>
		<th colspan="7" align="right">
			<button onclick="location.href='<%=root%>/movie/movie-update.jsp?miNum=<%=miNum%>'">수정</button>
		</th>
	</tr>
</table>
</body>
</html>