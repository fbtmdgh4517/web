<%@page import="java.util.Collections"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Random r = new Random();
	List<Integer> rNums = new ArrayList<>();
	rNums.add(r.nextInt(100) + 1);
	
	for (int i=0; i<9; i++) {
		int rNum = r.nextInt(100) + 1;
		if (rNums.contains(rNum)) {
			i--;
		} else {
			rNums.add(rNum);
		}
	}
	
	Collections.sort(rNums);
	
	%>
	<table border="10">		
		<tr>
			<td colspan="1"><%=rNums %></td>
		</tr>
		<tr>
			<td>최솟값</td>
			<td><%=rNums.get(0) %></td>
		</tr>
		<tr>
			<td>최댓값</td>
			<td><%=rNums.get(rNums.size()-1) %></td>
		</tr>
	</table>
</body>
</html>