<%-- 주문 이력의 상세 항목 --%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div class="information-blocks">
	<c:choose>
		<c:when test="${list.size() == 0}">
			<div class="container-404">
				<div class="description">이력이 없습니다.</div>
				<div class="text">날짜를 다시 선택하여 주십시오.</div>
			</div>
		</c:when>

		<c:otherwise>
			<div class="table-responsive">
					<table class="cart-table">
						<tbody>
							<tr>
								<th class="column-1">Order Number</th>
								<th class="column-1">Product Name</th>
								<th class="column-2">Unit Price</th>
								<th class="column-3">Qty</th>
								<th class="column-4">Subtotal</th>
								<th class="column-4">Status</th>
							</tr>
							
			<c:forEach items="${list}" var="item">
							<tr>
								<td><a href="/orders/listdetail?ordersNo=${item.ordersNo}">${item.ordersNo}</a></td>
								<td>
									<div class="traditional-cart-entry">
										<a href="/product/gpurchase/'+item.gpurchaseNo+'" class="image">
											<img src="${dir}/${item.product.mainImage}" alt="">
										</a>
										<div class="content">
											<div class="cell-view">
												<a class="tag">Toy</a>
												<a href="/products?productNo=${item.product.productNo}" class="title">${item.product.name}</a>
											</div>
                		</div><%-- /.content --%>
              		</div><%-- /.traditional-cart-entry --%>
           			</td>
								<td>￦<fmt:formatNumber value="${item.product.price}" groupingUsed="true" /></td>	
								<td>
            			<div class="quantity-selector detail-info-entry">
	             		 <div class="entry number">${item.qty}</div>
              		</div>
            		</td>
            		<td>
            			<div class="subtotal">
            				￦<fmt:formatNumber value="${item.qty*item.product.price}" groupingUsed="true" />
            		 	</div>
            		 </td>
            		<td>${item.deliverStatus}</td>
							</tr>
			</c:forEach>
				</tbody>
			</table>
		</div><%-- /.table-responsive --%>
		</c:otherwise>
		
	</c:choose>
</div><%-- infromation-blocks --%>
</body>
</html>