<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	List<Integer> numList = new ArrayList<>();
	numList.add(10);
	numList.add(5);
	numList.add(21);
	
	List<Map<String, Integer>> mapList = new ArrayList<>();
	Map<String, Integer> map = new HashMap<>();
	map.put("age", 10);
	mapList.add(map);
	map = new HashMap<>();
	map.put("age", 5);
	mapList.add(map);
	map = new HashMap<>();
	map.put("age", 21);
	mapList.add(map);
	
	for(int i=0; i<mapList.size(); i++) {
		for(int j=i+1; j<mapList.size(); j++) {
			if(mapList.get(i).get("age") > mapList.get(j).get("age")) {
				int tmp = mapList.get(i).get("age");
				mapList.get(i).put("age", mapList.get(j).get("age"));
				mapList.get(j).put("age", tmp);
			}
		}
	}
%>
<table border="15">
	<%for(int i=0; i<mapList.size(); i++) {
	%>
	<tr>
		<th><%=i %></th>
		<td><%=mapList.get(i).get("age") %></td>
	</tr>	
	<%} %>	
</table>
</body>
</html>