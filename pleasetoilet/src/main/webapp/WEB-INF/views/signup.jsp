<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="/app/resources/css/signup.css" rel="stylesheet"/>

<script src="/app/resources/jquery-3.2.1.min.js"></script>
<script>
	$("document").ready(() => {
	    $("#loginBtn").on("click", () => {
	        location.href = "login";
	      });
	      
	      $("#homelogo").on("click", () => {
	        location.href = "home";
	      });
	     
	var idReg = /^[A-Za-z0-9]{1,}$/;
	var passReg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; 
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	var idc=false;
	var pwc=false;
	var emc=false;
	$('#id').keyup(()=>{
		idc=false;
	});
	$('#idcheck').on('click',()=>{
		// console.log($('#id').val());
		var idcc=idReg.test($('#id').val());
		if(idcc===true){
			$.ajax({
	            url: '/app/idcheck',
	            type: 'post',
	            //contentType:'application/json; charset=utf-8',
	            data: {'id':$('#id').val()},
	            dataType:'json',
	            success:(serverdata)=>{
	               //console.log(1);
	               idc=serverdata.key;
	               if(idc==true){
	                  alert("중복확인완료!");
	               } else {
	                  alert("중복되었습니다!");
	               }
	         }
	         }); 
	      } else if(idcc==false){
	         alert("형식에 맞게 입력하세요")
	      } else {
	         alert("잠시 후에 다시 입력하세요");
	      }
	   });//on

	   $('#pwcheck').keyup(()=>{
		      if(passReg.test($('#pw').val())==true){
		         if($('#pw').val()==$('#pwcheck').val())
		            pwc=true;
		         else
		            pwc=false;
		      }
		      else
		         false;
		      console.log(pwc);
		   });
		   $('#email').keyup(()=>{
		      if(emailReg.test($('#email').val())==true){
		         emc=true;
		      }
		      else{
		         emc=false;
		      }
		      console.log(emc);
		   });
	
		   $('#sign').on('submit',(e)=>{
			      if(idc==true && pwc==true && emc==true){
			         
			      }
			      else{
			         e.preventDefault();
			         if(idc==false){
			            alert("아이디 중복확인이 되지 않았습니다.");
			         }
			         if(pwc==false)
			            alert("비밀번호가 일치하지 않습니다.");
			         if(emc==false)
			            alert("이메일을 형식에 맞게 입력하세요.");
			      }
			         
			   });
			});
</script>
</head>
<body>
	<div id="navbar">
		<a href="home" id="homelogo">Please Toilet</a>
		<div class="login_bar">
	      <button id="loginBtn" class="logBtn">로그인</button>
	    </div>
	</div>

	<div class="form-container">
		<h1 class="title">SIGN UP</h1>
		<form action="signup" method="post" id="sign">
			<input type="text" id="id" name="id" placeholder="아이디 (영문으로 작성)" />
			<div id="idbox">
			<input type="button" id="idcheck" value="중복확인">
			</div><br>
			<input type="password" id="pw" name="pw" placeholder="비밀번호(8~ 15 자리 영문, 숫자, 특수문자 포함)"><br>
			<input type="password" id="pwcheck" name="pwcheck" placeholder="비밀번호 확인"><br>
			<input type="text" id="email" name="email" placeholder="이메일"><br>
			<input type="submit" id="submitBtn" value="가입하기">
		</form>
	</div>

</body>
</html>