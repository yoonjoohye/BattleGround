<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/itemAdd.css">
<script>
window.onload=function(){
	document.getElementById("무기구").style.display = "inline-block";
	document.getElementById("부착물").style.display = "none";
	document.getElementById("방어구").style.display = "none";
}
function smallKind() {
	var bigKind = document.getElementById("bigKind").value;
	
	var div1 = document.getElementById("무기구");
	var div2 = document.getElementById("부착물");
	var div3 = document.getElementById("방어구");
	
	switch(bigKind) {
	case "무기구": 
		div1.style.display = "inline-block";
		div2.style.display = "none";
		div3.style.display = "none";
		break;
		
	case "부착물": 
		div1.style.display = "none";
		div2.style.display = "inline-block";
		div3.style.display = "none";
		break;
		
	case "방어구": 
		div1.style.display = "none";
		div2.style.display = "none";
		div3.style.display = "inline-block";
		break;
	}
}
function add(){
	var item=itemAddForm.item.value;
	var size=itemAddForm.size.value;
	var attack=itemAddForm.attack.value;
	var damage=itemAddForm.damage.value;
	var shield=itemAddForm.shield.value;
	
	if(item==""||size==""||attack==""||shield==""||damage==""){
		alert("정보를 모두 입력해주세요");
		return;
	}
	else{
		itemAddForm.submit();
	}
}
</script>
</head>
<body>
	<form name="itemAddForm" method="post" action="itemAddAction.jsp" enctype="multipart/form-data">
		<br>
		<center>
	    <div id="label" style="
	    width:50%;
	 	border:3px solid white;
	 	border-radius:30px;
	 	color: white;
	 	font-size: 20px;
	 	padding: 3px;
	 	margin-bottom: 20px;">아이템 등록하기</div></center>
		<div id="box">
			<select id="bigKind" onchange="smallKind()" name="bigKind">
				<option value="무기구" selected>무기구
				<option value="부착물">부착물
				<option value="방어구">방어구
			</select><br>
			
			<div id="무기구">
				<select name="무기구">
					<option value="HG" selected>HG</option>
					<option value="SMG">SMG</option>
					<option value="AR">AR</option>
				</select><br>		
			</div>
			
			<div id="부착물">
				<select name="부착물">
					<option value="총구" selected>총구</option>
					<option value="손잡이">손잡이</option>
					<option value="조준경">조준경</option>
				</select><br>
			</div>
			
			<div id="방어구">
				<select name="방어구">
					<option value="착용템" selected>착용템</option>
					<option value="회복템">회복템</option>
				</select><br>
			</div><br>
		<input type="text" name="item" placeholder="아이템이름"><br>
		<input type="number" name="size" placeholder="용량"><br>
		<input type="number" name="attack" placeholder="전투력"><br>
		<input type="number" name="shield" placeholder="보호력"><br>
		<input type="number" name="damage" placeholder="피해량"><br>
		<input type="file" name="myimg"/><br>
		<input type="button" onclick="add()" value="등록">
		<input type="reset" value="취소">
		</div>
		
		
	</form>
</body>
</html>