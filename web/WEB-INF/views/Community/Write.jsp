<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<!-- include summernote css/js -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<c:url value="/summernote/summernote-lite.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/summernote/summernote-lite.css"/>">
<script src="<c:url value="/summernote/summernote-ko-KR.js"/>"></script>
<!-- ##### Header Area Start ##### -->
</head>
<div class="container">
   <div class="row">
      <div class="col-md-5 col-xs-3"></div>
      <div class="col-md-6 col-xs-3" style="padding-top: 10px;">
         <h2 class="nav-link"><span class="flaticon-pawprint-1 mr-2"></span> 글작성</h2>
      </div>

      <div class="col-md-12">
         <form onsubmit="return writeValidate()"
            action="<c:url value="/Cmmunity/Writer"/>" method="post"
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
               <button type="submit" class="btn btn-primary" style="padding-bottom: 10px">등록하기</button>
            </div>
         </form>
      </div>
   </div>
</div>
<script>

   $('#summernote').summernote({
      height : 300,
      minHeight : null,
      maxHeight : null,
      focus : true,
      lang : "ko-KR",
      placeholder : '내용을 입력해주세요',
      callbacks : {
         // onImageUpload : function(files) {
         //    sendFile(files[0]);
         // },
         // onMediaDelete : function(target) {
         //    console.log(target[0].src);
         //    var targetsrc = target[0].src
         //    deleteFile(targetsrc);
         // }

      }///callbacks
   });
</script>
