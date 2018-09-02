<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- 개행처리를 위한 변수 선언 --%>
<% pageContext.setAttribute("newLine", "\\n"); %>

<!DOCTYPE html>
<html>
<head>
<title>Product</title>
</head>
<body class="style-10">
	<div id="content-block">
		<div class="content-center fixed-header-margin">

			<%-- Header --%>
			<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

			<div class="clear"></div>
			
			<div class="content-push">
				<div class="information-blocks">
					<div class="row">
						<div class="col-sm-6 information-entry">
							<div class="product-preview-box">
								<div class="swiper-container product-preview-swiper"
									data-autoplay="0" data-loop="1" data-speed="500"
									data-center="0" data-slides-per-view="1">
									<div class="swiper-wrapper">

										<c:forEach var="image" items="${product.images}" begin="0"
											end="3">
											<div class="swiper-slide">
												<div class="product-zoom-image">
													<img src="${dir}/${image.path}" alt=""
														data-zoom="${dir}/${image.path}" />
												</div>
											</div>
										</c:forEach>

									</div>
									<div class="pagination"></div>

									<div class="product-zoom-container">
										<div class="move-box">
											<img class="default-image" src="${dir}/${product.images[0]}"alt="" /> 
											<img class="zoomed-image" src="${dir}/${product.images[0]}" alt="" />
										</div>
										<div class="zoom-area"></div>
									</div>
								</div>
								
								<div class="swiper-hidden-edges">
									<div class="swiper-container product-thumbnails-swiper"
										data-autoplay="0" data-loop="0" data-speed="500"
										data-center="0" data-slides-per-view="responsive"
										data-xs-slides="3" data-int-slides="3" data-sm-slides="3"
										data-md-slides="4" data-lg-slides="4" data-add-slides="4">
										<div class="swiper-wrapper">
											<c:forEach var="image" items="${product.images}" begin="0" end="3" varStatus="status">
												<c:choose>
													<c:when test="status == 0">
														<div class="swiper-slide selected">
													</c:when>
													<c:otherwise>
														<div class="swiper-slide">
													</c:otherwise>
												</c:choose>
												<div class="paddings-container">
													<img src="${dir}/${image.path}" alt="" />
												</div>
											</div><%-- /. swiper-slide --%>
										</c:forEach>
									</div><%-- /. swiper-wrapper--%>
									<div class="pagination"></div>
								</div><%--/. swiper-container product-thumbnails-swiper--%>
							</div><%-- /. swiper-hidden-edges--%>
						</div>
					</div>
					
					<%-- 상품정보 --%>
						<div class="col-sm-6 information-entry">
							<div class="product-detail-box">
								<h1 class="product-title">${product.name}</h1>
								<h3 class="product-subtitle">Toy</h3>
								<div class="product-description detail-info-entry">
										<c:set value="${fn:escapeXml(product.description)}"
											var="description"></c:set> 
										${fn:replace(description,newLine,"<br/>")}
								</div>
								<div class="price detail-info-entry">
									<div class="current" id="price">
									￦${product.price}
									</div>
								</div>
							
							
								<div class="quantity-selector detail-info-entry col-sm-6">
									<div class="detail-info-entry-title">Quantity</div>
									<div class="entry number-minus">&nbsp;</div>
									<div class="entry number" id="quantity">1</div>
									<div class="entry number-plus">&nbsp;</div>
								</div>
								
								<div class="quantity-selector detail-info-entry col-sm-6">
									<div class="detail-info-entry-title">Total</div>
									<div class="price detail-info-entry">
										<div id="subtotal">
											￦${product.price}
										</div>
									</div>
								</div>
								
								
								<form action="/orders" method="post" id="formtag">
									<div class="detail-info-entry">
										<input type="hidden" value='${product.productNo}' name="productNo">
										<input type="hidden" value='${product.name}' name="name">
										<input type="hidden" value='${product.mainImage}' name="mainImage">
										<button class="button style-10 col-sm-12" type="submit">Buy Now</button> 
										<div class="clear"></div>
									</div>
								</form>
							</div>
						</div><%-- /. col-sm-6 information-entry--%>
				</div>


			<%-- 상품 상세 정보 --%>
			<div class="information-blocks" style="margin-top:10px;">
				<div class="tabs-container style-1">
					<div class="swiper-tabs tabs-switch">
						<div class="title">Product info</div>
						<div class="list">
							<a class="tab-switcher active">Product description</a>
							<div class="clear"></div>
						</div>
					</div>
					<div>
						<div class="tabs-entry">
							<div class="article-container style-1">
								<div class="row">
									<div class="information-entry">
										<c:forEach items="${product.images}" var="image">
											<div class="product-zoom-image">
												<img src="${dir}/${image.path}" alt=""
													data-zoom="${dir}/${image.path}" style="width: 100%;" />
											</div>
										</c:forEach>
									</div>
								</div>
								<%-- /.row --%>
							</div>
							<%-- /.article-container  --%>
						</div>
						<%-- /.tabs-entry --%>
					</div>
				</div>
			</div>

			<%-- FOOTER --%>
			<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

		</div>
		<%-- /.content-push --%>
	</div>
	<%-- /.content-center fixed-header-margin --%>
	</div>
	<%-- /.content-block --%>
	
	<script>
		$("#formtag").submit(function(event){
			event.preventDefault();
			
			var price = $("#price").text().trim().substr(1);
			var total = $("#subtotal").text().trim().substr(1);
			var quantity = $("#quantity").text();
			
			console.log("price:"+price)
			
			var html = "<input type='hidden' name='price' value="+price+">"+
									"<input type='hidden' name='total' value="+total+">"+
									"<input type='hidden' name='quantity' value="+quantity+">";
									
			$(this).append(html);
			$(this).get(0).submit();
		});

	  $('.number-plus').on('click', function(){
		  calculate("plus");
	  });
	
	  $('.number-minus').on('click', function(){
		  calculate("minus");
		 });
		
		function calculate(op){
			//￦ 제외하기 위해 substr
			var price = Number($("#price").text().trim().substr(1).trim());
			var subtotal = Number($("#subtotal").text().trim().substr(1).trim()); 
			 
			if(op == 'minus')		{
				if(subtotal>price){
					subtotal -= price;
				}
			}
			else { subtotal += price; }
				
			$("#subtotal").text("￦ "+subtotal);
		}
		
		</script>
	
</body>
</html>