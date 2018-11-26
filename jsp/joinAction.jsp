<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String id=request.getParameter("user_id");
String pw=request.getParameter("user_pw");
String name=request.getParameter("user_name");
String birth=request.getParameter("user_birth");

try {
    String dbURL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW ="1234";
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
    
    PreparedStatement pstmt=null; 
    pstmt=con.prepareStatement("INSERT INTO member VALUES (?,?,?,?,now())");
    pstmt.setString(1,id);
   	pstmt.setString(2,pw);
   	pstmt.setString(3,name);
   	pstmt.setString(4,birth);
   	
   	pstmt.executeUpdate();
    
   	pstmt.close();
    con.close();
%>
<script>
	alert("회원가입을 축하드립니다.");
	location.href="index.jsp";
</script>   
<%    
} catch (Exception e) {%>   
	<script>alert('아이디 중복을 확인 해주세요!');</script>
<%	response.sendRedirect("join.jsp");
    System.out.println("DB 연동 실패 " + e.getMessage());
} 
%>