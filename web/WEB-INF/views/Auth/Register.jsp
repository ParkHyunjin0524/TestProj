<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    .label :hover{color: black}

</style>
<section>
<div class="container-fluid">
    <div class="row no-gutters">
        <div class="col-md-7">
            <div class="contact-wrap w-100 p-md-5 p-4">
                <h3 class="mb-4">회원가입</h3>
                <form method="POST" id="contactForm" name="contactForm" action="<c:url value="/Auth/loginSuccess"/>" class="contactForm">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="label" for="name">이름(성명)</label> <input
                                    type="text" class="form-control" name="name" id="name"
                                    placeholder="이름을 입력하세요">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="label" for="email">이메일</label> <input
                                    type="email" class="form-control" name="email" id="email"
                                    placeholder="이메일을 입력하세요">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="label" for="pwd">비밀번호</label> <input
                                    type="password" class="form-control" name="pwd" id="pwd"
                                    placeholder="비밀번호를 입력하세요">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="label" for="pwd">비밀번호 확인</label> <input
                                    type="password" class="form-control" placeholder="비밀번호를 입력하세요">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="label" >전화번호</label>
                                <textarea name="tel" class="form-control" id="tel"
                                          cols="30" rows="4" placeholder="tel"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="label" >주소</label>
                                <textarea name="address" class="form-control" id="address"
                                          cols="30" rows="4" placeholder="address"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="label" id="daumserch" onclick="execDaumPostcode()">우편번호 찾기</label>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <input type="text" readonly class="form-control" id="postcode" name="postcode" placeholder="우편번호">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <input type="text" readonly class="form-control" id="roadAddress" name="address1" placeholder="도로명주소">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <input type="text" readonly class="form-control" id="jibunAddress" name="address2" placeholder="지번주소">
                            </div>
                        </div>
                        <span id="guide" style="color:#999;display:none"></span>
                        <div class="col-lg-8">
                            <div class="form-group">
                                <input type="text" class="form-control" id="detailAddress" name="address3" placeholder="상세주소">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <input type="submit" value="Send" class="btn btn-primary">
                                <div class="submitting"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-5 d-flex align-items-stretch">
            <div class="info-wrap w-100 p-5 img" style="background-image: url(<c:url value="/images/img.jpg"/>);"></div>
        </div>
    </div>
</div>
</section>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<c:url value='/js/membervalidate.js'/>"></script>
<script>
    //주소찾기
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>