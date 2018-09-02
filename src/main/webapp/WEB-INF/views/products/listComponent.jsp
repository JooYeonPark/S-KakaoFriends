<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>

			<c:forEach items="${list}" var="product">
				<article class="col-md-3 col-sm-4 shop-grid-item">
					<div class="product-slide-entry shift-image">
						<div class="product-image">
							<img src="${dir}/${product.mainImage}" alt="" /> <img
								src="${dir}/${product.mainImage}" alt="" />
						</div>
						<a class="tag">Toy</a> <a class="title"
							href="/products?productNo=${product.productNo}">${product.name}</a>
						<div class="article-container style-1">
							<p>${product.description}</p>
						</div>
						<div class="price">
							<div class="current">
								￦
								<fmt:formatNumber value="${product.price}" groupingUsed="true" />
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</article>
				<%-- /.col-md-3 col-sm-4 shop-grid-item --%>
			</c:forEach>
</body>
</html>