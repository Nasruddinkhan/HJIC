<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style>
#data {
	width: 100% !Important;
}

body {
	font-family: Arival ! important;
	font-size: 14px ! important;
	line-height: 1.42857143 ! important;
	color: #5a4444 ! important;
	background-color: #fff ! important;
}
/* .panel {
    border: 1px solid #8db16e !important;
    margin-top: -20px  !important;
    margin-left: -15px  !important;
    margin-right: -30px  !important;
    border-radius: 0px !important;
  
} */
input[type=search] {
	outline: none;
	padding: 4px;
	margin: 0px 5px 0px;
	border-radius: 3px;
	border: 1px solid #BBB;
}
/* table.dataTable thead .sorting, table.dataTable thead .sorting_asc, table.dataTable thead .sorting_desc, table.dataTable thead .sorting_asc_disabled, table.dataTable thead .sorting_desc_disabled {
    background: #800000 !important;
    color: white !important;
} */
table.dataTable {
	width: 100%;
	margin: 0 auto;
	clear: both;
	border-collapse: unset !important;
	border-spacing: 1;
}

table.dataTable.no-footer {
	border-bottom: 0px solid #111 !important;
	margin-left: 0px;
}

table.dataTable thead .sorting:after {
	color: white !important;
}

.dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter,
	.dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing,
	.dataTables_wrapper .dataTables_paginate {
	color: #333;
	margin: 10px 0px 0px 7px;
	text-transform: capitalize;
}
/* .table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
    border: 1px solid black  !important;
} */
table.dataTable tbody th, table.dataTable tbody td {
	padding: 2px 10px !important;
	font-weight: bold;
}

.ui-widget-header {
	border: 1px solid #d9534f !important;
	background: #d9534f  url(images/ui-bg_gloss-wave_35_f6a828_500x100.png)
		50% 50% repeat-x !important;;
	color: black !important;;
	font-weight: bold;
}
table.dataTable thead th, table.dataTable thead td {
    padding: 10px 18px;
    border-bottom: 1px solid #ddd !important; 
}

</style>
<link
	href="${pageContext.request.contextPath}/vendor/datatableJsCss/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/datatableJsCss/css/buttons.dataTables.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/dist/js/formValidation.js"></script>
</head>
<body>

	<div class="row" style="margin-bottom: 20px;">
		<div class="col-md-12">
			<fieldset class="scheduler-border">
				<legend class="scheduler-border">Search Student :</legend>
				<form:form  commandName="studentSearch" 
				action="${pageContext.request.contextPath}/student/studentsSearch.do"
				class="form-inline" role="form" id="searchform">
					<div class="form-group"> 
						<label for="email">From Date</label> <form:input type="text"
							class="form-control input-sm" id="fromDate" path="fromDate"/>
					</div>
					<span id= "fromspanDate"></span>
					<div class="form-group">
						<label for="email"> To Date </label> <form:input type="text"
							class="form-control input-sm" id="toDate" path="toDate"/>
					</div>
					<span id= "tospanDate"></span>

					<div class="form-group">
						<label for="email"> Class </label>
							<form:select path="studentClass" class="form-control input-sm">
               				 <form:option value="0">----SELECT----</form:option>
								<form:options items="${studentDivision}" />
						</form:select>
					</div>

					<button type="submit" class="btn btn-success btn-sm" id="find">
						Find</button> 
					<button type="reset" class="btn btn-danger btn-sm" id="clear">
						Clear</button>
					<a class="btn btn-primary btn-sm"
						href="${pageContext.request.contextPath}/student/showStudentPage.do">Add
						More Student</a>
				</form:form>
			</fieldset>
		</div>
		  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog"  style="width:90%;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="border-bottom: 0px">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">View Fees Details</h4>
        </div>
        <div class="modal-body" style="padding: 0px;">
          <table class="table table-bordered">
     
    <tbody>
      <tr>
        <th>GR No</th>
        <td  id="view_gr_no"></td>
        <th>Standard</th>
        <td  id="view_standard"></td>
      </tr>
  
      <tr>
        <th>First Name</th>
        <td  id="view_firstname"></td>
        <th>Last Name</th>
        <td  id="view_lastname"></td>
      </tr>
      <tr>
        <th>Email</th>
        <td  id="view_email"></td>
         <th>Aadhaar</th>
        <td  id="view_aadharno"></td>
       
      </tr>
      <tr>
        <th>Father Name</th>
        <td  id="view_fathername"></td>
        <th>Mother Name</th>
        <td  id="view_mothername"></td>
      </tr>
      <tr>
        <th>Mobile No</th>
        <td  id="view_tellphno"></td>
        <th>Tel No</th>
        <td  id="view_mobileno"></td>
      </tr>
      <tr>
        <th>Local Addr</th>
        <td id="view_local_addr">
           <!--  <textarea rows="3" cols="8" ></textarea> -->
       
        </td>
        <th>Permanent Addr</th>
        <td id="view_parmanent_addr">
        <!--  <textarea rows="3" cols="8" id="view_parmanent_addr"></textarea> -->
        </td>
      </tr>
    </tbody>
  </table>
        </div>
        <div class="modal-footer" style="border-top: 0px;">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			
				<div class="panel-body" style="padding: 0px;">
					<div class="table-responsive">
						<table id="myDatatable"
							class="display table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th style="color:#d9534f;">Student Name</th>
									<th style="color:#d9534f">Mobile No</th>
									<th style="color:#d9534f">Email</th>
									<th style="color:#d9534f">Aadhaar No</th>
									<th style="color:#d9534f">GR No</th>
									<th style="color:#d9534f">ClassID</th>
									<th style="color:#d9534f">Action</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
							<c:when test="${!empty studentList}">
								<c:forEach items="${studentList}" var="students">
									<tr>
										<td><c:out value="${students.firstname}" /></td>
										<td><c:out value="${students.mobileno}" /></td>
										<td><c:out value="${students.email}" /></td>
										<td><c:out value="${students.aadharno}" /></td>
										<td><c:out value="${students.grno}" /></td>
										<td><c:out value="${students.classid}" /></td>	
										<td><a class="btn btn-primary" style="font-size: 11px" onclick="viewStudentDetails('${students.grno}',
										'${students.classid}','${students.email}','${students.firstname}','${students.aadharno}',
										'${students.lastname}','${students.fathername}','${students.mothername}',
										'${students.local_addr }','${students.parmanent_addr }','${students.tellphno }','${students.mobileno}')"
											href="#" data-toggle="modal" data-target="#myModal">
												<span class="glyphicon glyphicon-tags"></span>
										</a>&nbsp;&nbsp; <a class="btn btn-warning"
											style="font-size: 11px"
											href="${pageContext.request.contextPath}/student/editStudentById/${students.studentId}.do">
												<span class="glyphicon glyphicon-edit"></span>
										</a>&nbsp;&nbsp; <a class="btn btn-danger" style="font-size: 11px"
											href="${pageContext.request.contextPath}/student/deleteStudent/${students.studentId}.do"
											onclick="return confirm('Are you sure \n You want to delete this record?')">
												<span class="glyphicon glyphicon-trash"></span>
										</a></td>
									</tr>
								</c:forEach>
								</c:when>
								<%-- <c:otherwise>
								<h3><font color='red'>No Data Found</font></h3>
								</c:otherwise> --%>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/jquery-1.12.4.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/buttons.flash.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/jszip.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/pdfmake.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/vfs_fonts.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/buttons.html5.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/vendor/datatableJsCss/js/buttons.print.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

	<script>
		$(document).ready(function() {
			var oTable = $('#myDatatable').DataTable({
			 "pageLength": 4
			});
			
			 $("#fromDate").datepicker({
		          changeYear: true,
		         changeMonth:true, 
		         dateFormat:'dd-mm-yy',
		         onSelect: function(selected) {
		        	 var toDate = $("#toDate").val();
		        	 console.log("toDate ["+toDate+"]");
		           $("#toDate").datepicker("option","minDate", selected)
		           $("#fromDate").css("border","1px solid #000"); 
			        $("#tospanDate").html('');
		           if(toDate === undefined || toDate == null || toDate.length <= 0 ){
		           $("#toDate").css("border","1px solid red"); 
		           $("#tospanDate").html("<font color='red'>To Entry Date should not be empty</font>"); 
		           }
		         }
		     });
		     $("#toDate").datepicker({
		         changeYear: true,
		         changeMonth:true, 
		         dateFormat:'dd-mm-yy',
		         onSelect: function(selected) {
		            $("#fromDate").datepicker("option","maxDate", selected)
		            $("#toDate").css("border","1px solid #000"); 
			        $("#tospanDate").html('');
			        var fromDate = $("#fromDate").val();
		        	 console.log("fromDate ["+fromDate+"]");
		        	 if(  fromDate === undefined || fromDate == null || fromDate.length <= 0 ){
				           $("#fromDate").css("border","1px solid red"); 
				           $("#tospanDate").html("<font color='red'>From Entry Date should not be empty</font>"); 
				      }
		         }
		});
		});
		function viewStudentDetails(grno, classId,email,firstname,aadharno,lastname,fathername, mothername, local_addr,parmanent_addr,tellphno,mobileno ){
			$('#view_gr_no').text(grno);
			$('#view_standard').text(classId);
			$('#view_email').text(email);
			$('#view_firstname').text(firstname);
			$('#view_aadharno').text(aadharno);
			$('#view_lastname').text(lastname);
			$('#view_fathername').text(fathername);
			$('#view_mothername').text(mothername);
			$('#view_local_addr').text(local_addr);
			$('#view_parmanent_addr').text(parmanent_addr);
			$('#view_mobileno').text(mobileno);
			$('#view_tellphno').text(tellphno);
		}
	</script>
</body>