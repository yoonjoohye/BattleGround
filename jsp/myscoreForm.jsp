<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/myscore.css">
<script src="../js/myscore.js"></script>
</head>
<body>
<form name="myscoreForm" method="post" action="myscoreAction.jsp">
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
 	margin-bottom: 20px;">내 점수 등록</div>
 	
	<label>킬  </label>
	<input type="number" name="kill"><br>
	
	<label>치유</label>
	<input type="number" name="heal"><br>
		
	<label>랭킹</label>
	<input type="number" name="rank"><br><br>
	
	<input type="button" onclick="send()" value="등록">
	<input type="reset" value="취소"><br>
</center>
</fieldset>
</form>
</body>
</html>