
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Reciept</title>
<style>
.text-danger strong {
	color: #9f181c;
}

.receipt-main {
	border-bottom: 12px solid #333333;
	border-top: 12px solid #9f181c;
	margin-top: 40px;
	padding: 40px 30px !important;
	position: relative;
	box-shadow: 0 1px 21px #acacac;
	color: #333333;
	font-family: open sans;
	border-right: 1px solid #333333;
	border-left: 1px solid #333333;
}

.receipt-main p {
	color: #333333;
	font-family: open sans;
	line-height: 1.42857;
}

.receipt-footer h1 {
	font-size: 15px;
	font-weight: 400 !important;
	margin: 0 !important;
}

.receipt-main::after {
	background: #414143 none repeat scroll 0 0;
	content: '';
	height: 5px;
	left: 0;
	position: absolute;
	right: 0;
	top: -13px;
}

.receipt-main thead {
	background: #414143 none repeat scroll 0 0;
}

.receipt-main thead th {
	color: #fff;
}

.receipt-right h5 {
	font-size: 16px;
	font-weight: bold;
	margin: 0 0 7px 0;
}

.receipt-right p {
	font-size: 12px;
	margin: 0px;
}

.receipt-right p i {
	text-align: center;
	width: 18px;
}

.receipt-main td {
	padding: 9px 20px !important;
}

.receipt-main th {
	padding: 13px 20px !important;
}

.receipt-main td {
	font-size: 13px;
	font-weight: initial !important;
}

.receipt-main td p:last-child {
	margin: 0;
	padding: 0;
}

.receipt-main td h2 {
	font-size: 20px;
	font-weight: 900;
	margin: 0;
	text-transform: capitalize;
	text-align: left;
}

.receipt-header-mid .receipt-left h1 {
	font-weight: 100;
	margin: 34px 0 0;
	text-align: right;
	text-transform: capitalize;
}

.receipt-header-mid {
	margin: 24px 0;
	overflow: hidden;
}

#container {
	background-color: #dcdcdc;
}
/* #background{
    position:absolute;
    z-index:0;
    background:white;
    display:block;
    min-height:50%; 
    min-width:100%;
    color:yellow;
}

#content{
    position:absolute;
    z-index:1;
}

#bg-text
{
    color:lightgrey;
    font-size:120px;
    transform:rotate(300deg);
    -webkit-transform:rotate(300deg);
} */
</style>
</head>
<body>
	<!-- <div id="background" >
  <p id="bg-text">JSOFT Tech</p>
	</div> -->
	<div class='container' id="rcpt" style="margin-top: -50px;">
		<div class='row'>
			<div class='receipt-main col-xs-12 col-sm-12 col-md-12'>
				<div class='row'>
					<div class='receipt-header' style="margin-top: -30px;">
						<div class='col-xs-6 col-sm-6 col-md-6'>
							<div class='receipt-left'>
								<img class='img-responsive' alt='iamgurdeeposahan'
									src="${pageContext.request.contextPath}/img/jainullah.jpg"
									style='width: 200px; border-radius: 2px;'>
							</div>
						</div>
						<div class='col-xs-6 col-sm-6 col-md-6 text-right'>
							<div class='receipt-right'>
								<h5 style="text-transform: capitalize;">Jainullah inter
									college.</h5>
								<p>
									+91 12345-6789 <i class='fa fa-phone'></i>
								</p>
								<p>
									info@gmail.com <i class='fa fa-envelope-o'></i>
								</p>
								<p>
									Sant kabir Nagar <i class='fa fa-location-arrow'></i>
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class='row'>
					<div class='receipt-header receipt-header-mid'>
						<div class='col-xs-8 col-sm-8 col-md-8 text-left'>
							<div class='receipt-right'>
								<h5>
									${payMonth.studentname} <small>  |   SR Number :
										${payMonth.grno}</small>
								</h5>
								<p>
									<b>Mobile :</b> +91 ${payMonth.contactNo}
								</p>
								<p>
									<b>Date Of Joining :</b>${payMonth.dob}
								</p>
							</div>
						</div>
						<div class='col-xs-4 col-sm-4 col-md-4'>
							<div class='receipt-left' style="text-align: right">
								<h3>Payment Invoice</h3>
							</div>
						</div>
					</div>
				</div>

				<div>
					<table class='table table-bordered'>
						<thead>
							<tr>
								<th>Payment Description</th>
								<th>Amount</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="feesMonth" value="${fn:split(payMonth.payMonth,',')}" />
							<c:forTokens items="${payMonth.payMonth}" delims=","
								var="feesMonth">
								<tr>
									<td class='col-md-8'>${feesMonth}</td>
									<td class='col-md-4'><i class='fa fa-inr'></i>${payMonth.monthlyfees} /-</td>
								</tr>
							</c:forTokens>
							<c:set var="examFees" value="${payMonth.examFees}" />
							<c:if test="${not  empty examFees}">
								<tr>
									<td class='col-md-8'>Examination Fees</td>
									<td class='col-md-4'><i class='fa fa-inr'></i>${examFees}/-</td>
								</tr>
							</c:if>
							<c:set var="travelFees" value="${payMonth.travelFees}" />
							<c:if test="${not  empty travelFees}">
								<tr>
									<td class='col-md-8'>Travel Fees</td>
									<td class='col-md-4'><i class='fa fa-inr'></i>${travelFees}/-</td>
								</tr>
							</c:if>
							<tr>
								<td class='text-right'>
									<p>
										<strong>Total Amount: </strong>
									</p> <!-- <p>
										<strong>Late Fees: </strong>
									</p>
									<p>
										<strong>Payable Amount: </strong>
									</p>
									<p>
										<strong>Balance Due: </strong>
									</p> -->
								</td>
								<td>
									<p>
										<strong><i class='fa fa-inr'></i>${payMonth.totalAmt}/-</strong>
									</p> <!-- 	<p>
										<strong><i class='fa fa-inr'></i> 1300/-</strong>
									</p>
									<p>
										<strong><i class='fa fa-inr'></i> 9500/-</strong>
									</p> -->
								</td>
							</tr>
							<tr>

								<td class='text-right'>
									<h2>
										<strong
											style="text-transform: uppercase; text-align: left!imporetant;">Total:</strong>
										${payMonth.amtInword} only /-
									</h2>
								</td>
								<td class='text-left text-danger'>
									<h2>
										<strong><i class='fa fa-inr'></i>${payMonth.totalAmt}
											/-</strong>
									</h2>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class='row'>
					<div class='receipt-header receipt-header-mid receipt-footer'>
						<div class='col-xs-8 col-sm-8 col-md-8 text-left'>
							<div class='receipt-right'>
								<p>
									<b>Date :</b> ${payMonth.paymentDate}
								</p>
								<h5 style='color: rgb(140, 140, 140);'>Thank you for
									payment</h5>
							</div>
						</div>
						<div class='col-xs-4 col-sm-4 col-md-4'>
							<div class='receipt-left'>
								<h1>Signature</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="col-md-1 reciept_btn" style="margin-top: 50px;">
				<a href="#" class="btn btn-info btn-lg" onclick="myFunction();">
					<span class="glyphicon glyphicon-print"></span> Print
				</a>

			</div>
			<div class="col-md-1 reciept_btn" style="margin-top: 50px;">

				<a href="#" class="btn btn-danger btn-lg"> <span
					class="glyphicon glyphicon-download-alt"></span> Download
				</a>
			</div> -->
		</div>
		<div id="editor"></div>
		<div class="row">
			<div class="col-md-1 reciept_btn" style="margin-top: 50px;">
				<button class="btn btn-info btn-lg" onclick="myFunction();">
					<span class="glyphicon glyphicon-print"></span> Print
				</button>
			</div>
			<!-- 	<div class="col-md-1 reciept_btn" style="margin-top: 50px;">

				<a href="#" class="btn btn-danger btn-lg" id="download"> <span
					class="glyphicon glyphicon-download-alt"></span> Download
				</a>
			</div> -->
		</div>
	</div>

</body>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script> -->
<script>
	function myFunction() {
		$('.reciept_btn').hide();
		window.print();
		$('.reciept_btn').show();

	}

	/* var doc = new jsPDF();
	var specialElementHandlers = {
		'#editor' : function(element, renderer) {
			return true;
		}
	};
	$(document).ready(function() {
		$('#download').click(function() {
			doc.fromHTML($('#rcpt').html(), 15, 15, {
				'width' : 170,
				'elementHandlers' : specialElementHandlers
			});
			doc.save('invoice.pdf');
		});
	}); */
</script>
</html>
