<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/item.css">
</head>
<body>
<%
request. setCharacterEncoding("utf-8");
String id=request.getParameter("re");
try {
    // 드라이버 로딩
    String dbURL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    String dbID = "root";
    String dbPW="1234";
   	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   	Connection con = DriverManager.getConnection(dbURL, dbID, dbPW);
   	
   	PreparedStatement pstmt=null;
	pstmt=con.prepareStatement("select * from item where id=?");
	pstmt.setString(1,id);
	
	ResultSet rs = pstmt.executeQuery();
	
   while(rs.next()){%>
   <fieldset>
   <center>
      <b><%=rs.getString("name") %></b><br><br>
      <img class="i1" src="../battle_img/<%=rs.getString("imgpath")%>"><br><br>
      <table border cellspacing=0>
          <tr>
            <th>분류</th>
            <td><%=rs.getString("smallkind") %></td>
          </tr>
          <tr>
            <th>용량</th>
            <td><%=rs.getInt("size") %></td>
          </tr>
      </table><br>
      전투력
      <div id="back">
        <div id="graph1">
        </div>
      </div><br>
      방어력
      <div id="back">
        <div id="graph2">
        </div>
      </div><br>
      피해량
      <div id="back">
        <div id="graph3">
        </div>
      </div><br>
      </center>
 <%
    String user_id=null;
	if(session.getAttribute("userId")!=null){
	user_id=(String)session.getAttribute("userId");
	if(user_id.equals("yoon")){
%>
	<form method="post" action="itemAction.jsp">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="submit" value="아이템 삭제">
	</form>
<% }}%>
      </fieldset>
      <script>
      document.getElementById("graph1").style.width=<%=rs.getInt("attack")%>+'%';
      document.getElementById("graph2").style.width=<%=rs.getInt("shield")%>+'%';
      document.getElementById("graph3").style.width=<%=rs.getInt("damage")%>+'%';
      </script>
<% 	}
	rs.close();
   	pstmt.close();
   	con.close();
   	
} catch (Exception e) {        
    System.out.println("DB 연동 실패 " + e.getMessage());
}

%> 

</body>
</html>