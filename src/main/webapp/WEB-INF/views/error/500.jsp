<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#outerDiv {
	margin-top: 5%;
	margin-bottom: 10%;
}
</style>
</head>
<body>
	<div id="content-block">
		<div class="content-center fixed-header-margin">
			<%-- HEADER --%>
			<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
			
			<div class="content-push">
				<div class="information-blocks">
					<div class="container-404">
						<div class="title">Sorry</div>
						<div class="text">
							죄송합니다!<br>
							기술적인 문제로 일시적으로 접속되지 않습니다.<br>
							잠시 후 다시 이용 부탁드립니다.<br>
							이용에 불편을 드려 죄송합니다.
						<a href="#" id="back">이전 페이지로</a><br>
						<a href="/">홈으로</a>
						</div>
					</div>
				</div>
				<div></div>
				<%-- FOOTER --%>
				<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

			</div>
			<%-- /.content-push --%>
		</div>
		<%-- /.content-center fixed-header-margin --%>
	</div>
	<%-- /.content-block --%>
	<script>
		$(document).ready(function() {
			$("#back").click(function() {
				history.back();
			})
		})
	</script>
</body>
</html>