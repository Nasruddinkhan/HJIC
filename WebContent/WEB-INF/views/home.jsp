<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style>

body {
	font-family: Arival ! important;
	font-size: 14px ! important;
	line-height: 1.42857143 ! important;
	color: #5a4444 ! important;
	background-color: #fff ! important;
}
#page-wrapper {
    position: inherit;
    margin: 0 0 0 117px !important;
    padding: 0 30px;
    border-left: 1px solid #e7e7e7;
}
.main-box {
    text-align:center;
    padding:20px;
    border-radius:5px;
    -moz-border-radius:5px ;
    -webkit-border-radius:5px;
    margin-bottom:40px;
}
    .main-box a,.main-box a:hover {
        color:#fff;
        text-decoration:none;

    }
.mb-dull {
    background-color:#8F8F2C;
}
.mb-red {
    background-color:#d36f2e;
}
.mb-pink {
    background-color:#FF2F71;
}
    .main-box h5 {
        font-size:16px;
        font-weight:800;
        text-transform:uppercase;
    }
 
</style>
<!-- 
	<style>
	.box {
    width:70%;
    height:200px;
    background:#FFF;
    margin:40px auto;
	}
	.effect1{
		-webkit-box-shadow: 0 10px 6px -6px #777;
		   -moz-box-shadow: 0 10px 6px -6px #777;
				box-shadow: 0 10px 6px -6px #777;
	} 

	</style>-->
</head>
<body>	
<c:if test="${sessionScope.User.userLevel=='2'}">
<%@ include file="homeTab.jsp"%>
</c:if>

        <div id="page-wrapper">
            <div id="page-inner">
                <!-- /. ROW  -->
                <div class="row">
				
				  <div class="col-md-4">
                        <div class="main-box mb-pink">
                            <a href="${pageContext.request.contextPath}/student/students.do">
                                <i class="fa fa-users fa-5x"></i>
                                <h5>Student</h5>
                            </a>
                        </div>
                    </div>
				
				
                   
					
                    <div class="col-md-4">
                        <div class="main-box mb-dull">
                            <a href="${pageContext.request.contextPath}/student/students.do">
                                <i class="fa fa-money fa-5x"></i>
                                <h5> Fees Details</h5>
                            </a>
                        </div>
                    </div>
					
					
					 <div class="col-md-4">
                        <div class="main-box mb-red">
                            <a href="${pageContext.request.contextPath}/student/students.do">
                                <i class="fa fa-file-text fa-5x"></i>
                                <h5>Report</h5>
                            </a>
                        </div>
                    </div>
                  

                </div>
                <!-- /. ROW  -->

            
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
</body>
