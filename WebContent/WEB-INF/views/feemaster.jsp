<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style>
#data {
	width: 100% !Important;
}
.panel {
    border: 1px solid #8db16e !important;
    margin-top: -20px  !important;
    margin-left: -15px  !important;
    margin-right: -30px  !important;
    border-radius: 0px !important;
  
}
input[type=search] {
    outline: none;
    padding: 4px;
    margin: 0px 5px 0px;
    border-radius: 3px;
    border: 1px solid #BBB;
}
table.dataTable thead .sorting, table.dataTable thead .sorting_asc, table.dataTable thead .sorting_desc, table.dataTable thead .sorting_asc_disabled, table.dataTable thead .sorting_desc_disabled {
    background: #800000 !important;
    color: white !important;
}
table.dataTable {
    width: 100%;
    margin: 0 auto;
    clear: both;
    border-collapse: unset !important;
    border-spacing: 1;
}
table.dataTable.no-footer {
    border-bottom: 0px solid #111  !important;
    margin-left: 0px;
}
table.dataTable thead .sorting:after {
    color: white !important;
}
.dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing, .dataTables_wrapper .dataTables_paginate {
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
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-success ">
					<div class="panel-heading">
						<h4 style="display:inline-block;"> Student of fee</h4>
						<span style="color: green;text-align: center;display:inline-block;margin-left:25%;">${message}</span>
						<a style="margin-top:10px" class="btn btn-primary btn-sm pull-right" 
						href="${pageContext.request.contextPath}/feemaster/showFeemaster.do">Add More Student</a>
					</div>
						<c:if test="${!empty studentList}">
					<div class="panel-body" style="padding: 0px;">
						<div class="table-responsive">
							<table id="myDatatable"	class="display table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th>Standard Type</th>
										<th>College Medium</th>
										<th>Month fee</th>
										<th>Exam fees</th>
										<th>Total Fee</th>
										<th>Late Fee</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${feemasters}" var="feemasters">
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										
											  <td></td>
											<td><a class="btn btn-primary" style="font-size: 11px"
												href="${pageContext.request.contextPath}/student/viewStudent/${students.studentId}.do"> <span class="glyphicon glyphicon-tags"></span></a>&nbsp;&nbsp;
												<a class="btn btn-warning" style="font-size: 11px"
												href="${pageContext.request.contextPath}/student/editStudentById/${students.studentId}.do"> <span class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;
												<a class="btn btn-danger" style="font-size: 11px"
												href="${pageContext.request.contextPath}/student/deleteStudent/${students.studentId}.do"
												onclick="return confirm('Are you sure \n You want to delete this record?')"> <span class="glyphicon glyphicon-trash"></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
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
				/* dom : 'Blfrtip',
				buttons : [ {
					extend : 'excel',
					footer : true,
					title : 'Student_List',
					filename : 'Student_List',
					exportOptions : {
						columns : [ 0, 1, 2, 3, 4, 5, 6, 7 ]
					}
				} ] */
			});
			$("#fromDate").datepicker({
				dateFormat : 'yy-mm-dd'
			});
			$("#toDate").datepicker({
				dateFormat : 'yy-mm-dd'
			});
		});
	</script>
</body> 