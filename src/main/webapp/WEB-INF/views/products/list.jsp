<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

			<div class="content-push">

				<div class="information-blocks">
					<div class="row">
						<div class="col-md-9 col-md-push-3 col-sm-8 col-sm-push-4">
							<%-- 페이지 번호들 --%>
							<div class="page-selector">
								<div class="pages-box hidden-xs">
									<a href="#" class="square-button active">1</a> <a href="#"
										class="square-button">2</a> <a href="#" class="square-button">3</a>
									<div class="divider">...</div>
									<a href="#" class="square-button"><i
										class="fa fa-angle-right"></i></a>
								</div>
								<div class="shop-grid-controls"></div>
								<div class="clear"></div>
							</div><%--/.page selector --%>
							
							<div class="row shop-grid grid-view">
							
							<c:choose>
								<c:when test = "${list.size() == 0}">\
									<h1> 표시할 상품이 없습니다. </h1>
								</c:when> 
								
								<c:otherwise>
									<c:forEach items="${list}" var="product">
										<div class="col-md-3 col-sm-4 shop-grid-item">
											<div class="product-slide-entry shift-image">
												<div class="product-image">
													<img src="${dir}/${product.mainImage}" alt="" /> 
													<img src="${dir}/${product.mainImage}" alt="" />
												</div>
												<a class="tag">Toy</a> 
												<a class="title" href="/products?productNo=${product.productNo}">${product.name}</a>
												<div class="article-container style-1">
													<p>${product.description}</p>
												</div>
												<div class="price">
													<div class="current">${product.price}</div>
												</div>
										</div>
										<div class="clear"></div>
									</div><%-- /.col-md-3 col-sm-4 shop-grid-item --%>
								</c:forEach>
								</c:otherwise>
							</c:choose>
							
							</div>
							<div class="page-selector">
								<div class="description">Showing: 1-3 of 16</div>
								<div class="pages-box">
									<a href="#" class="square-button active">1</a> <a href="#"
										class="square-button">2</a> <a href="#" class="square-button">3</a>
									<div class="divider">...</div>
									<a href="#" class="square-button"><i
										class="fa fa-angle-right"></i></a>
								</div>
								<div class="clear"></div>
							</div>
						</div>
						<div class="col-md-3 col-md-pull-9 col-sm-4 col-sm-pull-8 blog-sidebar">
							<div class="information-blocks categories-border-wrapper">
								<div class="block-title size-3">Categories</div>
									<div class="accordeon-title"><a href="/products/list?page=1">인형/피규어</a></div>
							</div>
						</div>
						
					</div><%-- row --%>
				</div><%-- information-blocks --%>


				<%-- FOOTER --%>
				<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

			</div>
			<%-- /.content-push --%>
		</div>
		<%-- /.content-center fixed-header-margin --%>
	</div>
	<%-- /.content-block --%>

</body>
</html>