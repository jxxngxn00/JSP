<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입  </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('input[name="id"]').next().click( function() {

		if ($('input[name="id"]').val() == null
					$('input[name="id"]').val() == ' ') {
			alert("입력된 아이디 값이 없습니다.");
		} else {
		var param = { id : $('input[name="id"]').val() }
		$.ajax({
					url : 'CheckId.jsp',
					data : param,
					success : check
				})//ajax
			}
		})//click

		function check(data) {
			if (data.trim() == 'true') {
				$('div#result').text('이미 존재하는 아이디 입니다.');
				$('div#result').show();

			} else if (data.trim() == 'false') {
				$('div#result').text('사용 가능한 아이디 입니다.');
				$('div#result').show();

			}//else if
		}//check

	})
</script>
</head>
<body>

<h1>회원가입서 작성하기</h1>
 	<!-- java 파일과 name이 같은지 항상 확인 -->
	<form action="InsertMember.jsp" method="post" name="frm">
		<table>
			<tr>
				<td width="100">
				<font color="blue">아이디</font>
				</td>
				<td width="100">
				<input type="text" name="id">
				<input type="button" value="중복확인"><br/>
				<div id='result'></div>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호</font>
				</td>
				<td width="100">
				<input type="password" name="password"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호학인</font>
				</td>
				<td width="100">
				<input type="password" name="repassword"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">이름</font>
				</td>
				<td width="100">
				<input type="text" name="name"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">전화번호</font>
				</td>
				<td>
				<input type="text" size="15" name="tel"/>
				<br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">주소</font>
				</td>
				<td>
				<input type="text" size="50" name="addr"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				 <!--로그인 버튼-->
				 <input type="submit" value="회원가입">
				</td>
				<td width="100">
				<input type="reset" name="cancel" value="취소"><br/>
				</td>
			</tr>
		</table>
	</form>



 </body>
</html>
    