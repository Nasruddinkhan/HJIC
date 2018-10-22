<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Navigation -->
<style>


		.sidebar ul li {
    border-bottom: 1px solid  #2F2E31 !important;
}
a:HOVER {
	background: #2F2E31 !important;
}
</style>
<nav class="navbar navbar-default navbar-static-top " role="navigation"
	style="background-color: #43b185;">
	<div class="navbar-header ">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#"
			style="color: #fff; font-size: 22px; font-style: oblique; font-weight: bold; margin-right: 100px; margin-left: 80px">
			<!--<img src="../suhel/volvo.jpg." style="width:20px;height:60px;">-->
		</a> <a class="navbar-brand" href="#"
			style="color: #fff; font-size: 14px; font-style: oblique;"> Login
			timestamp :<fmt:formatDate type="both" dateStyle="medium"
				timeStyle="long" value="${sessionScope.loginTime}"
				pattern="d MMM hh:mm a" />
		</a>


	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">


		<%-- <li>Login Timestamp :
		<fmt:formatDate type = "both" dateStyle = "medium" timeStyle = "long" value = "${sessionScope.loginTime}" pattern="d MMM hh:mm a" /></li> --%>
		<li style="color: #fff; font-size: 14px; font-style: oblique;">Welcome
			Mr. ${sessionScope.User.userName}</li>
		<!-- /.dropdown -->

		<!-- /.dropdown-alerts -->
		</li>

		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<!--    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>-->
				<li><a
					href="${pageContext.request.contextPath}/docs/userManual.pdf" onclick="ajaxindicatorstart();"
					target="_blank"><i class="fa fa-info" aria-hidden="true"></i>
						Help</a></li>
				<li class="divider"></li>
				<li><a
					href="${pageContext.request.contextPath}/login/logout.do" onclick="ajaxindicatorstart();"><i
						class="fa fa-sign-out fa-fw"></i> Logout</a></li>
			</ul> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<div class="navbar-inverse sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<!--<div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
							
                            <!-- /input-group --> <%-- <img
					src="${pageContext.request.contextPath}/suhel/logo.png"
					style="width: 250px; height: 150px;"> --%>
				</li>
				<li><a href="${pageContext.request.contextPath}/login/home.do" onclick="ajaxindicatorstart();"><i
						class="fa fa-home fa-fw fa-2x" style="color: #fff;"></i> <span
						style="color: #fff;">Home</span></a></li>
						<li><a
					href="${pageContext.request.contextPath}/feesController/feesPageCtr.do" onclick="ajaxindicatorstart();"><i
						class="fa fa-money fa-fw fa-2x" style="color: #fff;"></i> <span
						style="color: #fff; font-weight: bold;">fees</span></a></li>
			
				<c:if test="${sessionScope.User.userLevel=='2'}">
					<li><a href="${pageContext.request.contextPath}/user/users.do" onclick="ajaxindicatorstart();"><i
							class="fa fa-users fa-fw fa-2x" style="color: #fff;"></i> <span
							style="color: #fff;">User</span></a></li>
				</c:if>

				<li><a
					href="${pageContext.request.contextPath}/student/students.do" onclick="ajaxindicatorstart();">
						<i class="fa fa-users fa-fw fa-2x" style="color: #fff;"></i>
						<span style="color: #fff;">Student </span>
				</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/changePasswordPage.do" onclick="ajaxindicatorstart();"><i
						class="fa fa-key fa-fw fa-2x" style="color: #fff;"></i> <span
						style="color: #fff;">Change Password </span></a></li>

				<!-- dummy list -->
	<li><a
					href="${pageContext.request.contextPath}/feemaster/showFeemaster.do" onclick="ajaxindicatorstart();">
						<i class="fa fa-users fa-fw fa-2x" style="color: #fff;"></i>
						<span style="color: #fff;">Fee Master </span>
				</a></li>
				<li><a href=""></a> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
					<br /> <br /> <br /> <br /> <br /> <br /> <br /><br /> <br /> <br /><br /> <br /> <br /> <br /> <br /></li>

			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>
<script>

function ajaxindicatorstart() {
    		var endicator = '<div id="resultLoading" style="display:none;"><div><img  style="position: absolute;margin-left:50%;" name="spinner" src="img/loader.gif" ><div class="hdgMsf" >Please wait .......................</div></div><div class="bg"></div></div>'
    		console.log("endicator [" + endicator + "]");
    		if ($('body').find('#resultLoading').attr('id') != 'resultLoading') {
    			$('body').append(endicator);
    		}
    		$('#resultLoading').css({
    			'position' : 'fixed',
    			'z-index' : '10000000',
    			'top' : '0',
    			'left' : '0',
    			'right' : '0',
    			'bottom' : '0',
    			'margin' : 'auto'
    		});
    		$('#resultLoading .bg')
    				.css(
    						{
    							'background' : 'gray',
    							'ms-filter' : 'progid:DXImageTransform.Microsoft.Alpha(Opacity=50)', /* IE 8 */
    							'filter' : 'alpha(opacity=50)', /* IE 5-7 */
    							'-moz-opacity' : '0.5', /* Netscape */
    							'-khtml-opacity' : ' 0.5', /* Safari 1.x */
    							'opacity' : ' 0.5', /* Good browsers */

    							'width' : '100%',
    							'height' : '100%',
    							'position' : 'absolute',
    							'top' : '0'
    						});

    		$('#resultLoading>div:first').css({
    			'text-align' : 'center',
    			'position' : 'fixed',
    			'top' : '26%',
    			'left' : '0',
    			'right' : '0',
    			'bottom' : '0',
    			'margin' : 'auto',
    			'font-size' : '16px',
    			'z-index' : '10',
    			'color' : '#ffffff'

    		});
    		$('#resultLoading .bg').height('100%');
    		$('#resultLoading').fadeIn(500);
    		$('body').css('cursor', 'wait');
    	}

</script>