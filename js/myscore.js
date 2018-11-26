function send(){
	var kill=myscoreForm.kill.value;
	var heal=myscoreForm.heal.value;
	var rank=myscoreForm.heal.value;
	if(kill!=""&&heal!=""&&rank!=""){
		myscoreForm.submit();
	}
	else{
		alert("정보를 모두 입력해주세요");
		return;
	}
}