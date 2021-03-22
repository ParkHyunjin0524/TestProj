<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    a:link { color: ivory; text-decoration: none;}
    a:visited { color: ivory; text-decoration: none;}
    a:hover { color: ivory; text-decoration: none;}
</style>

<section class="contact-area section-padding-100">
    <div class="container" style="margin-top: 30px;">
        <div class="row justify-content-center">
            <div class="col-xs-12 col-sm-12 col-8 ">
                <div class="contact-content mb-100">
                    <div class="contact-form-area" style="text-align:center">
                        <c:if test="${param.NotLogin == 'error' }">
                            <div class="alert alert-danger alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert">
                                    <span>&times;</span>
                                </button>
                                아이디나 비밀번호를 확인해주세요.
                            </div>
                        </c:if>
                        <h4 class="mb-50 nav-item">로그인</h4>
                        <form action="<c:url value=''/>" method="post">
                            <div class="row">
                                <div class=" col-3"> </div>
                                <div class=" col-6">
                                    <div class="form-group">
                                        <input type="email" class="form-control" name="email" id="email"
                                               placeholder="E-mail">
                                    </div>
                                </div>
                                <div class=" col-3"> </div>
                                <div class=" col-3"> </div>
                                <div class=" col-6">
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="password" id="password"
                                               placeholder="Password">
                                    </div>
                                </div>
                                <div class=" col-3"> </div>
                                <div class=" col-2"> </div>
                                <div style="display:inline" class="mt-30 col-8">
                                    <button type="submit" class="btn btn-primary" style="border:none;">로그인</button>
                                    <button type="button" class="btn btn-primary" style="border:none;">
                                        <a style="border: none" href="<c:url value="/Auth/register"/>">회원가입</a></button>
                                    <button type="button" class="btn btn-primary" style="border:none;">아이디/비빌번호찾기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>

</script>