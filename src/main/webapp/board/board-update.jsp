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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<%
	String biNum = request.getParameter("biNum");
	
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "SELECT BI_NUM, BI_TITLE, BI_CONTENT, BI_WRITER, BI_CREDAT, BI_CNT FROM BOARD_INFO";
	sql += " WHERE BI_NUM=" + biNum;
	ResultSet rs = stmt.executeQuery(sql);
//	String biTitle = rs.getString("BI_TITLE"); 오류남 (rs.next()를 안해서 지금 메타데이터를 보고 있음, 다음값이 첫번째 실제 데이터)
	if(!rs.next()) {	// 게시물이 없으면(누르기 전에 삭제됐으면)
%>
		<script>
			alert("없는 데이터");
			history.back();
		</script>
<%	
		return;
	}
%>
<form action="<%=root%>/board/board-update-ok.jsp">
<input type="hidden" name="biNum" value="<%=biNum %>">
<table border="15" style="border-color: green; border-style: dashed;">
	<tr>
		<th>제목</th>
		<td>
			<input type="text" id="biTitle" name="biTitle" value="<%=rs.getString("BI_TITLE") %>">
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" id="biWriter" name="biWriter" value="<%=rs.getString("BI_WRITER") %>">
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea id="biContent" name="biContent" style="resize:none" cols="30" rows="15">
				<%=rs.getString("BI_CONTENT") %>
			</textarea>
		</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><%=rs.getString("BI_CREDAT") %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=rs.getInt("BI_CNT") %></td>
	</tr>
	<tr>
		<th colspan="2">
			<button>수정</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>