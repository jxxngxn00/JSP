<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1) 이전 화면에서 사용자 입력값들을 얻어오기
	//		- request.getParameter('') : 하나씩 받아옴
	//		- request.getParameterValues('') : 여러개를 받아옴
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String occupation = request.getParameter("occupation");
	
	String[] hobby = request.getParameterValues("hobby");
	String hobbyTxt = "";
	if( hobby != null) {
		for(String s:hobby){ hobbyTxt = s+", "; }
	} else {hobbyTxt ="선택된 값이 없습니다.";}
	/*
	for(int i=0; hobby!=null && i<hobby.length ; i++){
	hobbyTxt += hobby[i]+" / "; 
		}*/
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>check</title>
</head>
<body>
	<!-- 2) 얻어온 입력값들을 화면에 출력하기 -->
	<h2>폼의 입력값 넘겨받아 처리</h2>
	입력한 이름 : <%= name  %> <br/>
	입력한 성별 : <%= gender %> <br/>
	입력한 직업 : <%= occupation %> <br/>
	입력한 취미 : <%= hobbyTxt %> <br/>
</body>
</html>