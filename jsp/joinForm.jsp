<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/join.css">
<script src= "../js/join.js"></script>
<%
try{
String DB_URL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
String DB_USER = "root";
String DB_PASSWORD= "1234";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
PreparedStatement pstmt=null; 
pstmt=con.prepareStatement("select * from member");
ResultSet rs = pstmt.executeQuery();
%>
<script>
	function checkID(){
		var id=joinForm.user_id.value;
		var check=false;
		
		<%while(rs.next()){%>
		if(id==""||id=="<%=rs.getString("user_id")%>"){
			alert("사용불가능한 아이디입니다.");
			return;
		 }
		 else check=false;
	    <%}
		rs.close();
		pstmt.close();
		con.close();
	} catch(Exception e){
		
	}%>
	 if(check==true){
		    //alert("사용불가능한 아이디입니다.");   
	    	document.getElementById("user_id").value="";
	    }
	 else{
	    alert("사용가능한 아이디입니다.");
	  }
	}
</script>
</head>
<body>
<center>
<form name="joinForm" method="post" action="joinAction.jsp">
     <table align="center">
       <tr height=30px>
        <td>아이디</td>
        <td>
          <input type="text" name="user_id">
          <input type="button" onclick="checkID()" value="중복확인">
        </td>
      <tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" name="user_pw"></td>
      </tr>
      <tr>
      	<td>비밀번호 확인</td>
        <td>
        <input type="password" name="check_pw"><br>
        <span id="check"></span>
        </td>
      </tr>
       <tr>
         <td>이름</td>
         <td><input type="text" name="user_name"></td>
       <tr>
        <tr>
         <td>생년월일</td>
         <td><input type="date" name="user_birth"></td>
       <tr>
   </table>
     <div>
     <blockquote>제1조(개인정보의 수집ㆍ이용)<br/>

  ① 개인정보처리자는 다음 각 호의 어느 하나에 해당하는 경우에는 개인정보를 수집할 수 있으며 그 수집 목적의 범위에서 이용할 수 있다.<br/>

  1. 정보주체의 동의를 받은 경우<br/>

  2. 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우<br/>

  3. 공공기관이 법령 등에서 정하는 소관 업무의 수행을 위하여 불가피한 경우<br/>

  4. 정보주체와의 계약의 체결 및 이행을 위하여 불가피하게 필요한 경우<br/>

  5. 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우<br/>

  6. 개인정보처리자의 정당한 이익을 달성하기 위하여 필요한 경우로서 명백하게 정보주체의 권리보다 우선하는 경우. 이 경우 개인정보처리자의 정당한 이익과 상당한 관련이 있고 합리적인 범위를 초과하지 아니하는 경우에 한한다.</blockquote>
    </div>
     <input type="checkbox" name="agree" id="agree"><label for="agree">개인정보 수집 및 이용에 동의합니다.</label><br>
  	 <input type="button" onclick="join()" value="가입"> <input type="reset" value="취소"><br/>
  </form>
 </center>
</body>
</html>