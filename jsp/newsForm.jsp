<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/news.css">
</head>
<body>
<div id="aside1">
<jsp:include page="login.jsp"/>
</div>
<%
String id=null;
if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
}
else{
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.');");
	out.println("location.href='index.jsp';");
	out.println("</script>");
}
%>
<table id="board" border=0px cellspacing=0 width=100% height=100%>
	<tr>
		<th>번호</th>
		<th>제목</th>		
		<th>날짜</th>
		<th>작성자</th>
		<th>조회수</th>
	</tr>
 <%
 try{
	String DB_URL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	 
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("select * from board");
    ResultSet rs = pstmt.executeQuery();
    while(rs.next())
    {%>
    	<tr align="center">
			<td><%=rs.getString("id")%></td>
			<td><a href="board.jsp?re=<%=rs.getString("id")%>"><%=rs.getString("title")%></a></td>
			<td><%=rs.getString("writedate")%></td>
			<td><%=rs.getString("user_id") %></td>
			<td><%=rs.getString("visit")%></td>
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
</table>
</body>
</html>