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
	String miTitle = request.getParameter("miTitle");
	if(miTitle != null && miTitle.length() != 0) {
		String miDesc = request.getParameter("miDesc");
		String miGenre = request.getParameter("miGenre");
		String miCreDate = request.getParameter("miCreDate");
		String miCnt = request.getParameter("miCnt");
		Connection con = DBCon.getCon();
		String sql = "INSERT INTO movie_info(MI_TITLE, MI_DESC, MI_GENRE, MI_CREDATE, MI_CNT) VALUES (?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, miTitle);
		pstmt.setString(2, miDesc);
		pstmt.setString(3, miGenre);
		pstmt.setString(4, miCreDate);
		pstmt.setString(5, miCnt);
		int result = pstmt.executeUpdate();
		if(result == 1) {
%>
			<script>
				alert("작성 되었다.");
				location.href = '<%=root%>/movie2/movie2-list.jsp';
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
			<input type="text" name="miTitle">
		</td>
	</tr>
	<tr>
		<th>설명</th>
		<td>
			<textarea name="miDesc" rows="15" cols="20"></textarea>
		</td>
	</tr>
	<tr>
		<th>장르</th>
		<td>
			<input type="text" name="miGenre">
		</td>
	</tr>
	<tr>
		<th>개봉일</th>
		<td>
			<input type="date" name="miCreDate">
		</td>
	</tr>
	<tr>
		<th>관객수</th>
		<td>
			<input type="number" name="miCnt">
		</td>
	</tr>
	<tr>
		<th colspan="5" align="right">
			<button>등록</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>