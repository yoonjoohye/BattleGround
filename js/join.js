function join(){
	var id=joinForm.user_id.value;
	var pw=joinForm.user_pw.value;
	var chkpw=joinForm.check_pw.value;
	var name=joinForm.user_name.value;
	var date=joinForm.user_birth.value;
	if(pw!=chkpw){
		alert("비밀번호를 확인해주세요!");
		joinForm.chkpw.focus();
		return;
	}
	else if(id!="" && pw!="" && chkpw!=""&&name!=""&&date!=""&&joinForm.agree.checked){
		joinForm.submit();
	}
	
	else{
		alert("정보를 모두 입력해주세요");
		return;
	}
}