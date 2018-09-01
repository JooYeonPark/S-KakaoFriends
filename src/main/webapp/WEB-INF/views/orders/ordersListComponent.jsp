<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<th class="column-1">Product Name</th>
								<th class="column-2">Unit Price</th>
								<th class="column-3">Qty</th>
								<th class="column-4">Subtotal</th>
								<th class="column-5">Status</th>
							</tr>
							
			<c:forEach items="${list}" var="item">
							<tr>
								<td>
									<div class="traditional-cart-entry">
										<a href="/product/gpurchase/'+item.gpurchaseNo+'" class="image">
											<img src="${dir}/${item.product.mainImage}" alt="">
										</a>
										<div class="content">
											<div class="cell-view">
												<a class="tag">Toy</a>
												<a href="#" class="title">${item.product.name}</a>
											</div>
                		</div><%-- /.content --%>
              		</div><%-- /.traditional-cart-entry --%>
           			</td>
								<td>${item.product.price} 원</td>	
								<td>
            			<div class="quantity-selector detail-info-entry">
	             		 <div class="entry number">${item.qty}</div>
              		</div>
            		</td>
            		<td><div class="subtotal">${item.qty*item.product.price} 원</div></td>
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