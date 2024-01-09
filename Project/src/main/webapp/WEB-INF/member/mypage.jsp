<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/top.jsp" %>

<style>
	th {
        width: 25%;
        text-align: center;
        background-color: gray; /* 헤더 배경색 */
        color: white;
        padding: 10px;
    }

    td {
        text-align: center;
        padding: 10px;
    }
	body, html {
	  margin: 0;
	  font-family: Arial;
	}
	
	.tablink {
	  background-color: #555;
	  color: white;
	  float: left;
	  border: none;
	  outline: none;
	  cursor: pointer;
	  padding: 14px 16px;
	  font-size: 17px;
	  width: 25%;
	}
	
	.tablink:hover {
	  background-color: #777;
	}
	
	.tabcontent {
	  color: white;
	  display: none;
	  padding: 100px 20px;
	}
	.mybutton {
        background-color: gray; /* 버튼 배경색 */
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-top: 10px;
        cursor: pointer;
        border-radius: 5px; /* 버튼 모서리 둥글게 */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    }
</style>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("defaultOpen").click();
});

function openPage(pageName, elmnt, color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = color;
}

function pwcheck(){
	pvalue = $("input[name=password]").val();
	var regexp = /^[a-z0-9]{8,16}$/;
	
	if(pvalue.search(regexp) == -1){
		$("#pwcheckmessage").html("<font color = red>길이는 8~16사이여야 합니다.</font>");
		pwerror = "error";
		setTimeout(function(){               
			f.password.select();             
		}, 10);
		return false;
	}
	
	var chk_eng = pvalue.search(/[a-z]/i);
	var chk_num = pvalue.search(/[0-9]/);
	if(chk_eng<0 || chk_num<0){
		$("#pwcheckmessage").html("<font color = red>영문 소문자, 숫자 조합이 아닙니다.</font>");
		pwerror = "error";
		setTimeout(function(){               
			f.password.select();             
		}, 10);
		return false;
	} else {
		$("#pwcheckmessage").html("<font color = blue>올바른 형식</font>");
		pwerror = "noterror";
	}
}

$(document).ready(function() {
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
    
    $('#sub').click(function(event){ // submit 클릭
        if(nickuse == "impossible"){
        	alert('이미 사용중인 닉네임입니다.');
        	return false;
        	
        }else if(pwerror == "error"){
        	alert('비밀번호 형식이 맞지않습니다.');
        	return false;
        	
        }else if(!cert){
        	alert('인증번호를 받으세요');
        	return false;
        	
        }else if(!registercheck){
        	alert('인증번호를 확인하세요');
        	return false;
        }
    });
    
    $('#email').keyup(function () {
        var enteredEmail = $(this).val();

        if (isValidEmail(enteredEmail)) {
            $('#emailmessage').hide();
        } else {
            $('#emailmessage').html("<font color='red'>형식이 올바르지 않습니다.</font>");
            $('#emailmessage').show();
        }
    });
    
 });
</script>

<body>
	<button class="tablink" onclick="openPage('Tab1', this, 'black')" id="defaultOpen">내정보</button>
	<button class="tablink" onclick="openPage('Tab2', this, 'black')">정보수정</button>
	<button class="tablink" onclick="openPage('Tab3', this, 'black')">구매상품</button>
	<button class="tablink" onclick="openPage('Tab4', this, 'black')">회원탈퇴</button>
	
	<div id="Tab1" class="tabcontent">
	  <table class="table table-bordered border-success" style="width: 600px; margin: auto;">
		  <tr>
		  	<th>아이디</th>
		  	<td>${loginInfo.member_id}</td>
		  </tr>
		  <tr>
		  	<th>닉네임</th>
		  	<td>${loginInfo.nickname}</td>
		  </tr>
		  <tr>
		  	<th>이름</th>
		  	<td>${loginInfo.name}</td>
		  </tr>
		  <tr>
		  	<th>비밀번호</th>
		  	<td>${loginInfo.password}</td>
		  </tr>
		  <tr>
		  	<th>휴대폰번호</th>
		  	<td>${loginInfo.phone}</td>
		  </tr>
		  <tr>
		  	<th>이메일</th>
		  	<td>${loginInfo.email}</td>
		  </tr>
		  <tr>
		  	<th>주소</th>
		  	<td>${loginInfo.address1}</td>
		  </tr>
		  <tr>
		  	<th>상세주소</th>
		  	<td>${loginInfo.address2}</td>
		  </tr>
	  </table>
	</div>
	
	<div id="Tab2" class="tabcontent">
	  <form action="update.member" method="post">
	  	<table class="table table-bordered border-success" style="width: 600px; margin: auto;">
		  <tr>
		  	<th>아이디</th>
		  	<td>${loginInfo.member_id}</td>
		  </tr>
		  <tr>
		  	<th>닉네임</th>
		  	<td>
		  		<input type="text" id="nickname" name="nickname" size="9" value="${loginInfo.nickname}">
		  		<span id="nickmessage" style = "display: none;"></span>
			</td>
		  </tr>
		  <tr>
		  	<th>이름</th>
		  	<td>${loginInfo.name}</td>
		  </tr>
		  <tr>
		  	<th>비밀번호</th>
		  	<td>
		  		<input type="password" id="password" name="password" size="9" value="${loginInfo.password}" onkeyup="pwcheck()">
		  		<span id="pwcheckmessage" style = "display: none;"></span>
			</td>
		  </tr>
		  <tr>
		  	<th>휴대폰번호</th>
		  	<td>
		  		<input type="text" name="phone" maxlength="11" size="9" value="${loginInfo.phone}">
		  	</td>
		  </tr>
		  <tr>
		  	<th>이메일</th>
		  	<td>
				<input type="text" name="email" size="17" value="${loginInfo.email}">
			</td>
		  </tr>
		  <tr>
		  	<th>주소</th>
		  	<td>
		  		<input type="text" name="address1" size="9" value="${loginInfo.address1}">
		  	</td>
		  </tr>
		  <tr>
		  	<th>상세주소</th>
		  	<td>
		  		<input type="text" name="address2" size="9" value="${loginInfo.address2}">
		  	</td>
		  </tr>
		  <tr>
		  	<td colspan="2">
		  		<input type="submit" id="sub" class="mybutton" value="수정">
		  		<input type="button" class="mybutton" value="취소">
		  	</td>
		  </tr>
	   </table>
	  </form>
	</div>
	
	<div id="Tab3" class="tabcontent">
	  <h3>구매상품</h3>
	</div>
	
	<div id="Tab4" class="tabcontent">
	  <h3>About</h3>
	  <p>Who we are and what we do.</p>
	</div>
</body>