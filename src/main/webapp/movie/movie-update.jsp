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
	String miNum = request.getParameter("miNum");
	
	Connection con = DBCon.getCon();
	String sql = "SELECT MI_NUM, MI_TITLE, MI_GENRE, MI_DESC, DATE_FORMAT(MI_CREDATE, '%Y-%m-%d') MI_CREDATE, MI_CNT FROM MOVIE_INFO";
	sql += " WHERE MI_NUM=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, miNum);
	ResultSet rs = pstmt.executeQuery();
	if(!rs.next()) {
%>
		<script>
			alert("이미 삭제된");
			location.href="<%=root%>/movie/movie-list.jsp";
		</script>
<%
	}
%>
<form action="<%=root %>/movie/movie-update-ok.jsp">
<input type="hidden" name="miNum" id="miNum" value="<%=miNum%>">
<table border="15" style="border-color: green; border-style: dashed;">
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="miTitle" id="miTitle" value="<%=rs.getString("MI_TITLE")%>"/>
		</td>
	</tr>
	<tr>
		<th>장르</th>
		<td>
			<input type="text" name="miGenre" id="miGenre" value="<%=rs.getString("MI_GENRE")%>"/>
		</td>
	</tr>
	<tr>
		<th>설명</th>
		<td>
			<textarea name="miDesc" id="miDesc" rows="15" cols="30">
				<%=rs.getString("MI_DESC")%>
			</textarea>
		</td>
	</tr>
	<tr>
		<th>개봉일</th>
		<td>
			<input type="date" name="miCreDate" id="miCreDate" value="<%=rs.getString("MI_CREDATE")%>" />
		</td>
	</tr>
	<tr>
		<th>관객수</th>
		<td>
			<input type="number" name="miCnt" id="miCnt" value="<%=rs.getString("MI_CNT")%>"/>
		</td>
	</tr>
	<tr>
		<th colspan="4" align="right">
			<button>수정</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>