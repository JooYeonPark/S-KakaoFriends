
<%@ page language="java" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%-- 다음 주소 API --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>Kakao Friends Shop</title>

<style>
.information-blocks {
	margin-left: 15%;
	margin-right: 15%;
}

.red-span {
	color: #FF0000;
}
</style>



</head>
<body class="style-10">

	<div id="content-block">
		<div class="alertDiv redAlertDiv"></div>
		<div class="content-center fixed-header-margin">
			
			<%-- HEADER --%>
			<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include> 

			<div class="content-push">

				<div class="information-blocks">
					<div class="row">
					<div class="col-sm-10 information-entry">
						<div class="regist-box">
							<div class="article-container style-1">
								<h3>New Customers</h3>

								<form action="/member/regist" method="POST" class="form" id="formTag">
									<label>ID<span>*</span></label>
									<div class="row">
										<div class="col-sm-8 form-group">
											<input class="simple-field id" type="text" id="id" name="id" placeholder="ID" required />
										</div>
										<div class="col-sm-2 form-group">
											<input class="button style-10" type="button" id="ckId" value="중복체크" />
										</div>
									</div>
									<span id="id-span" class="red-span"></span> <br>
									<div class="row">
										<div class="col-sm-6">
											<label>PASSWORD<span>*</span></label> 
											<input class="simple-field" type="password" name="password1" id="pwOriginal"
												placeholder="PASSWORD" required />
												<span id="pw-span" style="color:red; font-size: 0.7em;" class="row col-xs-12"></span>
												<span id="pw-rules-span" style="color:red; font-size: 0.7em;" class="row col-xs-12"></span>
										</div>

										<div class="col-sm-6">
											<label>CONFIRM PASSWORD<span>*</span></label> 
											<input class="simple-field" type="password" name="password" id="pwCheck"
												placeholder="PASSWORD" required />
											<span id="pw-ck-span" style="color:red; font-size: 0.7em;" class="row col-xs-12"></span>
										</div>
									</div>
									<span class="pw-span red-span"></span> <br> 
									
									<label>NAME<span>*</span></label>
									<input class="simple-field" type="text" name="name" placeholder="NAME" required /> 
									
									<label>PHONE<span>*</span></label> 
									<input class="simple-field" type="text" name="phone" placeholder="PHONE" required />
									
									
									<label>EMAIL</label> 
									<input class="simple-field" type="email" name="email" placeholder="EMAIL" /> 
									
									<label>ADDTRESS</label>
									<div class="row">
										<div class="col-sm-4 form-group">
											<input class="simple-field" type="text" id="postcode" name="postcode" disabled>
										</div>
										<div class="col-sm-2 form-group">
											<input type="button" onclick="daumPostcode()" value="우편번호 찾기" class="button style-10"><br>
										</div>
									</div> <%-- /.row --%>
									
									<div class="row">
										<div class="col-sm-12 form-group">
											<input class="simple-field" type="text" id="address" name="address" disabled> 
											<span id="guide" style="color: #999" class="red-span"></span>
										</div>
									</div>
									<%-- /.row --%>
							</div>

							<hr>
							<button type="submit" class="button style-12" style="text-align: center">Register Account</button>

							</form>

					</div>
					<%-- ./regist-box --%>
				</div>
				<%-- ./information-entry--%>
			</div>
			<%-- ./row --%>
				</div>

				<%-- FOOTER --%>
				<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include> 
				
			</div><%-- /.content-push --%>

		</div><%-- /.content-center fixed-header-margin --%>

	<div class="clear"></div>

	</div>
	<%-- /.content-block --%>


	<script>
	
		//아이디 중복 확인
		$("#ckId").click(function() {
			var id = $("#id").val();
			console.log("id="+id);
			checkId(id);
		});

		//비밀번호 조건 검사 및 비교
		$("#pwOriginal").keyup(function() {
			checkRules($("#pwOriginal").val());
			if ($("#pwCheck").val() != "") {
				checkPw($("#pw-ck-span"));
			}
		});
		$("#pwCheck").keyup(function() {
			if ($("#pwOriginal").val() != "") {
				checkPw($("#pw-ck-span"));
			}
		});
		
		function checkId(id){
			$("#id-span").html("");
			
			$.ajax({
				url : "/member/checkId",
				data : "id="+id,
				type : "get",
				success : function(data) {
					if (data == 'possible') {
						$("#id-span").html("사용가능한 아이디 입니다.");
						return true;
					} else {
						$("#id-span").html("불가능한 아이디 입니다.");
					}
				},
				error : function(xhr, statusText) {
					console.log("(" + xhr.status + ", " + statusText + ")");
					$("#id-span").html("불가능한 아이디 입니다.");
				}
			});

			return false;
		}

		function checkPw(spanObj) {
			var origin = $("#pwCheck").val();
			var target = $("#pwOriginal").val();

			if (origin != target) {
				spanObj.html("* 비밀번호가 일치하지 않습니다.");
				return false;
			}

			spanObj.html("");
			return true;

		}

		function checkRules(pw) {
			var pwRules = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*\W).{8,}$/;
			var match = pwRules.test(pw);

			if (!match) {
				$("#pw-rules-span")
						.html(
								"* 비밀번호는 8자리 이상이어야 하며 <br> 숫자,문자, 특수문자가 반드시 포함되어 있어야합니다.");
				return false;
			}

			$("#pw-rules-span").html("");
			return true;
		}
		
		//주소 검색
		function daumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가 (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝남
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만듬
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣음
							document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('address').value = fullRoadAddr;
							document.getElementById('address').removeAttribute(
									'disabled');
							document.getElementById('postcode')
									.removeAttribute('disabled');
							document.getElementById('guide').innerHTML = '(상세주소를 추가 입력해주세요. 예 : 101동 101호)';
						}
					}).open();
		}
		
		//submit 전에 아이디,비밀번호 유효성 검사 실행
		$("#formTag").submit(function(event){
			event.preventDefault();
			
			var id = $("#id").val();
			if(checkId(id) == false){
				showHideAlert($(".alertDiv"), "사용할 수 없는 아이디 입니다.");
				return;
			}

			var origin = $("#pwCheck").val();
			if(checkRules(origin) == flase){
				showHideAlert($(".alertDiv"), "비밀번호 규칙을 지켜주십시오.");
				return;
			}
			
			if(checkPw() == flase){
				showHideAlert($(".alertDiv"), "비밀번호가 일치하지 않습니다.");
				return;
			}
			
			$(this).get(0).submit();
		});
	</script>

</body>
</html>
