<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/board.css">
</head>
<body>
<%
request. setCharacterEncoding("utf-8");
String id=request.getParameter("re");
%>
<center>
<fieldset>
<table border cellspacing=0>
 <%
 try{
	String DB_URL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	PreparedStatement p=null;
	p = con.prepareStatement("update board set visit=visit+1 where id=?");
	p.setString(1,id);
	p.executeUpdate();
	p.close();
	
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("select * from board where id=?");
	pstmt.setString(1,id);
	
	ResultSet rs = pstmt.executeQuery();
    while(rs.next())
    {%>
		<tr>
			<td colspan=3 height=30px><%=rs.getString("title")%></td>
		</tr> 
    	<tr>
			<td width=300px height=30px><%=rs.getString("writedate")%></td>
			<td><%=rs.getString("user_id")%></td>
			<td><%=rs.getString("visit")%></td>
		</tr>
		<tr>
			<td colspan=3><%=rs.getString("content")%></td>
		</tr>  
 	<%}
    rs.close();
    pstmt.close();
    con.close(); 
 }
 catch(Exception e){
	 System.out.println(e);
 }
%>
</table><br>
<a href="news.jsp"><input type="button" value="목록"></a>
</fieldset>
</center>
</body>
</html>