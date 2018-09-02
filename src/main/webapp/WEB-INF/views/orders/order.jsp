<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/daumMap.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.0.3/js.cookie.js" type="text/javascript"></script>

<title>Order</title>

</head>

<body class="style-10">

	<div class="content-center fixed-header-margin">
		<%-- HEADER --%>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

		<div class="clear"></div>
		
		<div class="content-push">

			<form id="orderForm" action="/orders/result" method="POST">
				<input type="hidden" name="productNo" value="${product.productNo}"> 
				
				<div class="content-push">
					<div class="information-blocks">
					
						<%-- 상품 정보 --%>
						<div class="row">
							<div class="col-sm-9 information-entry">
								<h3 class="cart-column-title size-1">Products</h3>

									<div class="traditional-cart-entry style-1">
										<a href="#" class="image">
											<img class="order-image" src="${dir}/${product.mainImage}" alt="">
										</a>
										<div class="content">
											<div class="cell-view" name="dataset">
												<a class="tag" href="#">Toy</a> 
												<a class="title" href="#">${product.name}</a>
												<div class="inline-description" >
													Order Qty : ${quantity}
												</div>
												<div class="price">
													<div class="current">
														￦
														<fmt:formatNumber value="${product.price}" groupingUsed="true" />
													</div>

													<input type="hidden" name="qty" value="${quantity}">
													<input type="hidden" name="price" value="${product.price}"> 

												</div>
											</div>
										</div>
									</div>
							</div>
							<div class="col-sm-3 information-entry totalOrder">
			          <h3 class="cart-column-title size-1"
			            style="text-align: center;">Subtotal</h3>
			          <div class="sidebar-subtotal">
			            <div class="price-data">
			            	<input type="hidden" name="totalPrice" value="${product.price*quantity}">
			              <div class="main totalPrice" id="totalPrice">
			              	￦
											<fmt:formatNumber value="${product.price*quantity}" groupingUsed="true" />
										</div>
			            </div>
			          </div>
			        </div>
							
						</div><%-- /.row --%>
					</div><%--/.information-blocks --%>
				</div><%--/.content-push --%>

				<div class="clear"></div>
				<div class="enterContent-4"></div>

				<div class="orderinfomation-blocks">
					<div class="accordeon">
						
						<%-- 주문자 정보 --%>
						<div class="accordeon-title active">
							<h3 class="block-title order-main-heading">주문자 정보</h3>
						</div>
						<div style="display: block;" class="accordeon-entry">
							<div class="article-container style-1">
								<div class="row">
									<div class="col-sm-4 form-group">
										<label class="Pname">성명<span>*</span></label> 
										<input class="simple-field" type="text" id="orderName" required
											value="${member.name}" readonly="readonly" />
									</div>
									<div class="col-sm-4 form-group">
										<label>전화번호<span>*</span></label> 
										<input class="simple-field" type="text" id="orderPhone" required value="${member.phone}"
											readonly="readonly" />
									</div>
									<div class="col-sm-1"></div>
								</div>
								<div class="row">
									<div class="col-sm-3 form-group">
										<label>주소</label> 
										<input class="simple-field" type="text" id="orderPost" value="${member.postcode}"
											readonly="readonly" />
									</div>
									<div class="clear"></div>
									<div class="col-sm-6 form-group">
										<input class="simple-field" type="text" id="orderAddress"
											required value="${member.address}" readonly="readonly" />
									</div>
									<div class="col-sm-3"></div>
									<div class="col-sm-3">
										<label class="checkbox-entry"> 
										<input type="checkbox" id="orderInfoCk" name="orderInfoCk" /> 
											<span class="check"></span>
											배송정보와 주문정보가 같습니다
										</label>
									</div>
								</div>
							</div>
						</div><%-- /. accordeon-entry --%>

						<div class="enterContent-1"></div>
						
						<%-- 배송지 정보 --%>
						<div class="accordeon-title active">
							<h3 class="block-title order-main-heading">배송지 정보</h3>
						</div>
						<div class="accordeon-entry">
							<div class="article-container style-1">
								<div class="row">
									<div class="col-sm-4 form-group">
										<label>성명<span>*</span></label> 
										<input class="simple-field" type="text" id="receiverName" required placeholder="성명"
											value="" name="receiver" />
									</div>
									<div class="col-sm-4 form-group">
										<label>전화번호<span>*</span></label> 
										<input class="simple-field" type="text" id="receiverPhone"
											placeholder="ex) 010-1234-1234" required value=""
											name="phone" />
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3 form-group">
										<label>주소 <span>*</span></label> 
										<input class="simple-field" type="text" id="postcode" value="" name="postcode"
											placeholder="우편번호" />
									</div>
									<div class="col-sm-4 form-group">
										<label><span></span></label> 
										<input type="button" value="우편번호 찾기" class="button style-10 daumPost" onClick="javascript:daumPostcode();">
									</div>
									<div class="clear"></div>
									<div class="col-sm-5 form-group">
										<input class="simple-field" type="text" id="address"
											required value="" placeholder="기본주소" />
									</div>
									<div class="col-sm-5 form-group">
										<input class="simple-field" type="text" id="receiverAddress2"
											required value="" placeholder="상세주소" />
										<span id="guide" style="color: #999" class="red-span"></span>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-10 form-group">
										<label>배송 메세지 <span>*</span></label>
										<textarea class="simple-field" id="messageTA" required name="message">늘 감사합니다^^</textarea>
									</div>
								</div>
							</div>
						</div><%-- /. accordeon-entry --%>

						<div class="clear"></div>
						<div class="enterContent-1"></div>

						<%-- 결제 정보 --%>
						<div class="accordeon-title active">
							<h3 class="block-title order-main-heading">결제 정보</h3>
						</div>
						<div class="accordeon-entry">
							<div class="article-container style-1">
								<div class="row">
									<div class="col-sm-2 form-group">
										<label class="checkbox-entry radio"> 
										<input type="radio" name="payment" value="card" checked="checked"> 
										<span class="check"></span> 신용카드
										</label>
									</div>
									<div class="col-sm-2 form-group">
										<label class="checkbox-entry radio"> 
										<input type="radio" name="payment" value="phone"> 
										<span class="check"></span> 휴대폰결제
										</label>
									</div>
									<div class="col-sm-2 form-group">
										<label class="checkbox-entry radio"> 
										<input type="radio" name="payment" value="bankbook">
										<span class="check"></span> 무통장입금
										</label>
									</div>
									<div class="col-sm-2 form-group">
										<label class="checkbox-entry radio"> 
										<input type="radio" name="payment" value="creditTransfer"> 
										<span class="check"></span> 계좌이체
										</label>
									</div>
									<div class="col-sm-2 form-group">
										<label class="checkbox-entry radio"> 
										<input type="radio" name="payment" value="kakaoPay"> 
										<span class="check"></span> 카카오페이
										</label>
									</div>
								</div>
							</div>
						</div><%-- /. accordeon-entry --%>

						<div class='col-sm-10 cardChoice'></div>
						<div class="cardInfo"></div>
						<input type="hidden" id="orderlist" value="${orderList}">

					</div>

					<div>
						<div class="col-sm-10"></div>
						<input type="submit" value="결제하기" class='button style-10' />
					</div>

				</div>
			</form>
			
			<div class="enterContent-2"></div>
			<div class="clear"></div>

			<%-- FOOTER --%>
			<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


		</div>
		<%-- content-push --%>
	</div>
	<%-- /.content-center --%>


	<script>
	
	$("#orderInfoCk").change(function() {
		//체크박스 클릭시 주문정보=배송정보
		if ($("#orderInfoCk").is(":checked")) {
			$("#receiverName").val($("#orderName").val())
			$("#receiverPhone").val( $("#orderPhone").val())
			$("#postcode").val($("#orderPost").val())
			$("#address").val($("#orderAddress").val())
		} else {
			$("#receiverName").val("");
			$("#receiverPhone").val("");
			$("#postcode").val("");
			$("#address").val("");
		}
	});
	

	$("#orderForm").submit(function(event) {
		event.preventDefault();

		// 기본주소+상세주소 
		var address = $("#address").val() + " " + $("#receiverAddress2").val();

		var submitStr = "";
		submitStr += "<input type='hidden' name='address' value='" + address + "'>";
		
		//textArea 이스케이프 문자 처리
		$("#messageTA").text($("#messageTA").val());
		
		$(this).append(submitStr);
		$(this).get(0).submit();
	})
	
	</script>
</body>
</html>