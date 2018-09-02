<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  	<title>Kakao Friends Shop</title>
</head>
<body class="style-10">

    <%-- LOADER --%>
    <div id="loader-wrapper">
        <div class="bubbles">
            <div class="title">loading</div>
            <span></span>
            <span id="bubble2"></span>
            <span id="bubble3"></span>
        </div>
    </div>

    <div id="content-block">

        <div class="content-center fixed-header-margin">
            
            <%-- HEADER --%>
            <jsp:include page="layout/header.jsp"></jsp:include> 

            <div class="content-push">

                <div class="parallax-slide fullwidth-block small-slide" style="margin-bottom: 30px; margin-top: -25px;">
                    <div class="swiper-container" data-autoplay="5000" data-loop="1" data-speed="500" data-center="0" data-slides-per-view="1">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide no-shadow active" data-val="0" 
                            	style="background-image: url(/resources/img/full-width-1.png);"> 
                            </div>
                            <div class="swiper-slide no-shadow" data-val="1" 
                            	style="background-image: url(/resources/img/full-width-2.png);"> 
                            </div>
                        </div>
                        <div class="pagination"></div>
                    </div>
                </div>

                <div class="information-blocks">
                    <div class="row">
                        <div class="col-sm-4 information-entry">
                            <div class="special-item-entry">
                                <img src="/resources/img/thumb1.jpg" alt="" />
                                <a class="button style-6" href="/products/list">shop now</a>
                            </div>
                        </div>
                        <div class="col-sm-4 information-entry">
                            <div class="special-item-entry">
                                <img src="/resources/img/thumb2.jpg" alt="" />
                                <a class="button style-6" href="/products/list">shop now</a>
                            </div>
                        </div>
                        <div class="col-sm-4 information-entry">
                            <div class="special-item-entry">
                                <img src="/resources/img/thumb3.jpg" alt="" />
                                <a class="button style-6" href="/products/list">shop now</a>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- FOOTER --%>
               <jsp:include page="layout/footer.jsp"></jsp:include>
               
					</div><%-- /.content-push --%>
        </div><%-- /. content-center fixed-header-margin --%>
        <div class="clear"></div>
    </div><%-- /. content-block --%>
    
</body>
</html>
