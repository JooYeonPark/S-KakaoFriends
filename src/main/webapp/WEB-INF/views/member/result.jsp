
<%@ page language="java" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>Regist Result</title>
</head>
<body class="style-10">



	<div id="content-block">

		<div class="content-center fixed-header-margin">
			<%-- HEADER --%>
			<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include> 

			<div class="content-push">

				<div class="information-blocks">
            <div class="row">
            	<div class="col-sm-3 information-entry">
            	</div>
                <div class="col-sm-6 information-entry">
                    <div class="login-box">
                        <div class="article-container style-1">
                            <h3>!WELCOME!</h3>
                            <br><br><br>
                            <p>${id}님 환영합니다.<p>
                            <p>저희 사이트에 가입해주셔서 진심으로 감사드립니다.</p>
                            <p>행복한 하루되세요 :)</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 information-entry">
            	</div>
            </div><%-- ./row --%>
            <br>
            
           </div><%-- ./information-blocks --%>

				<%-- FOOTER --%>
				<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include> 
				
			</div><%-- /.content-push --%>

		</div><%-- /.content-center fixed-header-margin --%>

	<div class="clear"></div>

	</div>
	<%-- /.content-block --%>


</body>
</html>
