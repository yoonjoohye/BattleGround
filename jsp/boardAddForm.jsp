<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/boardAdd.css">
<script src= "../js/boardAdd.js"></script>
</head>
<body>
<form name="boardAddForm" method="post" action="boardAddAction.jsp">
    <fieldset>
    <center>
    <div id="label" style="
    width:50%;
 	border:3px solid white;
 	border-radius:30px;
 	color: white;
 	font-size: 20px;
 	padding: 3px;
 	margin-top: 20px;
 	margin-bottom: 20px;">게시물 등록하기</div></center>
      <input type="text" name="title" placeholder="제목"><br><br>
      <textarea name="content" rows=20 cols=100 placeholder="내용"></textarea><br><br>
      <input type=button onclick="send()" value="등록">
      <input type=reset value="취소">
    </fieldset>
  </form>
</body>
</html>