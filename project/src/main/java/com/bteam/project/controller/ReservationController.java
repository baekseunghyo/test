package com.bteam.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bteam.project.service.MainService;
import com.bteam.project.service.SearchService;
import com.bteam.project.service.ShopService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	ShopService shopService;
	
	private static final Logger logger = LogManager.getLogger(UserController.class);
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public ModelAndView reservation(@RequestParam Integer sid) {
		ModelAndView mv = new ModelAndView("Reservation");
		
		/*--- 조회수 업데이트 ---*/
		shopService.updateViewCount(sid);
		
		/*---업체 정보 가져오기 ---*/	
		Map<String, Object> shop = shopService.shopDetail(sid);
		mv.addObject("shop", shop);

		/*---리뷰 가져오기 ---*/
		List<Map<String, Object>> review = shopService.selectReview(sid);
		mv.addObject("review",review);
		
		
		return mv;
	}
	
	/* --- 리뷰 등록 --- */
	@RequestMapping(value="/review", method = RequestMethod.POST)
	@ResponseBody
	public void insertReview(@RequestParam Integer uidx, @RequestParam Integer sidx, @RequestParam String comment) {
		Map<String, Object> paramMap = new HashMap();
		paramMap.put("uidx", uidx);
		paramMap.put("sidx", sidx);
		paramMap.put("comment", comment);
		
		shopService.insertReview(paramMap);
	}
	/* --- 예약 결제 --- */
	@RequestMapping(value="/deposit", method = RequestMethod.POST)
	@ResponseBody
	public String updateDeposit(@RequestParam Integer price, @RequestParam Integer uidx, @RequestParam Integer point) {
		
		String result = "";
		
		if(price > point) {
			result="false";
		} else {
			Map<String, Object> paramMap = new HashMap();
			paramMap.put("price", price);
			paramMap.put("uidx", uidx);
			
			shopService.updateDeposit(paramMap);
			result="success";
		}
			
		return result;
	}
	
	/* --- 예약 --- */
	@RequestMapping(value="/booking", method = RequestMethod.POST)
	@ResponseBody
	public void  insertReservation(@RequestParam Integer uidx, @RequestParam Integer sidx, @RequestParam String date, @RequestParam String time, @RequestParam Integer deposit) {
		Map<String, Object> paramMap = new HashMap();
		paramMap.put("uidx", uidx);
		paramMap.put("sidx", sidx);
		paramMap.put("date", date);
		paramMap.put("time", time);
		paramMap.put("deposit", deposit);
		
		shopService.insertReservation(paramMap);
	}	
	
	/* --- 예약 취소--- */
	@RequestMapping(value="/cancel", method = RequestMethod.POST)
	@ResponseBody
	public void deleteReservation(@RequestParam Integer uidx, @RequestParam Integer sidx, @RequestParam String date, @RequestParam String time) {
		Map<String, Object> paramMap = new HashMap();
		paramMap.put("uidx", uidx);
		paramMap.put("sidx", sidx);
		
		shopService.updatePoint(paramMap);
		
		paramMap.put("date", date);
		paramMap.put("time", time);
		
		shopService.deleteReservation(paramMap);
	}
	
	
	/*---예약 정보 가져오기 ---*/
	@RequestMapping(value="/check", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> reservationCheck(@RequestParam Integer sid, @RequestParam String date) {
		
		Map<String, Object> paramMap = new HashMap();
		paramMap.put("sidx", sid);
		paramMap.put("date",date);
		
		List<Map<String, Object>> reservation = shopService.selectReservationBysidx(paramMap);
		
	
		return reservation;
	}
	
	/*---예약 변경 시 정보 가져오기 ---*/
	@RequestMapping(value="/change", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> reservationChange(@RequestParam Integer sidx, @RequestParam String date, @RequestParam String time) {
		
		Map<String, Object> paramMap = new HashMap();
		paramMap.put("sidx", sidx);
		paramMap.put("date",date);
		paramMap.put("time", time);
		
		Map<String, Object> changeInfo = shopService.selectReservationForChange(paramMap);
		
	
		return changeInfo;
	}
	
	/*---예약 변경 ---*/
	@RequestMapping(value="/change/update", method = RequestMethod.POST)
	@ResponseBody
	public void reservationUpdate(@RequestParam Integer uidx, @RequestParam Integer sidx, @RequestParam String date, @RequestParam String time, @RequestParam String changeDate, @RequestParam String changeTime) {
		
		Map<String, Object> paramMap = new HashMap();
		paramMap.put("uidx", uidx);
		paramMap.put("sidx", sidx);
		paramMap.put("date", date);
		paramMap.put("time", time);
		
		paramMap.put("changeDate",changeDate);
		paramMap.put("changeTime",changeTime);
		
		shopService.updateReservation(paramMap);
		

	}
	
}

