<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
<div style="background-color: black">
	<a style="color: red; font-size: 32px" href="<%=root%>">Home</a>
	<a style="color: orange; font-size: 32px" href="<%=root%>/login.jsp">Login</a>
	<a style="color: yellow; font-size: 32px" href="<%=root%>/join.jsp">Join</a>
	<a style="color: green; font-size: 32px" href="<%=root%>/board.jsp">Board</a>
</div>