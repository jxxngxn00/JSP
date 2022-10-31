<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 변수 선언할때 -->
<%! String msg; %>

<%
	msg = "안녕하세요~~";
%>

<!-- HTML 주석 -->
<%-- JSP 주석 --%>
<% //JAVA 주석 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 변수 출력 -->
메세지 : <%= msg %>
</body>
</html>