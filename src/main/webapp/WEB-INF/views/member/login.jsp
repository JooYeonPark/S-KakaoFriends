
<%@ page language="java" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>
</head>
<body class="style-10">
	<div id="content-block">
		<div class="alertDiv redAlertDiv"></div>
		<div class="content-center fixed-header-margin">
			
			<%-- HEADER --%>
			 <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include> 

			<div class="information-blocks">
				<div class="row">
					<div class="col-sm-6 information-entry">
						<div class="login-box">
							<div class="article-container style-1">
								<h3>Registered Customers</h3>
								<p>다양한 서비스를 이용하기 위해 로그인을 해주세요~:)</p>
							</div>
							<form action="/member/login" method="post">
								<label>ID</label> 
								<input class="simple-field" type="text"placeholder="Enter ID" name="id" /> 
								<label>Password</label> 
								<input class="simple-field" type="password" placeholder="Enter Password" name="password" />
								<div class="button style-10">
									Login 
									<input type="submit" value="" />
								</div>
							</form>
						</div>
					</div>
					<div class="col-sm-6 information-entry">
						<div class="login-box">
							<div class="article-container style-1">
								<h3>New Customers</h3>
								<p>회원들만을 위한 다양하고 재미있는 서비스들이 기다리고 있습니다~!</p>
							</div>
							<a class="button style-12" href="/member/regist">
								Register Account</a>
							<a class="button style-12" href="/member/testLogin">
								Tester Login</a>
						</div>
					</div>
				</div>
			</div>


			<%-- FOOTER --%>
			<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include> 
			
		</div><%-- /.content-center fixed-header-margin --%>

	</div>
	<div class="clear"></div>

	<script>
		$(document).ready(function(){
			var msg = '${msg}'
			if(msg == 'ERROR'){
				showHideAlert($(".alertDiv"), "ID나 PASSWORD를 다시 한번 확인해주세요!")
			}
		});
	</script>

</body>
</html>
