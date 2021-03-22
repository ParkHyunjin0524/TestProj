<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
   <div class="row">
      <div class="col-md-5 col-xs-3"></div>
      <div class="col-md-5 col-xs-3">
         <h2>글작성</h2>
      </div>

      <div class="col-md-12">
         <form onsubmit="return writeValidate()"
            action="<c:url value="/community/writer"/>" method="post"
            class="form-horizontal">
            <div class="form-group"></div>
            <br />

            <div class="form-group">
               <div class="col-4">
                  <%--@declare id="exampleformcontrolinput3"--%><label class="col-sm-3 control-label"
                     for="exampleFormControlInput3">제목</label> <input type="text"
                     class="form-control" name="title" placeholder="제목을 입력하세요"
                     required="required" />
               </div>
            </div>
            <div class="form-group">
               <div class="col-md-12">
                  <label class="col-sm-3 control-label"
                     for="exampleFormControlInput3">내용</label>
                  <textarea class="form-control" id="summernote" name="content"></textarea>
               </div>

            </div>
            <div class="form-group">
               <div class="col-4">
                  <input type="text" class="form-control" name="hashtag"
                     id="hashtag" placeholder="#해시태그" />
               </div>
            </div>
            <div class="col-12">
               <button type="submit" class="btn bueno-btn">등록하기</button>
            </div>
         </form>
      </div>
   </div>
</div>

