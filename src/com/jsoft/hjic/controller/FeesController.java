package com.jsoft.hjic.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jsoft.hjic.common.EnglishNumberToWords;
import com.jsoft.hjic.model.FeeDetail;
import com.jsoft.hjic.model.FeesBean;
import com.jsoft.hjic.service.CommonService;
import com.jsoft.hjic.service.FeesService;
@Controller
@RequestMapping(value = "/feesController")
public class FeesController {
	@Autowired
	private FeesService feesService;
	@Autowired
	private CommonService commonService;
	@RequestMapping(value = "/feesListPageCtr", method = { RequestMethod.GET, RequestMethod.POST })
	public String showFeesList(Model model) {
		System.out.println("FeesController.showFeesList()");
		return "fees_list";
	}
	@RequestMapping(value = "/feesPageCtr", method = RequestMethod.GET)
	public ModelAndView showFeesForm(@ModelAttribute("feesbean") FeesBean fees,
			BindingResult result) {
		ModelAndView mv = new ModelAndView("add_fees");
		return mv;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/feesReciept", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView printRecipet(@ModelAttribute("feesbean") FeesBean fees,
			BindingResult result) {
		@SuppressWarnings("rawtypes")
		Map map = new HashMap();
		FeeDetail feeDetail = getStudentDetails(fees.getGrno());
		System.out.println("feesDetails["+feeDetail+"]");
		map.put("dob", feeDetail.getDoj());
		map.put("contactNo", feeDetail.getContactNo());
		map.put("studentname", feeDetail.getStudentName());
		map.put("payMonth", fees.getPayMonth());
		map.put("monthlyfees", fees.getMonthfees());
		Integer totalAmt = checkNumber(fees.getTotalfess()) +  checkNumber(fees.getExamfees()) + checkNumber(fees.getTravelFees());
		System.out.println("totalAmt ["+totalAmt+"]");
		map.put("totalAmt",totalAmt);
		map.put("amtInword", EnglishNumberToWords.convert(totalAmt));
		map.put("examFees",fees.getExamfees());
		map.put("travelFees", fees.getTravelFees());
		map.put("grno", fees.getGrno());
		map.put("paymentDate", getCurrentDate());
		ModelAndView mv = new ModelAndView("reciept");
		mv.addObject("payMonth",map);
		return mv;
	}
	
	
	private Integer checkNumber(Integer totalfess) {
		// TODO Auto-generated method stub
		return totalfess == null?0:totalfess;
	}

	@RequestMapping(value = "/getFeesDetails", method = RequestMethod.POST, headers = "Accept=*/*")
	public @ResponseBody String getFeesDetails(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String grno = request.getParameter("grno");
		System.out.println("grno ["+grno+"]");
		FeeDetail feesDet = feesService.getFeesDetails(grno);
		String feesDest =  getFee(feesDet);
		return feesDest;

	}

	@RequestMapping(value = "/saveFeesDetails", method = RequestMethod.POST)
	public String saveUser(HttpServletRequest req, Model model,
			@ModelAttribute("feesbean") FeesBean feesbean, BindingResult result) {
		System.out.println("feesbean =========>>>>::: ["+feesbean+"]");

		if(null == feesbean.getExamfees() || feesbean.getExamfees() == 0)
			feesbean.setExamfeesPayFlag("N");
		else
			feesbean.setExamfeesPayFlag("Y");
		if(null == feesbean.getTravelFees() || feesbean.getTravelFees() == 0)
			feesbean.setTravelFessPayFlag("N");
		else
			feesbean.setTravelFessPayFlag("Y");

		feesService.saveFeesDetails(feesbean);
		return 	 "forward:/feesController/feesReciept.do";
	}
	private String getFee(FeeDetail feesDet) throws Exception {
		// TODO Auto-generated method stub
		return new ObjectMapper().writeValueAsString(feesDet).toString();
	}
	private  FeeDetail getStudentDetails(String grno){
		return feesService.getStudentDetails(grno);

	}
	private String getCurrentDate(){
		return commonService.getCurrentDateANDTime();
	}
}
