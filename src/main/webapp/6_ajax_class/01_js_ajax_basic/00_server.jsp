<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// ***  한글이 깨지는 문제가 있지만 전반적인 흐름만 이해합니다.
	request.setCharacterEncoding("UTF-8");
	
	// request 2
	// 1. 이전 화면에서 넘겨받은 데이타
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");
	
	// 2. 다시 화면으로 보낼 데이터 구성
	cate="changed_"+cate+"_by_server";
	name="from_"+name+"_server";
	//out.write("00_normal_web.jsp?"+"cate="+ cate+"&name=" + name);
	
	// response 2 를 request 3으로 바꿔서 다시 response 3
	// resquest 3 : 바뀐 cate와 name의 값을 요청, sendRedirect의 ()안에 들어있는 내용
	// 3. 다시 00_normal_web.jsp 요청
	response.sendRedirect("00_normal_web.jsp?"+"cate="+ cate+"&name=" + name);
%>    
