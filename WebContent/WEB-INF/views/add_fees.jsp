<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Manage Fees</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>


<style>
body {
	font-family: Arival ! important;
	font-size: 14px ! important;
	line-height: 1.42857143 ! important;
	color: #5a4444 ! important;
	background-color: #fff ! important;
}
.panel-default>.panel-heading {
	color: #333;
	background-color: #f5f5f5;
	border-color: #ddd;
	height: 45px !important;
}

.checkbox label:after, .radio label:after {
	content: '';
	display: table;
	clear: both;
}

.checkbox .cr, .radio .cr {
	position: relative;
	display: inline-block;
	border: 1px solid #a9a9a9;
	border-radius: .25em;
	width: 1.3em;
	height: 1.3em;
	float: left;
	margin-right: .5em;
}

.radio .cr {
	border-radius: 50%;
}

.checkbox .cr .cr-icon, .radio .cr .cr-icon {
	position: absolute;
	font-size: .8em;
	line-height: 0;
	top: 50%;
	left: 20%;
}

.radio .cr .cr-icon {
	margin-left: 0.04em;
}

.checkbox label input[type="checkbox"], .radio label input[type="radio"]
	{
	display: none;
}

.checkbox label input[type="checkbox"]+.cr>.cr-icon, .radio label input[type="radio"]+.cr>.cr-icon
	{
	transform: scale(3) rotateZ(-20deg);
	opacity: 0;
	transition: all .3s ease-in;
}

.checkbox label input[type="checkbox"]:checked+.cr>.cr-icon, .radio label input[type="radio"]:checked+.cr>.cr-icon
	{
	transform: scale(1) rotateZ(0deg);
	opacity: 1;
}


label {
	font-weight: normal;
}
.input-group {
       margin-bottom: 8px  !important;
    width: 100% !important;
}
</style>
</head>

<body>
	<div class="container-fluid">
		<form:form class="form-horizontal" method="post" 	action="${pageContext.request.contextPath}/feesController/saveFeesDetails.do"
			commandName="feesbean">
			<input type="hidden" name="monthlyFeesCalcy" id="monthlyFeesCalcy" />
			<input type="hidden" name="travelFeesCal" id="travelFeesCal" />
			<input type="hidden" name="tfees" id="tfees" />
			<input type="hidden" name="efees" id="efees" />
			<form:input type="hidden" path="payMonth" id="payMonth"/>
			<fieldset>
				<div class="row">
					<div class="col-sm-4 panel panel-heading">Search Information  </div>
					<div class="col-sm-4 " id="errMsg"></div>
				</div>
				<div class="row form-group">
					<label class="col-sm-2 control-label" for="first_name">GR
						No</label>
					<div class="col-sm-4">
						<div class="input-group">
							<form:input id="rollNo" path="grno" placeholder="Enter Roll No"
								class="form-control input-sm"  /> 
						</div>
					</div>
					<label class="col-sm-2 control-label" for="Contact No">Contact
						No</label>
					<div class="col-sm-4">
						<div class="input-group">
							<input id="contact_no" name="contact_no"
								class="form-control input-sm"
							readonly="true"	type="text"> 
						</div>
					</div>
				</div>
				<div class="row form-group">
					<label class="col-sm-2 control-label" for="first_name">D.O.J</label>
					<div class="col-sm-4">
						<div class="input-group">
							<input id="dob" name="dob" placeholder=""
								class="form-control input-sm" type="text" readonly> 
						</div>
					</div>

					<label class="col-sm-2 control-label" for="last_name">Student
						Name</label>
					<div class="col-sm-4">
						<div class="input-group">
							<input id="student_name" name="student_name" placeholder=""
								class="form-control input-sm" type="text" readonly> 
							</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class=" panel panel-heading">Fess Information</div>
				</div>
				<div class="row form-group">
					<label class="col-sm-2 control-label" for="first_name">Class</label>
					<div class="col-sm-4">
						<div class="input-group">
							<form:input type="text" path="classid" id="classid"
								class="form-control input-sm"  readonly="true"/>
							
						</div>
					</div>

					<label class="col-sm-2 control-label" for="Monthly Fees">Previous Payment
						</label>
					<div class="col-sm-4">
						<div class="input-group">
						
							<input id="prepayamount" name="prepayamount"
								class="form-control input-sm" type="text" readonly> 
						</div>
					</div>
				</div>
				<div class="row form-group">
					<label class="col-sm-2 control-label" for="Monthly Fees">Monthly Fees</label>
					<div class="col-sm-4">
						<div class="input-group">
						<form:input type="text" path="monthfees" id="monthly_fees"
								class="form-control input-sm"  readonly="true"/>
						 
						</div>
					</div>
					<label class="col-sm-2 control-label" for="Total Amount">Total Amount</label>
					<div class="col-sm-4">
						<div class="input-group">
						<form:input type="text" path="totalfess" id="totalfess"
								class="form-control input-sm"  readonly="true"/>
						</div>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 control-label" for="first_name">Pay
						Monthly fees</label>
					<div class="checkbox" id="feesChkBox">
						<label> <input type="checkbox" id="checkbox1" value="January" name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							JAN
						</label> <label> <input type="checkbox" id="checkbox2"  value="February"  name="chkBox" onclick="checkCountfeesAmount()"> <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							FEB
						</label> <label> <input type="checkbox" id="checkbox3" value="March"  name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							MAR
						</label> <label> <input type="checkbox" id="checkbox4" value="April"  name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							APR
						</label> <label> <input type="checkbox" id="checkbox5" value="May"  name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							MAY
						</label> <label> <input type="checkbox" id="checkbox6" value="June"  name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							JUN
						</label> <label> <input type="checkbox" id="checkbox7" value="July"  name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							JUL
						</label> <label> <input type="checkbox" id="checkbox8" value="August"  name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							AUG
						</label> <label> <input type="checkbox" id="checkbox9" value="September"  name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							SEP
						</label> <label> <input type="checkbox" id="checkbox10" value="October"  name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							OCT
						</label> <label> <input type="checkbox" id="checkbox11" value="November"  name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							NOV
						</label> <label> <input type="checkbox" id="checkbox12" value="December"  name="chkBox" onclick="checkCountfeesAmount()"> <span
							class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							DEC
						</label>
					</div>
				</div>
				<br/>

				<div class="row">
					<label class="col-sm-2 control-label" for="first_name">Other
						fees</label>
					<div class="checkbox col-sm-2 " id="feesChkBox">
						<label style="margin-left: -15px;"> <input type="checkbox" id="chkExamFee" >
							<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
							Exam Fees
						</label>
					</div>
					<div class="col-sm-3" style="display: none;" id="examfeesDiv">
				
						<form:input type="text" id="examfees" path="examfees" style="margin-left: -100px;"
							class="form-control input-sm"  readonly="true"/>
					</div>
					<div class="checkbox col-sm-2 " id="feesChkBox">
						<label style="margin-left: -58px;"> <input type="checkbox" id="travelfeeschk"> <span class="cr"><i
								class="cr-icon glyphicon glyphicon-ok"></i></span> Travel Fees
						</label>
					</div>
					<div class="col-sm-3 " style="display: none;" id="travelfeesDiv">
						<form:input  type="text" id="travelfees" path="travelFees"
							style="margin-left: -100px; width: 134%;"
							class="form-control input-sm"  readonly="true"/>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-heading"></div>
				</div> 
				<div class="form-group row">
					<div class="col-sm-8 text-center">
						<button id="save" name="save" class="btn btn-large btn-success"
							type="submit">Save Fees Information</button>
						<button class="btn btn-large btn-danger" type="button">Cancel</button>
					</div>
				</div>
			</fieldset>
		</form:form>
	</div>

	<script type="text/javascript">
$(function(){
	$('#feesChkBox  input[type="checkbox"').attr('disabled', true);
	$('#classid').val('');
	$('#rollNo').val('');
	$('#monthly_fees').val('');
	$('#totalfess').val('');
	$('#rollNo').on("blur",function(){
		$('#feesChkBox  input[type="checkbox"').attr('checked', false);
		$('#feesChkBox  input[type="checkbox"').attr('disabled', true);
		$("#monthlyFeesCalcy").val('0')
		 $('#totalfess').val('0');
	  //  var contact_no =    $("#contact_no").val();
	    var grno     =	$("#rollNo").val();
	    console.log(grno);
		var rootURL = window.location.origin;	
		base_url = rootURL+"<%=request.getContextPath()%>";
				$.ajax({
					type : "post",
					url : base_url + "/feesController/getFeesDetails.do",
					cache : false,
					data : {
						'grno' : grno
					},
					success : function(response) {
						console.log(response);
						var feesDet = JSON.parse(response);
						console.log(feesDet.examfees);
						if(feesDet.errCode == 'S'){
						$("#dob").val(feesDet.doj);
						$("#student_name").val(feesDet.studentName);
						$("#classid").val(feesDet.classId);
						$("#monthly_fees, #monthlyFeesCalcy").val(feesDet.monthlyfees);
						$("#travelFeesCal").val(feesDet.travelfees);
						$("#prepayamount").val(feesDet.balancefees);
						$("#efees").val(feesDet.examfees);
						$('#feesChkBox  input[type="checkbox"]').attr('disabled', false);
						var payMonthStr = feesDet.payMonth.split(",");
						for(var i=0;i<payMonthStr.length; i++){
						console.log(payMonthStr[i]);
						$("#feesChkBox  input[type='checkbox'][value='"+payMonthStr[i]+"']").prop("checked",true);
						$("#feesChkBox  input[type='checkbox'][value='"+payMonthStr[i]+"']").attr('disabled', true);
					
						}
						var exmFeeFlag = feesDet.payExamFee;
						var travelFee = feesDet.payTravelFee;
						console.log("travelFee ["+travelFee+"]");
						if(travelFee == 'Y'){
							console.log("travelFee disable checkbox ["+travelFee+"]");
							$("#travelfeeschk").attr('disabled', true);
							$("#travelfeeschk").prop('checked', true);
						}
						if(chkExamFee == 'Y'){
							console.log("chkExamFee disable checkbox ["+chkExamFee+"]");
							$("#chkExamFee").attr('disabled', true);
							$("#chkExamFee").prop('checked', true);
						}
						
						}else{
							console.log("inside error");
							$("#efees").val('');
							$("#dob").val('');
							$("#student_name").val('');
							$("#classid").val('');
							$("#monthly_fees").val('');
							$("#className").val('');
							 $("#contact_no").val('');
							$("#rollNo").val('');
							$("#errMsg").show();
							$("#errMsg").html('<font color="red"><b>'+feesDet.errMsg+'</b></font>');
							$("#errMsg").hide(10000);	
						}
					},
					error : function(xhr, ajaxOptions, thrownError) {
						alert("ajax call error");
					}
				});
			});
	
        
		});
function checkCountfeesAmount(){
	 var amount =   parseInt($("#monthlyFeesCalcy").val());
	 var travelAmt = parseInt($("#travelFeesCal").val());
	 var travelSum = 0;
	 //travelfees
	 var i = 0;
	 var sum = 0;
	 var monthRec = new Array();
	 $('#feesChkBox  input[type="checkbox"]').each(function(){
		    var $this = $(this);
		    if($this.is(":checked")){
		      var chkID = $this.attr("id");
		    	  i++;
		      monthRec.push($('#'+chkID).val());
		    }
});
	 console.log(i);
	 for(var count = 1; count<=i;count++){
		 sum = sum + amount;
		 travelSum = travelSum + travelAmt;
	 }
	 console.log(sum);

	 $('#tfees').val(travelSum); 
	  $('#totalfess').val(sum);
	  $('#payMonth').val(monthRec);
	  console.log(monthRec);
	 sum = 0;
	 i =0;
}
$("#chkExamFee").change(function() {
		console.log("exam fees");
			var ischecked = $(this).is(':checked');
			if (ischecked) {
				$('#examfeesDiv').show();
				$('#examfees').val($("#efees").val());
			} else {
				$('#examfees').val('');
				$('#examfeesDiv').hide();
			}
		});
		$("#travelfeeschk").on("change", function() {
			console.log("travelfeeschk fees" + $('#tfees').val());
			var ischecked = $(this).is(':checked');
			if (ischecked) {
				travelfees
				$('#travelfees').val($('#tfees').val())
				$('#travelfeesDiv').show();
			} else {
				$('#travelfees').val(0);
				$('#travelfeesDiv').hide();
			}
		});
	</script>
</body>
</html>