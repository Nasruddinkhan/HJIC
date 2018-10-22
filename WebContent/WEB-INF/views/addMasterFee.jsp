

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#data {
	width: 100% !Important;
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
input[type=search] {
    outline: none;
    padding: 4px;
    margin: 0px 5px 0px;
    border-radius: 3px;
    border: 1px solid #BBB;
}



</style>
</head>
<body>
	<div class="container-fluid" style="margin-top: 20px;">
		<form:form acceptCharset="UTF-8" method="POST"
			
			action="${pageContext.request.contextPath}/feemaster/savefeemaster.do"
			class="form-horizontal" commandName="masterFeeBean">
			<div class="row form-group">
				<label class="col-sm-2 control-label" for="ClassID">Standard
				</label>
				<div class="col-sm-4">
					<div class="input-group">
						<form:input path="feesGroup.class_id" id="class_id"
							placeholder="Enter Roll No" class="form-control input-sm" />
					</div>
				</div>
				<label class="col-sm-2 control-label" for="Contact No">School Medium
					</label>
				<div class="col-sm-4">
					<div class="input-group">
					
				<form:select path="feesGroup.type" id="type" class="form-control input-sm">
				<form:option value="" label="--Select--"></form:option>
				<form:option value="E" label="English"></form:option>
				<form:option value="H" label="Hindi"></form:option>	
				
						
				</form:select>
 
					</div>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-2 control-label" for="MontlyFees">Monthly Fees
				</label>
				<div class="col-sm-4">
					<div class="input-group">
						<form:input id="montly_fees" path="montly_fees"
							placeholder="Enter monthly fees" class="form-control input-sm" type="text"/>
					</div>
				</div>
				<label class="col-sm-2 control-label" for="Exam Fees">Exam fees
					No</label>
				<div class="col-sm-4">
					<div class="input-group">
						<form:input path="exam_fees" placeholder="Enter Exam fees" id="exam_fees"
							class="form-control input-sm" type="text" />
					</div>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-2 control-label" for="total_fees">Financial Year
				</label>
				<div class="col-sm-4">
					<div class="input-group">
						<form:input id="financial_year" path="financial_year" placeholder="Financial Year" 
							 class="form-control input-sm" type="text" />
					</div>
				</div>
				<label class="col-sm-2 control-label" for="lateFees">Late Fees</label>
				<div class="col-sm-4">
					<div class="input-group">
						<form:input id="late_fees" path="late_fees" placeholder="late Fees"
							class="form-control input-sm" type="text" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label"></label>
				<div class="col-sm-2">
					<br>
					 <button type="submit" class="btn btn-primary" id="saveBtn">
						Submit
					</button> 
					<br>
				
				</div>
			</div>
		</form:form>
	  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="border-bottom: 0px">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">View Fees Details</h4>
        </div>
        <div class="modal-body" style="padding: 0px;">
          <table class="table table-bordered">
      <!--     <thead>
          <tr>
          <th></th>
           <th></th>
          </tr>
          </thead> -->
    <tbody>
      <tr>
        <th width="50%" >Class Name</th>
        <td width="50%" id="view_class_id"></td>
      </tr>
      <tr>
        <th >School Medium</th>
        <td id="view_medium"></td>
      </tr>
      <tr>
        <th>Monthly Fees</th>
        <td id="view_mnthly_fees"></td>
      </tr>
      <tr>
        <th>Exam Fees</th>
        <td id="view_exam_fees"></td>
      </tr>
       <tr>
        <th>Late Fees</th>
        <td id="view_late_fees"></td>
      </tr>
       <tr>
        <th>  Financial Year</th>
        <td id="view_financial_year"></td>
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
	<c:if test="${!empty feesMaster}">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 style="display: inline-block;">Fee Record</h5>
					<span style="color: green; text-align: center; display: inline-block; margin-left: 25%;">${message}</span>

				</div>
				
				<div class="panel-body">
					<div class="table-responsive">
						<table id="myDatatable"
							class="display table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>Class Id</th>
									<th>Medium</th>
									<th>Monthly Fees</th>
									<th>Annual Fees</th>
									<th>Exam fees </th>
									<th>Year</th>
									<th>Late Fees</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
                              
								<c:forEach items="${feesMaster}" var="feesdet">
								
									<tr >
										<td><c:out value="${feesdet.feesGroup.class_id}" /></td>
										<td><c:out value="${feesdet.feesGroup.type=='E'?'English':'Hindi'}" /></td>
										<td><c:out value="${feesdet.montly_fees}" /></td>
										<td><c:out value="${feesdet.montly_fees * 12}" /></td>
										<td><c:out value="${feesdet.exam_fees}" /></td>
										<td><c:out value="${feesdet.financial_year}" /></td>
										<td><c:out value="${feesdet.late_fees}" /></td>
										<td><a class="btn btn-default" style="font-size: 11px" data-toggle="modal" data-target="#myModal"
												href="#"  
												onclick="viewFeesMasterDetails('${feesdet.feesGroup.class_id}',
												'${feesdet.feesGroup.type=='E'?'English':'Hindi'}','${feesdet.montly_fees}',
												'${feesdet.exam_fees}','${feesdet.financial_year}','${feesdet.late_fees}');"
												
												> <span class="glyphicon glyphicon-tags"></span></a>&nbsp;&nbsp;
												<a class="btn btn-warning" style="font-size: 11px"
												href="#" onclick="editFeesMasterDetails('${feesdet.feesGroup.class_id}',
												'${feesdet.feesGroup.type}','${feesdet.montly_fees}',
												'${feesdet.exam_fees}','${feesdet.financial_year}','${feesdet.late_fees}');"> 
												<span class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;
												<a class="btn btn-danger" style="font-size: 11px"
												href="${pageContext.request.contextPath}/feemaster/deletefeemaster/${feesdet.feesGroup.class_id}/${feesdet.feesGroup.type}.do"
												onclick="return confirm('Are you sure \n You want to delete this record?')"> <span class="glyphicon glyphicon-trash"></span></a></td>
								
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:if>
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
			$('#class_id').val('');
			$('#exam_fees').val('');
			$('#financial_year').val('');
			$('#late_fees').val('');
			$('#type').val('');
			$('#montly_fees').val('');
		});
		function editFeesMasterDetails(classID, mediumType, montlyfees, examfees,financialyear, late_fees){
			
			$("#class_id, #type").attr('readonly', true);
			$('#class_id').val(classID);
			$('#exam_fees').val(examfees);
			$('#financial_year').val(financialyear);
			$('#late_fees').val(late_fees);
			$('#type').val(mediumType);
			$('#montly_fees').val(montlyfees);
			$('#saveBtn').text('Update');
			
		}
		function viewFeesMasterDetails(classID, mediumType, montlyfees, examfees,financialyear, late_fees){
			console.log("viewFeesMasterDetails");
			$('#view_class_id').text(classID);
			$('#view_exam_fees').text(examfees);
			$('#view_financial_year').text(financialyear);
			$('#view_late_fees').text(late_fees);
			$('#view_medium').text(mediumType);
			$('#view_mnthly_fees').text(montlyfees);
			
		}
	</script>
</body>
</html>