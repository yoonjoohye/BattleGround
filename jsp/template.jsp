<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/template.css">
 <link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
</head>
<body>
<%
	String content=request.getParameter("content");
%>
	<header>
		<jsp:include page="header.jsp"/>
	</header>
	<nav>
		<jsp:include page="nav.jsp"/>
	</nav>
	<section>
		<jsp:include page="<%=content %>"/>
	</section>
	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>
</body>
</html>