<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
	List<String> names = new ArrayList<>();
	names.add("김세희");
	names.add("김용준");
	names.add("이원준");
	names.add("이원기");
	names.add("이보성");
	names.add("이왕균");
	
	List<Integer> points = new ArrayList<>();
	points.add(80);
	points.add(77);
	points.add(99);
	points.add(66);
	points.add(55);
	points.add(54);
	
	List<String> addrs = new ArrayList<>();
	addrs.add("서울");
	addrs.add("부산");
	addrs.add("대전");
	addrs.add("대구");
	addrs.add("경기");
	addrs.add("광주");
	
	/*int min = points.get(0);
	int minIdx = 0;
	int max = points.get(0);
	int maxIdx = 0;
	
	for(int i=1; i<points.size(); i++) {
		if(min > points.get(i)) {
			min = points.get(i);
			minIdx = i;
		}
		if(max < points.get(i)) {
			max = points.get(i);
			maxIdx = i;
		}
	}*/
	
	List<Map<String, String>> stdInfo = new ArrayList<>();
	
	for(int i=0; i<names.size(); i++){
		Map<String, String> map = new HashMap<>();
		map.put("name", names.get(i));
		map.put("point", Integer.toString(points.get(i)));
		map.put("addr", addrs.get(i));
		stdInfo.add(map);
	}
	
	int minPoint = Integer.parseInt(stdInfo.get(0).get("point"));
	int maxPoint = Integer.parseInt(stdInfo.get(0).get("point"));
	String minName = "";
	String maxName = "";
	String minAddr = "";
	String maxAddr = "";
	
	for(int i=1; i<stdInfo.size(); i++) {
		if(minPoint > Integer.parseInt(stdInfo.get(i).get("point"))) {
			minName = stdInfo.get(i).get("name");
			minPoint = Integer.parseInt(stdInfo.get(i).get("point"));
			minAddr = stdInfo.get(i).get("addr");
		}
		if(maxPoint < Integer.parseInt(stdInfo.get(i).get("point"))) {
			maxName = stdInfo.get(i).get("name");
			maxPoint = Integer.parseInt(stdInfo.get(i).get("point"));
			maxAddr = stdInfo.get(i).get("addr");
		}
	}
%>
<table border="10">
	<tr>
		<th>최고점</th>
		<td><%=maxName %>, <%=maxPoint %>, <%=maxAddr %></td>
		<%-- <td><%=names.get(maxIdx) %>, <%=points.get(maxIdx) %>, <%= addrs.get(maxIdx) %></td> --%>
	</tr>
	<tr>
		<th>최저점</th>
		<td><%=minName %>, <%=minPoint %>, <%=minAddr %></td>
		<%-- <td><%=names.get(minIdx) %>, <%=points.get(minIdx) %>, <%= addrs.get(minIdx) %></td> --%>
	</tr>
</table>
</body>
</html>