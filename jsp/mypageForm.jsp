<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/mypage.css">
<%
String id=null;
String pw=null;
String name=null;
String birth=null;

if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
	pw=(String)session.getAttribute("userPw");
	name=(String)session.getAttribute("userName");
	birth=(String)session.getAttribute("userBirth");
}
if(id==null){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.');");
	out.println("location.href='index.jsp';");
	out.println("</script>");
}
%>
<script>
function send(index){
	if(index==1){
		var pw=mypageForm.edit_pw.value;
		var name=mypageForm.edit_name.value;
		var birth=mypageForm.edit_birth.value;
		if(pw==""||name==""||birth==""){
			alert("정보를 모두 입력해주세요!");
			return;
		}
		else{
			mypageForm.action="mypageAction.jsp"
		}
	}
	if(index==2){
		var pw=mypageForm.edit_pw.value;
		if(pw!=<%=pw%>){
			alert("비밀번호를 다시 확인해주세요.");
		}
		else{
			var check=confirm("정말 탈퇴하시겠습니까?");
			if(check==true){
				mypageForm.action="delmember.jsp";
			}else{
				return false;
			}
		}
	}
	mypageForm.submit();
}
</script>
</head>
<body>
<center>
<form name="mypageForm" method="post">
<br>
<div id="label">회원 정보 수정</div>
<table>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="edit_id" value="<%=id%>" disabled/></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="edit_pw"/></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="edit_name" value="<%=name%>"/></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td><input type="date" name="edit_birth" value="<%=birth%>"/></td>
	</tr>
	<tr>
		<td align="center" colspan=2>
			<input type="button" onclick="send(1)" value="수정"/>
			<input type="reset" value="취소"/>
		</td>
	</tr>
</table><br><br>
<div align="right"><input type="button" id="del" onclick="send(2)" value="회원탈퇴"/></div>
</form>
</center>
</body>
</html>