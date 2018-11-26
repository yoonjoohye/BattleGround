<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	out.println("location.href='index.jsp';");
	out.println("</script>");
}

int kill=Integer.parseInt(request.getParameter("kill"));
int heal=Integer.parseInt(request.getParameter("heal"));
int rank=Integer.parseInt(request.getParameter("rank"));

try {
    String dbURL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
   	PreparedStatement pstmt=null; 
   	pstmt = con.prepareStatement("insert into score values(NULL,?,?,?,?)");
   	pstmt.setString(1,id);
   	pstmt.setInt(2,kill);
   	pstmt.setInt(3,heal);
   	pstmt.setInt(4,rank);
   	
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
	response.sendRedirect("myscore.jsp");  
    System.out.println("DB 연동 실패 " + e.getMessage());
} 
%>
