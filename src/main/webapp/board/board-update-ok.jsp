<%@page import="java.sql.PreparedStatement"%>
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
	String biTitle = request.getParameter("biTitle");
	String biContent = request.getParameter("biContent");
	String biWriter = request.getParameter("biWriter");
	
	Connection con = DBCon.getCon();
//	Statement stmt = con.createStatement();
	String sql = "UPDATE BOARD_INFO SET BI_TITLE=?,";
	sql += " BI_CONTENT=?,";
	sql += " BI_WRITER=?";
	sql += " WHERE BI_NUM=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, biTitle);
	pstmt.setString(2, biContent);
	pstmt.setString(3, biWriter);
	pstmt.setString(4, biNum);
	int result = pstmt.executeUpdate();
	if(result == 1) {
%>
		<script>
			alert("수정 완료되었다.");
			location.href = "<%=root%>/board/board-view.jsp?biNum=<%=biNum%>";
		</script>
<%
	}
%>
biNum : <%=biNum %><br>
biTitle : <%=biTitle %><br>
biContent : <%=biContent %><br>
biWriter : <%=biWriter %><br>
</body>
</html>