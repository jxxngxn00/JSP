<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="member.beans.MemberDao" %>
 
 <%
 	String userId = request.getParameter("id");
 	MemberDao dao = MemberDao.getInstance();
 	boolean result = dao.isDuplicatedId(userId);
 	
 	//out.write(result+"");
 	out.print(result);
 %>