<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/career.css">
<script>
function send(){
	var reply=replyForm.reply.value;
	if(reply!=""){
		replyForm.submit();
	}
	else{
		alert("댓글을 입력해주세요");
		return;
	}
}
</script>
</head>
<body>

<div id="aside1">
<jsp:include page="login.jsp"/>
</div>
<fieldset>
<%
request.setCharacterEncoding("utf-8");
String id=null;
int kill=0;
int heal=0;
int rank=0;
int code=0;
String grade="";

if(session.getAttribute("userId")!=null){
	id=(String)session.getAttribute("userId");
}
if(id==null){
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.');");
	out.println("location.href='index.jsp';");
	out.println("</script>");
}
%>

<% 
 try{
	String DB_URL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	 
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("select * from score order by killed DESC, ranking ASC, heal DESC, id ASC");
    ResultSet rs = pstmt.executeQuery();
    while(rs.next()){
    	code=rs.getInt("id");
    	kill=rs.getInt("killed");
    	heal=rs.getInt("heal");
    	rank=rs.getInt("ranking");
    	
    	if(kill>=10 && rank<=10 && heal>=3){
    		grade="S";
    	}
    	else if(kill>=5 && rank<=20 && heal>=1){
    		grade="A";
    	}
    	else if(kill>5 && rank<30 && heal>=0){
    		grade="B";
    	}
    	else if(kill>3 && rank<40 && heal>=0){
    		grade="C";
    	}
    	else if(kill>1 && rank<50 && heal>=0){
    		grade="D";
    	}
    	else if(kill>=0 && rank<=100 && heal>=0){
    		grade="F";
    	}
    %>
	<details width="100%" open>
		<summary><%=rs.getString("user_id") %></summary>
	    <table id="grade" border width="100%">
	        <tr align="center">
	          	<td>
		        <span id="grade"><%=grade %></span>
		        <p>
				        킬: <%=rs.getInt("killed")%>명<br>
				        치유: <%=rs.getInt("heal")%>명<br>
				        랭킹: <%=rs.getInt("ranking")%>등<br>
		         </p>
		         </td>
	     	</tr>
	  	</table>
	</details>

 	<%}
    rs.close();
    pstmt.close();
    con.close(); 
 }
 catch(Exception e){
	 System.out.println(e);
 }
%>

</fieldset>
</body>
</html>