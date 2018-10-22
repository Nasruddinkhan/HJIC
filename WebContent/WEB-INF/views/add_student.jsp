
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<style>
.input-group {
	width: 100% !important;
}

body {
	font-family: Arival ! important;
	font-size: 14px ! important;
	line-height: 1.42857143 ! important;
	color: #5a4444 ! important;
	background-color: #fff ! important;
}

</style>
</head>
<body>
	<div class="container-fluid" style="margin-top: 20px;">
		<c:choose>
			<c:when test="${student.studentId > 0}"> Update Students</c:when>
			<c:otherwise>Add Students</c:otherwise>
		</c:choose>
		<form:form acceptCharset="UTF-8" method="POST"
			onsubmit="return save();"
			action="${pageContext.request.contextPath}/student/saveStudent.do"
			class="form-horizontal" commandName="student">
			<!-- Text input-->
			<form:input path="studentId" name="studentId" type="hidden"  /> 
			<div class="form-group">
				<label class="col-sm-2 control-label">GR No :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
								<c:choose>
							<c:when test="${student.studentId > 0}">
								<form:input path="grno" class="form-control input-sm" type="text"
									readonly="true" />
							</c:when>
							<c:otherwise>
								<form:input path="grno" class="form-control input-sm" id="grno"
									type="text" />
								<span id="chkGrno"></span>
							</c:otherwise>
						</c:choose>
						</div>
				</div>

				<label class="col-sm-2 control-label">Standerd :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:select path="classid" class="form-control input-sm">
              				   <form:option value="0">----SELECT----</form:option>
								<form:options items="${studentDivision}" />
						</form:select>
							
					</div>
				</div>
			</div>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-sm-2 control-label">D.O.J :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:input path="joiningdate" class="form-control input-sm"  id ="doj" type="text" />
					</div>
				</div>

				<label class="col-sm-2 control-label">D.O.B:</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:input path="dob" id= "dob" class="form-control input-sm" type="text" />
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-sm-2 control-label">First Name :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:input path="firstname" class="form-control input-sm" type="text" />
					</div>
				</div>

				<label class="col-sm-2 control-label">Last Name :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:input path="lastname" class="form-control input-sm" type="text" />
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-sm-2 control-label">Father's Name :</label>
				<div class="col-sm-4 ">
					<div class="input-group">
						<form:input path="fathername" class="form-control input-sm" type="text" />
					</div>
				</div>

				<label class="col-sm-2 control-label">Mother's Name :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:input path="mothername" class="form-control input-sm" type="text" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Mobile No :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:input path="mobileno" class="form-control input-sm" type="text" />
					</div>
				</div>

				<label class="col-sm-2 control-label">Aadhar No :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:input path="aadharno" class="form-control input-sm" type="text" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Email :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:input path="email" class="form-control input-sm" type="text" />
					</div>
				</div>
				<label class="col-sm-2 control-label">Tell No :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:input path="tellphno" class="form-control input-sm" type="text" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">Local Address :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:textarea path="local_addr" class="form-control input-sm" type="text" />
					</div>
				</div>

				<label class="col-sm-2 control-label">Parmanent Address :</label>
				<div class="col-sm-4 inputGroupContainer">
					<div class="input-group">
						<form:textarea path="parmanent_addr" class="form-control input-sm"
							type="text" />
					</div>
				</div>
			</div>
			<!-- Button -->
			<div class="form-group">
				<label class="col-sm-4 control-label"></label>
				<div class="col-sm-2">
					<br>
					<c:choose>
			<c:when test="${student.studentId > 0}"><button type="submit" class="btn btn-primary">
						Update<span class="glyphicon glyphicon-send"></span>
					</button></c:when>
			<c:otherwise><button type="submit" class="btn btn-success">
						Submit<span class="glyphicon glyphicon-send"></span>
					</button></c:otherwise>
		</c:choose>
					<!-- <button type="submit" class="btn btn-warning">
						Submit<span class="glyphicon glyphicon-send"></span>
					</button> -->
					<br>
				</div>
			</div>
		</form:form>
	</div>
	<!-- /.container -->
	<script type="text/javascript">
	  $(document).ready(function(){
		 $('#grno').on("blur",function(){
			 console.log("blur is called");
			var grno = $('#grno').val();
			if(grno != null && grno.length>3){
			var rootURL = window.location.origin;	
			base_url = rootURL+"<%=request.getContextPath()%>";
			 $.ajax({
					type : "post",
					url : base_url + "/student/checkGrNO.do",
					cache : false,
					data : {
						'grno' : grno,
					},
					success : function(response) {
						if(response){
							console.log("failed =>>>>>>["+response+"]");
							$('#chkGrno').html("<font color='red'>Student allready register</font>");
							$('#grno').css("border","1px solid red"); 
							//$('#chkGrno').hide(5000);
							$('#grno').val(""); 

						}else{
						console.log("success =>>>>>>["+response+"]");
						$('#chkGrno').html("<font color='green'>success</font>");
						$('#grno').css("border","1px solid green"); 
						
						//$('#chkGrno').hide(5000);
						}
					},
					error : function() {
						console.log("errror =>>>>>>");
					}
			 });
			}
		 });
		
		 $("#dob").datepicker({
	         changeYear: true,
	         changeMonth:true, 
	         dateFormat:'dd-mm-yy'
	}); 
	  });
	 
	</script>

</body>
</html>