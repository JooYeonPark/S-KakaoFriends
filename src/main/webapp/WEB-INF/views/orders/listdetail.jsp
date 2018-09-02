<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Order Detail</title>
</head>

<body>
	<div id="content-block">
		<div class="content-center fixed-header-margin">
			<%-- HEADER --%>
			<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

			<div class="content-push">
				<div class="container">
				
					<div class="col-sm-6 col-md-6 information-entry">
						<h3 class="block-title">
							<i class="fa fa-info-circle"></i>&nbsp;Order Information
						</h3>
						<div class="article-container style-1">
							<h5>Order Number</h5>
							<p>${order.ordersNo}</p>
						</div>
						<div class="article-container style-1">
							<h5>Order Date</h5>
							<fmt:formatDate pattern="yyyy-MM-dd H:m:s" value="${order.date}"/>
						</div>
						<div class="article-container style-1">
							<h5>PRODUCT NAME</h5>
							<p>${order.product.name}</p>
						</div>
						<div class="article-container style-1">
							<h5>Status</h5>
							<p>${order.deliverStatus}</p>
						</div>
						<div></div>
					</div><%-- /. information-entry--%>

					<div class="col-sm-6 col-md-6 information-entry">
						<h3 class="block-title">
							<i class="fa fa-credit-card"></i>&nbsp;결제정보
						</h3>
						<div class="article-container style-1">
							<h5>Total Amount</h5>
							<fmt:formatNumber value="${order.totalPrice}" groupingUsed="true" />
						</div>
						<div class="article-container style-1">
							<h5>Payment Method</h5>
							<p>${order.payment}</p>
						</div>
					</div><%-- /. information-entry--%>

					<div class="col-sm-12 col-md-12 information-entry">
						<h3 class="block-title">
							<i class="fa fa-truck"></i>&nbsp;Receiver Information
						</h3>
						<div class="article-container style-1">
							<h5>Name</h5>
							<p>${order.receiver}</p>
						</div>
						<div class="article-container style-1">
							<h5>Phone Number</h5>
							<p>${order.phone}</p>
						</div>
						<div class="article-container style-1">
							<h5>Address</h5>
							<p>${order.address}${order.postcode}</p>
						</div>
					</div><%-- /. information-entry--%>

					<div class="col-md-12 information-entry login-box" style="margin-top: 5%; margin-bottom: 5%;">
						<h3 class="block-title">GUIDE</h3>
						<div class="article-container style-1">
							<h5>거래명세서 발행 안내</h5>
							<p>거래명세서는 영수증용도로도 사용이 가능합니다.</p>
						</div>
						<div class="article-container style-1">
							<h5>신용카드매출전표 발행 안내</h5>
							<p>신용카드 결제는 사용하는 PG사 명의로 발행됩니다.</p>
						</div>
						<div class="article-container style-1">
							<h5>세금계산서 발행 안내</h5>
							<p>신용카드 결제는 사용하는 PG사 명의로 발행됩니다.</p>
							<ul>
								<li class="item1">부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달
									10일까지만 요청하실 수 있습니다.</li>
								<li class="item2">세금계산서는 사업자만 신청하실 수 있습니다.</li>
								<li class="item3">배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
								<li class="item4">[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로
									사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li>
								<li class="item5">[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
								<li class="item6">세금계산서는 실결제금액에 대해서만 발행됩니다.(적립금과 할인금액은
									세금계산서 금액에서 제외됨)</li>
							</ul>
						</div>
						<div class="article-container style-1">
							<h5>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경 안내</h5>
							<p>신용카드 결제는 사용하는 PG사 명의로 발행됩니다.</p>
							<ul>
								<li class="item1">변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신
									주문에 대해서는 세금계산서 발행이 불가하며<br>신용카드매출전표로 부가가치세 신고를 하셔야
									합니다.(부가가치세법 시행령 57조)
								</li>
								<li class="item2">상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만
									세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</li>
							</ul>
						</div>
					</div><%-- /. information-entry--%>

					<div class="clear"></div>
				</div>

				<div></div>

				<%-- FOOTER --%>
				<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

			</div><%-- /.content-push --%>
		</div><%-- /.content-center fixed-header-margin --%>
	</div><%-- /.content-block --%>
	
</body>
</html>
