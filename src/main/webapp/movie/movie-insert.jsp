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
	String miTitle = request.getParameter("miTitle");
	if(miTitle != null && miTitle.length() != 0){
		String miGenre = request.getParameter("miGenre");
		String miDesc = request.getParameter("miDesc");
		String miCreDate = request.getParameter("miCreDate");
		String miCnt = request.getParameter("miCnt");
		
		Connection con = DBCon.getCon();
		String sql = "INSERT INTO MOVIE_INFO(MI_TITLE, MI_GENRE, MI_DESC, MI_CREDATE, MI_CNT)";
		sql += " VALUES (?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, miTitle);
		pstmt.setString(2, miGenre);
		pstmt.setString(3, miDesc);
		pstmt.setString(4, miCreDate);
		pstmt.setString(5, miCnt);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1) {
%>
			<script>
				alert("등록 완료되었다.");
				location.href='<%=root%>/movie/movie-list.jsp';
			</script>
<%
		}
		
	}
%>
<form>
<table border="15" style="border-color: green; border-style: dashed;">
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="miTitle" id="miTitle"/>
		</td>
	</tr>
	<tr>
		<th>장르</th>
		<td>
			<input type="text" name="miGenre" id="miGenre"/>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="miDesc" id="miDesc" rows="15" cols="30"></textarea>
		</td>
	</tr>
	<tr>
		<th>개봉일</th>
		<td>
			<input type="date" name="miCreDate" id="miCreDate"/>
		</td>
	</tr>
	<tr>
		<th>관객수</th>
		<td>
			<input type="number" name="miCnt" id="miCnt"/>
		</td>
	</tr>
	<tr>
		<th colspan="4" align="right">
			<button>등록</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>