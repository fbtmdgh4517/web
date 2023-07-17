<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp" %>
<%
	String biNum = request.getParameter("biNum");
	Connection con = DBCon.getCon();
	String sql = "DELETE FROM BOARD_INFO WHERE BI_NUM=?";
	PreparedStatement pstmt = con.prepareStatement(sql);	//preparestatement는 sql을 먼저 만들고 만들어야 됨
	pstmt.setString(1, biNum);
	
	int result = pstmt.executeUpdate();
	if(result != 1){
%>
		<script>
			alert('이미 삭제된 게시물입니다.');
			location.href = '<%=root%>/board/board-list.jsp';
		</script>
<%
		return;
	}
%>
	<script>
		alert('정상삭제되었다.');
		location.href = '<%=root%>/board/board-list.jsp';
	</script>
<%=biNum%>