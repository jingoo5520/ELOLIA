<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="contentContainer container">
		<jsp:include page="../myPage_side.jsp"></jsp:include>
		<main class="right-pane">

			<h1>비밀번호 변경</h1>
			<c:if test="${empty sessionScope.auth}">
				<form class="row" action="/member/auth" method="post">
					<div class="auth">
						<div class="input-group">
							<span class="input-group-text">비밀번호</span> <input type="password"
								class="form-control" id="pwd" name="pwd">
						</div>
						<button class="btn" type="submit">확인</button>
					</div>
				</form>
			</c:if>
			<c:if test="${not empty sessionScope.auth}">
				<form id="form">
					<div class="form-group input-group">
						비밀번호 변경<input type="password" id="member_pwd" name="member_pwd"><span
							id="pwdStatus"></span><input type="hidden" value="">
					</div>
					<div class="form-group input-group">
						비밀번호 확인<input type="password" id="member_pwd2" name="member_pwd2"><span
							id="pwd2Status"></span><input type="hidden" value="">
					</div>
					<button id="button" class="btn btn-info" type="button" value="수정하기">수정하기</button>
				</form>
			</c:if>
		</main>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	var pwdExp = /^(?=.*[A-Za-z])(?=.*\d).{8,20}$/; // 비밀번호 정규식(영문자, 숫자를 포함한 8자이상 20자 이하)
	$(function () {
		// 비밀번호 입력중
		$("#member_pwd").keyup(function() {
			let tmp = $("#member_pwd").val();
			if(isCheck("member_pwd", tmp, pwdExp, "영문, 숫자를 포함한 8자 이상 20자 이하", "red")) {
				isMsg("member_pwd", "사용가능한 비밀번호 입니다.", "blue", true);
			} else {
				isMsg("member_pwd", "영문, 숫자를 포함한 8자 이상 20자 이하", "red", false);
			}
		});
		// 비밀번호 확인 입력중
		$("#member_pwd2").keyup(function() {
			let tmp1 = $("#member_pwd").val();
			let tmp2 = $("#member_pwd2").val();
			if(tmp1 !== tmp2) {
				isMsg("member_pwd2", "비밀번호 불일치", "red", false);
			} else {
				isMsg("member_pwd2", "비밀번호 일치", "blue", true);
			}
		});
		
		// 정규식 테스트 결과에 따라 ture, false 반환
		function isCheck(id, tmp, regExp, msg, color) {
			if (regExp.test(tmp)) { // 정규식 유효성 true
				console.log("정규식 : true");
				console.log("#" + id);
				$("#" + id).next().text("");
				$("#" + id).next().next().val("true");
				return true;
			} else { // 정규식 유효성 false
				console.log("정규식 : false");
				console.log("#" + id);
				$("#" + id).next().text(msg);
				$("#" + id).next().css("color", color);
				$("#" + id).next().next().val("false");
				return false;
			}
		}
		
		// 입력값에 따라 msg출력
		function isMsg(id, msg, color, result) {
			$("#" + id).next().text(msg);
			$("#" + id).next().css("color", color);
			$("#" + id).next().next().val(result);
		}

		// id, email, phone_number를 중복인지 아닌지 체크하는 ajax
		function dbCheck(key, value) {
			// https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Promise
			// dbCheck()를 호출한 곳에서 ajax 응답결과를 기다리지 않고 동작하기 때문에, Promise 로 ajax결과값을 받은 후에 dbCheck()가 동작하도록 함.
		    return new Promise((resolve, reject) => {
		        $.ajax({
		            url: "/member/isDuplicate",
		            type: "POST",
		            dataType: "json",
		            data: {
		                key: key,
		                value: value
		            },
		            success: function(data) {
		                console.log(data);
		                if (data.status === "Duplicate") {
		                    resolve(false); // 중복이면 false
		                } else if (data.status === "notDuplicate") {
		                    resolve(true); // 중복이 아니면 true
		                }
		            },
		            error: function() {
		                reject("서버 오류"); // 오류 발생 시 reject
		            }
		        });
		    });
		}
		
	});
	
	$("#button").click(function (e) {
		e.preventDefault(); // 기본 제출 동작 방지
		let result = true;
		let text = ""; // modal의 text영역에 들어갈 내용
		let pwdCheck = $("#member_pwd").next().next().val();
		let pwd2Check = $("#member_pwd2").next().next().val();
		if(pwdCheck != "true") {
			result = false;
			text += "<div>비밀번호</div>";
		}
		if(pwd2Check != "true") {
			result = false;
			text += "<div>비밀번호 확인</div>";
		}
			console.log(result);
			if (result) {
		        $.ajax({
		            type: 'POST',
		            url: '/member/modiPwd',
		            data: $("#form").serialize(), // 폼 데이터를 DTO로 받을수 있도록 해줌(데이터 직렬화)
		            dataType: "json",
		            success: function(data) {
		                console.log(data);
		                if (data.status == "success") {
		                    console.log("성공");
							alert("변경 성공"); // 모달로 수정 예정
							$("#member_pwd").val("");
							$("#member_pwd2").val("");
		                } else if (data.status == "fail") {
		                    console.log("변경 실패");
		                    alert("변경 실패"); // 모달로 수정 예정
		                }
		            },
		            error: function(error) {
		                console.log("통신 실패");
		            }
		        });
		    } else {

		    }
	});
</script>
</html>