<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/login.css">
<script src= "../js/login.js"></script>
</head>
<body>
<%
String id=null;
String name=null;
if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
	name=(String)session.getAttribute("userName");
}
if(id==null){
%>
<form name="loginForm" method="post" action="loginAction.jsp">
<table id="login">
    <tr>
      <th>아이디</th>
      <td><input type="text" name="id"></td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td><input type="password" name="pw"></td>
    </tr>
    <tr>
      <td> </td>
      <td>
        <a href="join.jsp">회원가입</a>
        <input type="button" onclick="login()" value="로그인">
      </td>
    </tr>
</table>
</form>
<%} 
else if(id.equals("yoon")){
%>
<table id="box">
<tr>
	<th>관리자님</th>
	<td><a href="logout.jsp">로그아웃</a></td>
</tr>
<tr>
	<td><a href="member.jsp">회원관리</a></td>
	<td><a href="itemAdd.jsp">아이템등록</a></td>
	<td><a href="allboard.jsp">게시물관리</a></td>
</tr>
</table>
<%}else{%>
<table id="box">
<tr>
	<th><%=name%>님</th>
	<td><a href="logout.jsp">로그아웃</a></td>
</tr>
<tr>
	<td><a href="mypage.jsp">마이페이지</a></td>
	<td><a href="myboard.jsp">내 게시물</a></td>
	<td><a href="myinfo.jsp">내 점수</a></td>
</tr>
</table>
<%} %>
</body>
</html>