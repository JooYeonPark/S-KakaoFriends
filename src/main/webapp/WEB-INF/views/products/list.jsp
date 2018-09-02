<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
									
							<%-- 상품 --%>
							<div class="row shop-grid grid-view" id="product-list"></div>
							
							<%-- 표시할 상품이 없을 때 --%>
							<div class="block-title size-3" id="no-content" style="text-align: center;"></div>
							
							<%-- 로딩이미지 --%>
							<div id="product-content"></div>
							
							<%-- 더보기 아이콘 --%>
               <div class="row shop-grid grid-view endlistView"></div>
                 <div class="page-selector">
                 		<a class="endMoreView" id="endMoreView">
                  	<img src="/resources/img/thin-arrowheads-pointing-down.png" style="display:block;">
                  	</a>
                 <div class="clear"></div>
               	</div><%-- /.Gpurchase List --%>
						
						</div><%--/.col-md-9 col-md-push-3 col-sm-8 col-sm-push-4 --%>
						
						
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

			</div><%-- /.content-push --%>
		</div><%-- /.content-center fixed-header-margin --%>
	</div><%-- /.content-block --%>
	
	<script>
	
	var page = 0;
	
	$(document).ready(function(){
		//첫 상품들 로드
		productLoading(0);
	});
	
		/** 리스트 로딩 */
		$("#endMoreView").click(function(){
			page += 1;
			productLoading(page);
		});
		
		function productLoading(page){
			loadingImgView();
			
			$.ajax({
				url : '/products/list/'+page,
				type : 'get', 
				success : function(data){
					var size = $($.parseHTML(data)).filter("article").length;
					
					if(size>0)	{ 
						$("#product-list").append(data); 
					}else{
						$("#no-content").html("더이상 표시할 상품이 없습니다.");
						$(".page-selector").hide();
					}
					
					$("#loadingIcon").remove();
				}, error : function(xhr, statusText) {
					console.log("(" + xhr.status + ", " + statusText + ")");
					$("#loadingIcon").remove();
				}
			});
		}
		
		function loadingImgView(){
			var loadingImg = "<img src='/resources/img/loading.gif' id='loadingIcon' style='width:15em;  margin-left: 10em;'/>";
			$("#product-content").append(loadingImg);
		}
		
	</script>
</body>
</html>