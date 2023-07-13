<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="com.web.vo.HumanVO"%>
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
	String[] names = {"김홍균", "김아영", "이명관", "이왕균", "이보성"};
	Random r = new Random();
	int rNum = r.nextInt(5);
	List<HumanVO> humanList = new ArrayList<>();
	for(int i=0; i<names.length; i++){
		HumanVO human = new HumanVO();
		human.setName("");
		humanList.add(human);		
	}
	
	for(int i=0; i<names.length; i++) {
		rNum = r.nextInt(5);
		for(int j=0; j<i; j++) {
			if(names[rNum].equals(humanList.get(j).getName())) {
				i--;
				break;
			}
		}
		if("".equals(humanList.get(i).getName())) {
			humanList.get(i).setName(names[rNum]);
		}
	}
%>
<table border="15">
	<tr>
		<th>이름</th>
		<th>나이</th>
		<th>주소</th>
	</tr>
	<%for(int i=0; i<humanList.size(); i++) { %>
		<tr>
			<td><%=humanList.get(i).getName() %></td>
			<td><%=humanList.get(i).getAge() %></td>
			<td><%=humanList.get(i).getAddr() %></td>
		</tr>	
	<%} %>
</table>
</body>
</html>