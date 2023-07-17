<%@page import="java.sql.PreparedStatement"%>
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
<form>
<input type="text" placeholder="제목" name="biTitle" id="biTitle" value="<%=request.getParameter("biTitle") == null ? "" : request.getParameter("biTitle")%>"/>
<input type="text" placeholder="작성자" name="biWriter" id="biWriter" value="<%=request.getParameter("biWriter") == null ? "" : request.getParameter("biWriter")%>"/>
<input type="text" placeholder="내용" name="biContent" id="biContent" value="<%=request.getParameter("biContent") == null ? "" : request.getParameter("biContent")%>"/>
<button>검색</button>
</form>
<table border="15" style="border-color: green; border-style: dashed;">
	<tr border="15" style="border-color: green; border-style: dashed;">
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>삭제</th>
	</tr>
<%
	Connection con = DBCon.getCon();
	String sql = "SELECT BI.BI_NUM, BI.BI_TITLE, UI.UI_NAME, ";
	sql += " BI.BI_CREDAT, BI.BI_CNT FROM BOARD_INFO BI ";
	sql += " INNER JOIN USER_INFO UI ";
	sql += " ON BI.BI_WRITER = UI.UI_NUM";
	
	String biTitle = request.getParameter("biTitle") == null ? "" : request.getParameter("biTitle");
	String biWriter = request.getParameter("biWriter") == null ? "" : request.getParameter("biWriter");
	String biContent = request.getParameter("biContent") == null ? "" : request.getParameter("biContent");
	
	if(!biTitle.isEmpty() && biWriter.isEmpty() && biContent.isEmpty()) {
		sql += " WHERE BI_TITLE LIKE CONCAT('%', ?, '%')";
	} else if(biTitle.isEmpty() && !biWriter.isEmpty() && biContent.isEmpty()) {
		sql += " WHERE BI_WRITER LIKE CONCAT('%', ?, '%')";
	} else if(biTitle.isEmpty() && biWriter.isEmpty() && !biContent.isEmpty()) {
		sql += " WHERE BI_CONTENT LIKE CONCAT('%', ?, '%')";
	} else if(!biTitle.isEmpty() && !biWriter.isEmpty() && biContent.isEmpty()) {
		sql += " WHERE BI_TITLE LIKE CONCAT('%', ?, '%') AND BI_WRITER LIKE CONCAT('%', ?, '%')";
	} else if(!biTitle.isEmpty() && biWriter.isEmpty() && !biContent.isEmpty()) {
		sql += " WHERE BI_TITLE LIKE CONCAT('%', ?, '%') AND BI_CONTENT LIKE CONCAT('%', ?, '%')";
	} else if(biTitle.isEmpty() && !biWriter.isEmpty() && !biContent.isEmpty()) {
		sql += " WHERE BI_WRITER LIKE CONCAT('%', ?, '%') AND BI_CONTENT LIKE CONCAT('%', ?, '%')";
	} else if(!biTitle.isEmpty() && !biWriter.isEmpty() && !biContent.isEmpty()) {
		sql += " WHERE BI_TITLE LIKE CONCAT('%', ?, '%') AND BI_WRITER LIKE CONCAT('%', ?, '%') AND BI_CONTENT LIKE CONCAT('%', ?, '%')";
	}
	
	PreparedStatement pstmt = con.prepareStatement(sql);	// preparedstatement는 만들때 그 안에 sql을 바로 집어넣음, 그래서 execute문에 sql 넣을 필요 무
	
	if(!biTitle.isEmpty() && biWriter.isEmpty() && biContent.isEmpty()) {
		pstmt.setString(1, biTitle);
	} else if(biTitle.isEmpty() && !biWriter.isEmpty() && biContent.isEmpty()) {
		pstmt.setString(1, biWriter);
	} else if(biTitle.isEmpty() && biWriter.isEmpty() && !biContent.isEmpty()) {
		pstmt.setString(1, biContent);
	} else if(!biTitle.isEmpty() && !biWriter.isEmpty() && biContent.isEmpty()) {
		pstmt.setString(1, biTitle);
		pstmt.setString(2, biWriter);
	} else if(!biTitle.isEmpty() && biWriter.isEmpty() && !biContent.isEmpty()) {
		pstmt.setString(1, biTitle);
		pstmt.setString(2, biContent);
	} else if(biTitle.isEmpty() && !biWriter.isEmpty() && !biContent.isEmpty()) {
		pstmt.setString(1, biWriter);
		pstmt.setString(2, biContent);
	} else if(!biTitle.isEmpty() && !biWriter.isEmpty() && !biContent.isEmpty()) {
		pstmt.setString(1, biTitle);
		pstmt.setString(2, biWriter);
		pstmt.setString(3, biContent);
	}
	
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
%>
		<tr border="15" style="border-color: green; border-style: dashed;">
			<td><%=rs.getInt("BI_NUM")%></td>
			<td>
				<a href="<%=root%>/board/board-view.jsp?biNum=<%=rs.getInt("BI_NUM")%>">
					<%=rs.getString("BI_TITLE")%>
				</a>
			</td>
			<td><%=rs.getString("UI_NAME")%></td>
			<td><%=rs.getString("BI_CREDAT")%></td>
			<td><%=rs.getInt("BI_CNT")%></td>
			<td>
				<button type="button" onclick="location.href='<%=root%>/board/board-delete-ok.jsp?biNum=<%=rs.getInt("BI_NUM")%>'">삭제</button>
			</td>
		</tr>
<%
	}
%>
	<tr border="15" style="border-color: green; border-style: dashed;">
		<td colspan="6" align="right">
			<button onclick="location.href='/web/board/board-insert.jsp'">등록</button>
		</td>
	</tr>
</table>
</body>
</html>