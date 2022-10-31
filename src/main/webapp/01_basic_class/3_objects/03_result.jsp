<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_result.jsp</title>
</head>
<body>
<!-- 이전 화면에서 사용자 입력값을 얻어와서
		- request.getParameter("") : 클라이언트 -> 서버
		- request.getParameterValues("") : 여러개를 받아올 경우
		
 화면 출력 -->
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String[] animal = request.getParameterValues("animal");
String choosePet = "";
if (animal != null) {
	for (int i = 0; i < animal.length; i++)
		choosePet += animal[i];
}
%>


이름 : <%= name %> <br/>
좋아하는 동물 : <%= choosePet %>
<% 
%>

</body>
</html>