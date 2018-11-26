function login(){
	var id=loginForm.id.value;
	var pw=loginForm.pw.value;
	if(id!="" && pw!=""){
		loginForm.submit();
	}
	else{
		alert("입력을 확인해주세요!");
	}
}