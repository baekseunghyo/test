package com.bteam.project.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ShopMapper {
	
	/* --- 조회수 저장 --- */
	public void updateViewCount(Integer sid);
	
	/* --- 상세페이지 업체 정보 조회 --- */
	public Map<String, Object> shopDetail(Integer sid);
	
	/* --- 상세페이지 리뷰 조회 --- */
	public List<Map<String, Object>> selectReview(Integer sid);
	
	/* --- 상세페이지 리뷰 저장 --- */
	public void insertReview(Map<String, Object> paramMap);
	
	/* --- 상세페이지 예약 --- */
	public void insertReservation(Map<String, Object>paramMap);
	
	/* --- 마이페이지 예약 내역 조회 --- */
	public List<Map<String, Object>> selectReservationByuidx(Integer uidx);
	
	/* --- 상세페이지 예약 내역 조회 --- */
	public List<Map<String, Object>> selectReservationBysidx(Map<String, Object>paramMap);
	
	/* --- 예약 취소 --- */
	public void deleteReservation(Map<String, Object>paramMap);
	
	/* --- 예약 결제 --- */
	public void updateDeposit(Map<String, Object>paramMap);
	
	/* --- 예약 환불 --- */
	public void updatePoint(Map<String, Object>paramMap);
	
	/* --- 예약 변경 조회 --- */
	public Map<String, Object> selectReservationForChange(Map<String, Object>paramMap);
	
	/* --- 예약 변경 --- */
	public void updateReservation(Map<String, Object>paramMap);

}
