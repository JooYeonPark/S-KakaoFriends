
<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no, minimal-ui" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/css/idangerous.swiper.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link
	href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700%7CDancing+Script%7CMontserrat:400,700%7CMerriweather:400,300italic%7CLato:400,700,900'
	rel='stylesheet' type='text/css' />
<link href="/resources/css/style.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/resources/img/favicon-6.ico" />

<script src="/resources/js/jquery-2.1.3.min.js"></script>
<script src="/resources/js/idangerous.swiper.min.js"></script>
<script src="/resources/js/global.js"></script>

<!-- custom scrollbar -->
<script src="/resources/js/jquery.mousewheel.js"></script>
<script src="/resources/js/jquery.jscrollpane.min.js"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


<title>Kakao Friends Shop</title>

</head>
<body>

	<%-- HEADER --%>
	<div class="header-wrapper style-10">
		<header class="type-1">

			<div class="header-product">
				<div class="logo-wrapper">
					<a href="/" id="logo"> 
					<img alt="" src="/resources/img/logo-9.png"></a>
				</div>
				<div class="product-header-content">
					<div class="line-entry">
						<div class="menu-button responsive-menu-toggle-class">
							<i class="fa fa-reorder"></i>
						</div>
						<c:choose>
							<%-- 로그인 전 --%>
							<c:when test="${empty memberNo}">
								<div class="header-top-entry increase-icon-responsive">
									<div class="title">
										<a class="fa fa-user" href="/member/login"> 
											<span>Sign Up / Sing in</span>
										</a>
									</div>
								</div>
							</c:when>

							<%-- 로그인 후 --%>
							<c:otherwise>
								<div class="header-top-entry">
									<div class="title">
										<a class="fa fa-user" href="/member/logout"><span>LogOut</span> </a>
										<a class="fa fa-list" href="/orders/list"> <span>Order List</span> </a> 
									</div>
								</div>
							</c:otherwise>

						</c:choose>
					</div>
				</div>
			</div>

			<div class="close-header-layer"></div>
			<div class="navigation">
				<div class="navigation-header responsive-menu-toggle-class">
					<div class="title">Navigation</div>
					<div class="close-menu"></div>
				</div>
				<div class="nav-overflow">
					<nav>
						<ul>
							<li class="full-width"><a href="/products/list?page=0" class="active">인형/피규어</a><i
								class="fa fa-chevron-down"></i></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<div class="clear"></div>
	</div>
	<%-- /. header-wrapper --%>


</body>
</html>

