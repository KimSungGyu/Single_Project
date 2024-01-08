<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
  		width: 100%;
  		height: 100%;
  		margin: 0;
  		padding: 0;
  		background-attachment: fixed;
  	}
  	.background-overlay{
  		position: absolute;
  		top: 0;
  		right: 0;
  		bottom: 0;
  		left: 0;
  		background-image: url('images/background/찾기2.jpeg');
  		background-size: cover;
  		background-attachment: fixed;
  		opacity: 0.2;
  		z-index: -1;
  	}
  	.container{
  		z-index: 100;
  		background-color: rgba(255,255,255,0.0);
  		padding: 10px;
  	}
  	.form-horizontal{
  		padding-left: 300px;
  	}
</style>
</head>
<body>
	<div class="background-overlay"></div>
	<div class="container" style="margin-top: 0;">
	  <h2 align="center">비밀번호 찾기</h2><hr>
	  <form class="form-horizontal" action="findpwPro.jsp" method="post" onSubmit="return findpwcheck()">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="id">아이디:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" style="width:200px;" placeholder="Enter id" name="id">&nbsp;
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="name">이름:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" style="width:200px; opacity: 1;" placeholder="Enter name" name="name">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="ssn">주민등록번호:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" style="width:200px;" maxlength="6" placeholder="Enter ssn1" name="ssn1">&nbsp; _ &nbsp;
	        <input type="text" class="form-control" style="width:200px;" maxlength="7" placeholder="Enter ssn2" name="ssn2">
	      </div>
	    </div>
	    <hr>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <input type="submit" class="btn btn-default" value="비밀번호 찾기">&nbsp;
	        <a href="login.member">
	        	<input type="button" class="btn btn-default" value="취소">
	        </a>
	      </div>
	    </div>
	  </form>
	</div>
</body>
</html>