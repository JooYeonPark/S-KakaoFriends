<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<title>order list</title>
<head>
<%-- Date Range Picker --%>

<style>
.cart-table {
	text-align: center;
}

.cart-table th {
	padding: 10px 15px;
}

.cart-table td {
	padding: 10px 20px;
}

th>select.yearselect {
	float: left;
}

.tag:hover {
	text-decoration: none;
	color: #ca1515;
}
</style>
</head>
<body>

	<div id="content-block">
		<div class="content-center fixed-header-margin">
			<%-- HEADER --%>
			<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>


			<div class="content-push">
				<div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 20%">
					<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
					<span></span> <b class="caret"></b>
				</div> 
				
				<div></div>
				<div class="order-table"></div>
				
				<%-- FOOTER --%>
				<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include> 
			
			</div><%-- content-push --%>
		</div><%--/.content-center --%>
	</div><%-- /.content-block --%>
	
	<div class="clear"></div>

	<script>
	
		$(document).ready(function() {
			var start = moment().subtract(1, 'month'); // 한 달 전
			var end = moment();
			var list;
			
			 /* Date Range Picker */
			 $("#reportrange").daterangepicker(
					{
						locale : {
							format : 'YYYY/MM/DD',
							daysOfWeek : [ "일", "월", "화", "수","목", "금", "토" ],
							monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", 
															"10월", "11월","12월" ],
						},
						showDropdowns : true,
					},
					function(start, end, label) {
						console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
						changeDate(start, end);
						getList(start.format('YY-MM-DD'), end.format('YY-MM-DD'));
					});   
					

			//구매이력 리스트 출력
			getList(start.format('YY-MM-DD'), end.format('YY-MM-DD'));
			changeDate(start, end);
			
		}); 
						
		
		/** 리스트뿌려주기 */
		function getList(start, end) {
			$.ajax({
				url : "/orders/"+start+"/"+end,
				type : "get",
				dataType : "html",
				success : function(data) {
					console.log("success");
					console.log(data);
					$(".order-table").html(data);
					$(".order-table").show();
				}, error: function(xhr, statusText){
					console.log("("+xhr.status+", "+statusText+")");
				}
			});
		}				
						
		function changeDate(start, end) {
			$("#reportrange span").html(start.format('YYYY/MM/DD') + ' - '+ end.format('YYYY/MM/DD'));
		}
		
	</script>

</body>
</html>
