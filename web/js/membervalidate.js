$('.pw').focusout(function(){
	console.log('focuseout'); 
	var pwd1 = $("input[name='password']").val();
	var pwd2 = $("input[name='password2']").val();
	if(pwd1 != "" && pwd2 == ""){ //첫번째는 비어있지 않고 두번째는 비어있을때 아무일도 안일어남
		null;
	} else if(pwd1 != "" || pwd2 != "") { //첫번째 두번째 둘다 입력되어있을 떄
		if(pwd1==pwd2) { //일치하면
			$('#alert-success').css('display','inline-block');
			$('#alert-danger').css('display','none');
		} else { //불일치시
			$('#alert-success').css('display','none');
			$('#alert-danger').css('display','inline-block');
			$("input[name='password2']").css('border','LightCoral 1px solid');
			//$("input[name='password2']").focus();
		}
	}
});
var userName= $("input[name='username']");
var email= $("input[name='email']");
var now = $("input[name='now']");
var password = $("input[name='password']");
var password2 = $("input[name='password2']");
var postcode= $("#postcode");
function isValidate(){
	if($(userName).val() == ""){
		$(userName).attr('placeholder','이름을 입력하세요');
		$(userName).css('border','LightCoral 1px solid');
		$(userName).focus();
		return false;
	}
	if($(email).val() == ""){
		$(email).attr('placeholder','이메일을 입력하세요');
		$(email).css('border','LightCoral 1px solid');
		$(email).focus();
		return false;
	}
	if($(now).val() == ""){
		$(now).attr('placeholder','현재 비밀번호를 입력하세요');
		$(now).css('border','LightCoral 1px solid');
		$(now).focus();
		return false;
	}
	if($(password).val() == ""){
		$(password).attr('placeholder','비밀번호를 입력하세요');
		$(password).css('border','LightCoral 1px solid');
		$(password).focus();
		return false;
	}
	if($(password2).val() == ""){
		$(password2).attr('placeholder','비밀번호 확인란을 입력하세요');
		$(password2).css('border','LightCoral 1px solid');
		$(password2).focus();
		return false;
	}
	if($(postcode).val() == ""){
		$(postcode).attr('placeholder','주소를 입력해주세요');
		$(postcode).css('border','LightCoral 1px solid');
		$(postcode).focus();
		return false;
	}
	if($(password).val() != $(password2).val() ){
		$('#alert-success').css('display','none');
		$('#alert-danger').css('display','inline-block');
		$("input[name='password2']").css('border','LightCoral 1px solid');
		return false;
	}
	return true;
}
$(now).on('change keyup', function(){
	$(now).css('border','1px solid rgba(0, 0, 0, 0.1)');
})
$(password).on('change keyup', function(){
	$(password).css('border','1px solid rgba(0, 0, 0, 0.1)');
})
$(password2).on('change keyup', function(){
	$(password2).css('border','1px solid rgba(0, 0, 0, 0.1)');
})
$(userName).on('change keyup', function(){
	$(userName).css('border','1px solid rgba(0, 0, 0, 0.1)');
})
$(email).on('change keyup', function(){
	$(email).css('border','1px solid rgba(0, 0, 0, 0.1)');
})
$(postcode).on('change keyup', function(){
	$(postcode).css('border','1px solid rgba(0, 0, 0, 0.1)');
})