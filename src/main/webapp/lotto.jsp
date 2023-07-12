<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="10">
		<%
		Random r = new Random();
		ArrayList<Integer> rNums = new ArrayList<>();
		for (int i = 0; i < 6; i++) {
			rNums.add(r.nextInt(45) + 1);
		}
		%>
		<tr>
			<%
			for (Integer rNum : rNums) {
			%>
			<td><%=rNum%></td>
			<%
			}
			%>
		</tr>
	</table>
</body>
</html>