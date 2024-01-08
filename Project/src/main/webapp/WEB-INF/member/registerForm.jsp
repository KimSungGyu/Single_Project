<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.col-sm-10{
		display: flex;
	}
	.container{
		background-image: url("../../images/man.jpg");
		background-repeat: no-repeat;
		background-position: right;
		background-size: 350px;
	}
	body{
	 		position: static;
	 		width: 100%;
	 		height: 100%;
	 		margin: 0;
	 		padding: 0;
	 	}
 	.background-overlay{
 		position: absolute;
 		top: 0;
 		right: 0;
 		bottom: 0;
 		left: 0;
 		background-image: url('../../images/background/cc.png');
 		background-repeat: no-repeat;
 		background-attachment: fixed;
 		background-size: cover;
 		opacity: 0.3;
 		z-index: -1;
 	}
 	.container{
 		position: static;
 		z-index: 100;
 		background-color: rgba(255,255,255,0.0);
 		padding: 10px;
 	}
 	.form-horizontal{
 		padding-left: 300px;
 	}
 </style>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#member_id').keyup(function(){ // 아이디 중복체크

        $.ajax({
            url : "idduplicate.member", // 요청url
            data : ({
                inputid : $('input[name="member_id"]').val()
            }),
            success : function(data){
               if(jQuery.trim(data)=='YES'){
                    $('#idmessage').html("<font color=blue>사용 가능합니다.</font>")
                    use = "possible";
                    $('#idmessage').show();
                } else {
                    $('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>")
                    use = "impossible";
                    $('#idmessage').show();
                }
            }
        });
    });
	    
    $('#nickname').keyup(function(){ // 닉네임 중복체크

        $.ajax({
            url : "nickduplicate.member", // 요청url
            data : ({
                inputnick : $('input[name="nickname"]').val()
            }),
            success : function(data){
               if(jQuery.trim(data)=='YES'){
                    $('#nickmessage').html("<font color=blue>사용 가능합니다.</font>");
                    nickuse = "possible";
                    $('#nickmessage').show();
                } else {
                    $('#nickmessage').html("<font color=red>이미 사용중인 닉네임입니다.</font>")
                    nickuse = "impossible";
                    $('#nickmessage').show();
                }
            }
        });
    });
 });
function repasswordCheck(){
	if($("input[name=password]").val() == $("input[name=repassword]").val()){
		$("#pwmessage").html("<font color = blue>비밀번호 일치</font>");
		pwuse = "same";
	} else {
		$("#pwmessage").html("<font color = red>비밀번호 불일치</font>");
		pwuse = "nosame";
	}
}
 </script>
</head>
<body>
	<div class="background-overlay"></div>
	<div class="container" style="margin-top: 0;">
	  <h2 align="center">회원가입</h2><hr>
	  <form class="form-horizontal" action="/register.member" method="post">
	  	<div class="form-group">
	      <label class="control-label col-sm-2" for="id">아이디:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" style="width:200px;" placeholder="Enter id" id="member_id" name="member_id">&nbsp;
	        <span id="idmessage" style = "display: none;"></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="name">닉네임:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" style="width:200px; opacity: 1;" placeholder="Enter name" id="nickname" name="nickname">&nbsp;
	      	<span id="nickmessage" style = "display: none;"></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="name">이름:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" style="width:200px; opacity: 1;" placeholder="Enter name" name="name">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="password">비밀번호:</label>
	      <div class="col-sm-10">
	        <input type="password" class="form-control" style="width:200px;" placeholder="Enter password" name="password">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="repassword">비밀번호 확인:</label>
	      <div class="col-sm-10">
	        <input type="password" class="form-control" style="width:200px;" placeholder="Enter repassword" name="repassword" onkeyup="repasswordCheck()">
	        &nbsp;
	        <span id="pwmessage" ></span>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="ssn">핸드폰 번호:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" style="width:200px;" placeholder="Enter phone" name="phone">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email">이메일:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" style="width:200px;" placeholder="Enter email" name="email">
	      </div>
	    </div>
	    <hr>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <input type="submit" class="btn btn-default" value="가입하기">&nbsp;
	        <a href="login.member">
	        	<input type="button" class="btn btn-default" value="취소">
	        </a>
	      </div>
	    </div>
	  </form>
	</div>
</body>
</html>