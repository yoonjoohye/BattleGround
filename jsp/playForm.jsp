<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/play.css">
</head>
<body>
<div id="aside1">
<jsp:include page="login.jsp"/><br>
<div id="list">
    <ul>
      <li><strong>무기구</strong>
        <ul>
          <li><a href="play.jsp?re=HG">HG</a></li>
          <li><a href="play.jsp?re=SMG">SMG</a></li>
          <li><a href="play.jsp?re=AR">AR</a></li>
        </ul>
      </li>
    </ul>
    
    <ul>
      <li><strong>부착물</strong>
        <ul>
          <li><a href="play.jsp?re=총구">총구</a></li>
          <li><a href="play.jsp?re=손잡이">손잡이</a></li>
		  <li><a href="play.jsp?re=조준경">조준경</a></li>
        </ul>
      </li>
    </ul>
    
     <ul>
      <li><strong>방어구</strong>
        <ul>
          <li><a href="play.jsp?re=착용템">착용템</a></li>
          <li><a href="play.jsp?re=회복템">회복템</a></li>
        </ul>
      </li>
    </ul>
 </div>
</div>

<fieldset>
<%
request.setCharacterEncoding("UTF-8");
String kind=request.getParameter("re");
try {
    // 드라이버 로딩
    String dbURL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
	PreparedStatement pstmt=null;
	pstmt=con.prepareStatement("select * from item where smallkind=?");
	pstmt.setString(1,kind);
	
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){%>
	<div id="item">
   	 	<a href="item.jsp?re=<%=rs.getString("id")%>"><img src="../battle_img/<%=rs.getString("imgpath")%>"></a><br/>
    	<%=rs.getString("name")%><br/>
  	</div>
	<% } 
		rs.close();
		pstmt.close();
	   	con.close();
   	
} catch (Exception e) {        
    System.out.println("DB 연동 실패 " + e.getMessage());
}
%> 
</fieldset>

</body>
</html>