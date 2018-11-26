<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String path=request.getRealPath("/battle_img");
	
	MultipartRequest multi=new MultipartRequest(request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
	
	String item=multi.getParameter("item");
	String bigKind = multi.getParameter("bigKind");
	String smallKind = multi.getParameter(bigKind);
	int size=Integer.parseInt(multi.getParameter("size"));
	int attack=Integer.parseInt(multi.getParameter("attack"));
	int shield=Integer.parseInt(multi.getParameter("shield"));
	int damage=Integer.parseInt(multi.getParameter("damage"));
	String fileName = multi.getFilesystemName("myimg");
	
	String img=path+"\\"+fileName;
	try {
	    // 드라이버 로딩
	    String dbURL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	    String dbID = "root";
	    String dbPW="1234";
	   	
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
	   	
	   	PreparedStatement pstmt=null;   	
		
	   	pstmt = con.prepareStatement("insert into item values(NULL,?,?,?,?,?,?,?,?)");
	   	pstmt.setString(1,item);
	 	pstmt.setString(2,bigKind);
	   	pstmt.setString(3,smallKind);
	   	pstmt.setInt(4,size);
	   	pstmt.setInt(5,attack);
	   	pstmt.setInt(6,shield);
	   	pstmt.setInt(7,damage);
		pstmt.setString(8,fileName);
	   	
	   	pstmt.executeUpdate();
	   	pstmt.close();
	   	con.close();
	   	
	   	System.out.println("연동 성공!");
	   	out.println("<script>");
		out.println("alert('아이템 등록완료');");
		out.println("location.href='index.jsp';");
		out.println("</script>");
		
	} catch (Exception e) {
		out.println("<script>");
		out.println("alert('오류!');");
		out.println("location.href='itemAdd.jsp';");
		out.println("</script>");
	    System.out.println("DB 연동 실패 " + e.getMessage());
	}
%>
