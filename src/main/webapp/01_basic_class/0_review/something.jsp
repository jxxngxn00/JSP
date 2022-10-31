<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.*" %>
<%
	//0. 한글처리
	request.setCharacterEncoding("utf-8");
	//1. 이전 폼의 입력값 얻어오기
	//2. VO 객체에 저장하기
	MemberVO vo = new MemberVO();
	vo.setRealname(request.getParameter("realname"));
	vo.setNickname(request.getParameter("nickname"));
	vo.setEmail(request.getParameter("myemail"));
	vo.setAge(Integer.parseInt(request.getParameter("myage")));
	
	//3. DB에 입력하기
	MemberDAO dao = MemberDAO.getInstance(); //Singleton pattern 
	dao.insert(vo);
	
	//4.  출력은 알아서
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출력</title>
</head>
<body>
<h2>입력결과</h2>
본명 	:<%= vo.getRealname() %><br/>
별명 	:<%= vo.getNickname() %><br/>
이메일	:<%= vo.getEmail() %><br/>
나이 	:<%= vo.getAge() %><br/>
</body>
</html>