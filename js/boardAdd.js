function send(){
	var title=boardAddForm.title.value;
	var content=boardAddForm.content.value;
	
	if(title!=""&&content!=""){
		boardAddForm.submit();
	}
	else{
		alert("정보를 모두 입력해주세요");
		return;
	}
}