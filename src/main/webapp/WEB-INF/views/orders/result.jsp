<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>order result</title>
</head>
<body class="style-10">
	<div id="content-block">
		<div class="content-center fixed-header-margin">
			<%-- HEADER --%>
			<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

			<div class="content-push">
				<div class="information-blocks">
					<div class="row">
						<div class="col-sm-3 information-entry"></div>
						<div class="col-sm-6 information-entry">
							<div class="login-box">
								<div class="article-container style-1">
									<h3>${name}님의주문정보</h3>

									<div class="enterContent-2"></div>

									<p>받으시는 분 &nbsp;: &nbsp;${order.receiver}</p>
									<p>연락처 : &nbsp;${order.phone}</p>
									<p>주소 : &nbsp; ${order.address}</p>
									<p> 주문 가격 : &nbsp;
										￦<fmt:formatNumber value="${order.totalPrice}" groupingUsed="true" />
									</p>
									<p>배송 메세지 : &nbsp;${order.message}</p>

									<div class="enterContent-1"></div>
								</div>
								<a href="/orders/listdetail?ordersNo=${order.ordersNo}" class="button style-14">주문내역 보러가기</a> 
								<a href="/" class="button style-14">메인페이지</a>
							</div>
						</div>
						<div class="col-sm-3 information-entry"></div>
					</div><%-- ./row --%>
					<br>

				</div><%-- ./information-blocks --%>
				
				<%-- FOOTER --%>
				<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

			</div><%-- /.content-push --%>
		</div><%-- /. content-center --%>
	</div><%-- /. content-block --%>

</body>
</html>