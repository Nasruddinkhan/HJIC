package com.jsoft.hjic.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jsoft.hjic.model.MasterFeeBean;
import com.jsoft.hjic.service.FeesService;


@Controller
@RequestMapping(value = "/feemaster")
public class FeeMasterController {
	@Autowired
	FeesService feemasterService;
	Logger logger = Logger.getLogger(FeeMasterController.class);

	@RequestMapping(value = "/showFeemaster", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showFeesMasterForm(@ModelAttribute("masterFeeBean") MasterFeeBean masterFeeBean,
			BindingResult result) {
		ModelAndView mv = new ModelAndView("addMasterFee");
		List<MasterFeeBean> beans =  feemasterService.getFeesMasterDtl();
		System.out.println(masterFeeBean);
		mv.addObject("feesMaster", beans);
		
		return mv;
	}

	@RequestMapping(value = "/savefeemaster", method = RequestMethod.POST)
	public String saveFeeMater(HttpServletRequest req, Model model,
			@ModelAttribute("masterFee") MasterFeeBean
			masterFee, BindingResult result) {

		System.out.println("masterFee ["+masterFee);
		String message=feemasterService.saveFeesMasterDetails(masterFee);
		model.addAttribute("message", message);
		return "forward:/feemaster/showFeemaster.do";
	}
	@RequestMapping(value = "/deletefeemaster/{classId}/{medium}", method = RequestMethod.GET)
	public String DeleteFeeMater(@PathVariable("classId") String classId,@PathVariable("medium") String medium ) {
		System.out.println("classId ["+classId);
		System.out.println("medium ["+medium);
		feemasterService.deleteFeesMasterByClassId(classId, medium);
		return "forward:/feemaster/showFeemaster.do";
	}
}

