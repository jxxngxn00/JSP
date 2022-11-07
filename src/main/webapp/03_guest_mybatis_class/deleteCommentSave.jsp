<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>   
  
 <!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
 <% 
 	request.setCharacterEncoding("utf-8");

 	int commentNo = Integer.parseInt( request.getParameter("cId"));
	Comment comment = CommentService.getInstance()
			.selectCommentByPrimaryKey(commentNo);

 	CommentService.getInstance().deleteComment(comment);
 	
 	response.sendRedirect("listComment.jsp");
 %>