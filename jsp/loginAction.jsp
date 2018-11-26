<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");

try{
	String DB_URL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
	 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	 
	PreparedStatement pstmt=null;   	
	pstmt=con.prepareStatement("select * from member");
	
	ResultSet rs = pstmt.executeQuery();
	Boolean check=false;
	while(rs.next())
    {
	     if (id.equals(rs.getString("user_id")) && pw.equals(rs.getString("user_pw")))
	     {
		    check=true;
		    session.setAttribute("userId",rs.getString("user_id"));
		    session.setAttribute("userPw",rs.getString("user_pw"));
		    session.setAttribute("userName",rs.getString("user_name"));
	    	session.setAttribute("userBirth",rs.getString("user_birth"));
	    	break;
	     }
	     else
	     {
	    	 check=false;
	     }
    }
	if(check==true){
		String userid=(String)session.getAttribute("userId");
	    String name=(String)session.getAttribute("userName");
	    
	    if(id.equals("yoon")){
			out.println("<script>");
			out.println("location.href='index.jsp';");
			out.println("alert('관리자 페이지입니다.');");
			out.println("</script>");
		}
	    else{
	    	out.println("<script>");
		    out.println("location.href='index.jsp'");
			out.println("alert('"+name+"님 환영합니다.');");
			out.println("</script>");
	    }
	    System.out.println("성공");
    }
    else{
    	System.out.println("실패");
    	out.println("<script>");
    	out.println("location.href='index.jsp'");
		out.println("alert('로그인 정보가 맞지 않습니다.');");
		out.println("</script>");
    }
    rs.close();
    pstmt.close();
    con.close();     
}
   catch(Exception e) {
    System.out.println(e);
   } 
%>