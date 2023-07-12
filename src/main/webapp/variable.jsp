<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!private String str = "1";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="10">
		<%
		for (int i = 1; i <= 9; i++) {
		%>
		<tr>
			<td>
				<%=i %>단
			</td>
			<%
			for (int j = 1; j <= 9; j++) {
			%>
			<td><%=i%> X <%=j%> = <%=i * j%></td>
			<%
			}
			%>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>