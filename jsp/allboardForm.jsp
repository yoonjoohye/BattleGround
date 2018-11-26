<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/myboard.css">

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
%>
<div id="form">
<form method="post" action="allboardAction.jsp">
<table id="board" border=0px cellspacing=0 width=100% height=100%>
		<center>
	    <div id="label" style="
	    width:50%;
	 	border:3px solid white;
	 	border-radius:30px;
	 	color: white;
	 	font-size: 20px;
	 	padding: 3px;
	 	margin-bottom: 20px;">게시물 관리</div></center>
<tr>
		<th height=50px>X</th>
		<th>제목</th>		
		<th>날짜</th>
		<th>작성자</th>
		<th>조회수</th>
	</tr>
<%
try {
    // 드라이버 로딩
    String dbURL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
	PreparedStatement pstmt=null;
	pstmt=con.prepareStatement("select * from board");
	ResultSet rs = pstmt.executeQuery();

	while(rs.next()){
	%>
	
	   	<tr align="center">
	   		<td><input type="checkbox" name="check" value=<%=rs.getString("id")%>></td>
			<td><a href="board.jsp?re=<%=rs.getString("id")%>"><%=rs.getString("title")%></a></td>
			<td><%=rs.getString("writedate")%></td>
			<td><%=rs.getString("user_id") %></td>
			<td><%=rs.getString("visit")%></td>
		</tr>  
<% } %>	
	</table>
<%
		rs.close();
		pstmt.close();
	   	con.close();
   	
	} catch (Exception e) { 
		out.println("아직 게시물이 없습니다.");
	    System.out.println("DB 연동 실패 " + e.getMessage());
	}
%> 
<div style="text-align:center;"><a href="boardAdd.jsp"><input type="button" value="게시물 등록"></a>
<input style="float:right;" type="submit" value="게시물 삭제">
</div>
</form>
</div>
</body>
</html>