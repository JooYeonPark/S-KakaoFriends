<%@ page language="java" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%-- 다음 주소 API --%>
<script src="/resources/js/daumMap.js"></script>
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
							<form action="/member/regist" method="POST" class="form" id="formTag">
						
								<div class="article-container style-1">
									<h3>New Customers</h3>
									
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
													<span id="pw-span" style="color:red; font-size: 1.0em;" class="row col-xs-12"></span>
													<span id="pw-rules-span" style="color:red; font-size: 1.0em;" class="row col-xs-12"></span>
											</div>
	
											<div class="col-sm-6">
												<label>CONFIRM PASSWORD<span>*</span></label> 
												<input class="simple-field" type="password" name="password" id="pwCheck"
													placeholder="PASSWORD" required />
												<span id="pw-ck-span" style="color:red; font-size: 1.0em;" class="row col-xs-12"></span>
											</div>
										</div>
										<span class="pw-span red-span"></span> <br> 
										
										<label>NAME<span>*</span></label>
										<input class="simple-field" type="text" name="name" placeholder="NAME" required /> 
										
										<label>PHONE<span>*</span></label> 
										<input class="simple-field" type="text" name="phone" placeholder="ex)010-1234-5678" required />
										
										
										<label>EMAIL</label> 
										<input class="simple-field" type="email" name="email" placeholder="ex)abc@kakao.com" /> 
										
										<label>ADDTRESS</label>
										<div class="row">
											<div class="col-sm-4 form-group">
												<input class="simple-field" type="text" id="postcode" name="postcode" disabled>
											</div>
											<div class="col-sm-2 form-group">
												<input type="button" onclick="javascript:daumPostcode()" value="우편번호 찾기" class="button style-10"><br>
											</div>
										</div> <%-- /.row --%>
										
										<div class="row">
											<div class="col-sm-12 form-group">
												<input class="simple-field" type="text" id="address" name="address" disabled> 
												<span id="guide" style="color: #999" class="red-span"></span>
											</div>
										</div><%-- /.row --%>
								</div><%-- /.article-container --%>
	
								<hr>
								<button type="submit" class="button style-12" style="text-align: center">Register Account</button>
							
								</form>
							</div><%-- ./regist-box --%>
						</div><%-- ./information-entry--%>
					</div><%-- ./row --%>
				</div><%-- /.information-blocks --%>

				<%-- FOOTER --%>
				<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include> 
				
			</div><%-- /.content-push --%>
		</div><%-- /.content-center fixed-header-margin --%>

	<div class="clear"></div>

	</div>
	<%-- /.content-block --%>


	<script>

		$("#ckId").click(function() {
			var id = $("#id").val();
			console.log("id="+id);
			checkId(id);
		});

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
		
		/** id 중복 확인 */
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
						return false;
					}
				},
				error : function(xhr, statusText) {
					console.log("(" + xhr.status + ", " + statusText + ")");
					$("#id-span").html("불가능한 아이디 입니다.");
					return false;
				}
			});
		}

		/** 비밀번호, 확인 비밀번호 일치 확인 */
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

		/** 비밀번호 규칙 검사 */
		function checkRules(pw) {
			var pwRules = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*\W).{8,}$/;
			var match = pwRules.test(pw);

			if (!match) {
				$("#pw-rules-span").html("* 비밀번호는 8자리 이상이어야 하며 <br> 숫자,문자, 특수문자가 반드시 포함되어 있어야합니다.");
				return false;
			}

			$("#pw-rules-span").html("");
			return true;
		}
		
		/** submit 전에 아이디,비밀번호 유효성 한번 더 검사 */
		$("#formTag").submit(function(event){
			event.preventDefault();
			
			var id = $("#id").val();
			var that = $(this);
			
			$.ajax({
				url : "/member/checkId",
				data : "id="+id,
				type : "get",
				success : function(data) {
					//비동기 통신이기 때문에 아이디가 검사를 마친 후 비밀번호와 조건 검사를 해야함
					
					if (data == 'possible') {
						if(checkRules($("#pwOriginal").val()) === false){
							showHideAlert($(".alertDiv"), "비밀번호 규칙을 지켜주십시오.");
							return;
						}
						
						if(checkPw($("#pw-ck-span")) === false){
							showHideAlert($(".alertDiv"), "비밀번호가 일치하지 않습니다.");
							return;
						}
						
						that.get(0).submit();
					} else {
						showHideAlert($(".alertDiv"), "사용할 수 없는 아이디 입니다.");
						return;
					}
				}, 
				error : function(xhr, statusText) {
					console.log("(" + xhr.status + ", " + statusText + ")");
					return;
				}
			});
			
		});
	</script>

</body>
</html>
