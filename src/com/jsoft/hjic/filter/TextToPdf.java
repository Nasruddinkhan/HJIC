package com.jsoft.hjic.filter;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

public class TextToPdf {

	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
 //  String paragarph = "<!DOCTYPE html> <html> <head> <title>Bootstrap Example</title> <meta charset=\"utf-8\"> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> <link rel=\"stylesheet\" href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'> <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script> <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script> <style> .text-danger strong {color: #9f181c; } .receipt-main {background: #ffffff none repeat scroll 0 0; border-bottom: 12px solid #333333; border-top: 12px solid #9f181c; margin-top: 50px; margin-bottom: 50px; padding: 40px 30px !important; position: relative; box-shadow: 0 1px 21px #acacac; color: #333333; font-family: open sans; } .receipt-main p {color: #333333; font-family: open sans; line-height: 1.42857; } .receipt-footer h1 {font-size: 15px; font-weight: 400 !important; margin: 0 !important; } .receipt-main::after {background: #414143 none repeat scroll 0 0; content: \"\"; height: 5px; left: 0; position: absolute; right: 0; top: -13px; } .receipt-main thead {background: #414143 none repeat scroll 0 0; } .receipt-main thead th {color:#fff; } .receipt-right h5 {font-size: 16px; font-weight: bold; margin: 0 0 7px 0; } .receipt-right p {font-size: 12px; margin: 0px; } .receipt-right p i {text-align: center; width: 18px; } .receipt-main td {padding: 9px 20px !important; } .receipt-main th {padding: 13px 20px !important; } .receipt-main td {font-size: 13px; font-weight: initial !important; } .receipt-main td p:last-child {margin: 0; padding: 0; } .receipt-main td h2 {font-size: 20px; font-weight: 900; margin: 0; text-transform: uppercase; } .receipt-header-mid .receipt-left h1 {font-weight: 100; margin: 34px 0 0; text-align: right; text-transform: uppercase; } .receipt-header-mid {margin: 24px 0; overflow: hidden; } #container {background-color: #dcdcdc; } </style> <body> <div class=\"container\"> <div class=\"row\"> <div class=\"receipt-main col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3\"> <div class=\"row\"> <div class=\"receipt-header\"> <div class=\"col-xs-6 col-sm-6 col-md-6\"> <div class=\"receipt-left\">  </div> </div> <div class=\"col-xs-6 col-sm-6 col-md-6 text-right\"> <div class=\"receipt-right\"> <h5>TechiTouch.</h5> <p>+91 12345-6789 <i class=\"fa fa-phone\"></i></p> <p>info@gmail.com <i class=\"fa fa-envelope-o\"></i></p> <p>Australia <i class=\"fa fa-location-arrow\"></i></p> </div> </div> </div> </div> <div class=\"row\"> <div class=\"receipt-header receipt-header-mid\"> <div class=\"col-xs-8 col-sm-8 col-md-8 text-left\"> <div class=\"receipt-right\"> <h5>Gurdeep Singh <small>  |   Lucky Number : 156</small></h5> <p><b>Mobile :</b> +91 12345-6789</p> <p><b>Email :</b> info@gmail.com</p> <p><b>Address :</b> Australia</p> </div> </div> <div class=\"col-xs-4 col-sm-4 col-md-4\"> <div class=\"receipt-left\"> <h1>Receipt</h1> </div> </div> </div> </div> <div> <table class=\"table table-bordered\"> <thead> <tr> <th>Description</th> <th>Amount</th> </tr> </thead> <tbody> <tr> <td class=\"col-md-9\">Payment for August 2016</td> <td class=\"col-md-3\"><i class=\"fa fa-inr\"></i> 15,000/-</td> </tr> <tr> <td class=\"col-md-9\">Payment for June 2016</td> <td class=\"col-md-3\"><i class=\"fa fa-inr\"></i> 6,00/-</td> </tr> <tr> <td class=\"col-md-9\">Payment for May 2016</td> <td class=\"col-md-3\"><i class=\"fa fa-inr\"></i> 35,00/-</td> </tr> <tr> <td class=\"text-right\"> <p> <strong>Total Amount: </strong> </p> <p> <strong>Late Fees: </strong> </p> <p> <strong>Payable Amount: </strong> </p> <p> <strong>Balance Due: </strong> </p> </td> <td> <p> <strong><i class=\"fa fa-inr\"></i> 65,500/-</strong> </p> <p> <strong><i class=\"fa fa-inr\"></i> 1300/-</strong> </p> <p> <strong><i class=\"fa fa-inr\"></i> 9500/-</strong> </p> </td> </tr> <tr> <td class=\"text-right\"><h2><strong>Total: </strong></h2></td> <td class=\"text-left text-danger\"><h2><strong><i class=\"fa fa-inr\"></i> 31.566/-</strong></h2></td> </tr> </tbody> </table> </div> <div class=\"row\"> <div class=\"receipt-header receipt-header-mid receipt-footer\"> <div class=\"col-xs-8 col-sm-8 col-md-8 text-left\"> <div class=\"receipt-right\"> <p><b>Date :</b> 15 Aug 2016</p> <h5 style=\"color: rgb(140, 140, 140);\">Thank you for your business!</h5> </div> </div> <div class=\"col-xs-4 col-sm-4 col-md-4\"> <div class=\"receipt-left\"> <h1>Signature</h1> </div> </div> </div> </div> </div> </div> </div> </body> </html>";
   try {/*
	   OutputStream file = new FileOutputStream(new File("D:\\HTMLtoPDF.pdf"));
	   Document document = new Document();
	   PdfWriter writer = PdfWriter.getInstance(document, file);
	   StringBuilder htmlString = new StringBuilder();
	   htmlString.append(paragarph);
	   document.open();
	   InputStream is = new ByteArrayInputStream(htmlString.toString().getBytes());
	   XMLWorkerHelper.getInstance().parseXHtml(writer, document, is);
	   document.close();
	   file.close();
	   System.out.println("complete");

   */
	   String[] restoreCmd = new String[]{"mysql ", "--user=" + "root", "--password=" + "", "-e", "source " + "hjic"};
	   
       Process runtimeProcess;
       try {

           runtimeProcess = Runtime.getRuntime().exec(restoreCmd);
           int processComplete = runtimeProcess.waitFor();

           if (processComplete == 0) {
               System.out.println("Restored successfully!");
           } else {
               System.out.println("Could not restore the backup!");
           }
       } catch (Exception ex) {
           ex.printStackTrace();
       }
   } catch (Exception e) {

       e.printStackTrace();
   }
   }
}