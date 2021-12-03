package com.bteam.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bteam.project.mapper.ShopMapper;

@Service
public class ShopService {
	@Autowired
	ShopMapper shopMapper;
	
	/* --- 조회수 저장 --- */
	public void updateViewCount(Integer sid) {
		shopMapper.updateViewCount(sid);
	}
	
	/* --- 리뷰 꺼내오기 --- */
	public List<Map<String, Object>> selectReview(Integer sid){
		return shopMapper.selectReview(sid);
	}
	
	/* --- 상세예약페이지 검색 --- */
	public Map<String, Object> shopDetail(Integer sid) {
		return shopMapper.shopDetail(sid);
	}
	
	/* --- 리뷰 등록 --- */
	public void insertReview(Map<String, Object> paramMap) {
		shopMapper.insertReview(paramMap);
	}
	
	/* --- 예약 --- */
	public void insertReservation(Map<String, Object>paramMap) {
		shopMapper.insertReservation(paramMap);
	}
	
	/* --- 예약 결제하기 --- */
	public void updateDeposit(Map<String,Object>paramMap) {
		shopMapper.updateDeposit(paramMap);
	}
	
	/* --- 마이페이지 예약 정보 꺼내오기 --- */
	public List<Map<String, Object>> selectReservationByuidx(Integer uidx){
		return shopMapper.selectReservationByuidx(uidx);
	}
	
	/* --- 상세페이지 예약 정보 꺼내오기 --- */
	public List<Map<String, Object>> selectReservationBysidx(Map<String, Object>paramMap){
		return shopMapper.selectReservationBysidx(paramMap);
	}
	
	/* --- 마이페이지 예약 취소하기 --- */
	public void deleteReservation(Map<String, Object>paramMap) {
		shopMapper.deleteReservation(paramMap);
	}
	
	/* --- 마이페이지 포인트 조회 --- */
	public void updatePoint(Map<String,Object>paramMap) {
		shopMapper.updatePoint(paramMap);
	}
	/* --- 예약내역 변경 조회 --- */
	public Map<String, Object> selectReservationForChange(Map<String,Object>paramMap){
		return shopMapper.selectReservationForChange(paramMap);
	}
	
	/* --- 예약내역 변경 -- */
	public void updateReservation(Map<String, Object>paramMap) {
		shopMapper.updateReservation(paramMap);
	}
}
