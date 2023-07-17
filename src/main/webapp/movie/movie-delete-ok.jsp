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
	String miNum = request.getParameter("miNum");
	
	Connection con = DBCon.getCon();
	String sql = "DELETE FROM MOVIE_INFO";
	sql += " WHERE MI_NUM=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, miNum);
	
	int result = pstmt.executeUpdate();
	
	if(result == 1) {
%>
		<script>
			alert("삭제 완료되었다.");
			location.href = "<%=root%>/movie/movie-list.jsp";
		</script>
<%
	}
%>
</body>
</html>