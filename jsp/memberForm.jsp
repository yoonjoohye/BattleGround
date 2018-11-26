<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/member.css">
 </head>
 <body>
 <center>
 <form method="post" action="memberAction.jsp">
	<table align=center border=0 cellspacing=0>
	<br>
 <div id="label" style="
    width:50%;
 	border:3px solid white;
 	border-radius:30px;
 	color: white;
 	font-size: 20px;
 	padding: 3px;
 	margin-bottom: 20px;">회원관리</div>
	<tr align="center">
		<th height=60px>X</th>
		<th>아이디</th>		
		<th>비밀번호</th>
		<th>이름</th>
		<th>생년일일</th>
		<th>가입일자</th>
	</tr>
 <%
 try{
	String DB_URL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	 
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("select * from member");
    ResultSet rs = pstmt.executeQuery();
    while(rs.next())
    {%>
    	<tr align=center>
		<td><input type="checkbox" name="check" value=<%=rs.getString("user_id")%>></td>
		<td><%=rs.getString("user_id")%></td>
		<td><%=rs.getString("user_pw")%></td>
		<td><%=rs.getString("user_name")%></td>
		<td><%=rs.getString("user_birth")%></td>
		<td><%=rs.getString("joindate")%></td>
		</tr>    
 	<%}
    rs.close();
    pstmt.close();
    con.close(); 
 }
 catch(Exception e){
	 
 }
%>
</table>
<input type="submit" value="회원삭제">
</form>
</center>
 </body>
</html>