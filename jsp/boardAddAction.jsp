<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id=null;
if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
}
if(id==null){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.');");
	out.println("location.href='login.jsp';");
	out.println("</script>");
}

String title=request.getParameter("title");
String content=request.getParameter("content");

try {
    String dbURL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
   	PreparedStatement pstmt=null; 
   	pstmt = con.prepareStatement("insert into board values(NULL,?,?,?,now(),NULL,0)");
   	pstmt.setString(1,id);
   	pstmt.setString(2,title);
   	pstmt.setString(3,content);
   	
   	pstmt.executeUpdate();
   	pstmt.close();
   	con.close();
%>
	<script>
		location.href="index.jsp";
		alert("등록완료!");
	</script>
<%
} catch (Exception e) {       
	response.sendRedirect("boardAdd.jsp");  
    System.out.println("DB 연동 실패 " + e.getMessage());
} 
%>