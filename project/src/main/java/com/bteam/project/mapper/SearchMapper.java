package com.bteam.project.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface SearchMapper {
	/* --- 검색 기능 --- */
	public List<Map<String, Object>> selectByShop(HashMap<String, Object> paramMap);
	
	/* --- 지역별 정렬 --- */
	public List<Map<String, Object>> selectByLocation(HashMap<String, Object> paramMap);
	
	/* --- 조회수 높은순/낮은순 정렬 --- */
	public List<Map<String, Object>> selectTopView1(HashMap<String, Object> paramMap);
	public List<Map<String, Object>> selectTopView2(HashMap<String, Object> paramMap);
	
	public List<Map<String, Object>> selectBottomView1(HashMap<String, Object> paramMap);
	public List<Map<String, Object>> selectBottomView2(HashMap<String, Object> paramMap);
	
	/* --- 예약비 저렴한 순/비싼 순 정렬 --- */
	public List<Map<String, Object>> selectTopPrice1(HashMap<String, Object> paramMap);
	public List<Map<String, Object>> selectTopPrice2(HashMap<String, Object> paramMap);
	
	public List<Map<String, Object>> selectBottomPrice1(HashMap<String, Object> paramMap);
	public List<Map<String, Object>> selectBottomPrice2(HashMap<String, Object> paramMap);
	
	/*--- 이게 대체 뭐지? ---*/
	public Map<String, Object> selectByIdPw(Map<String,Object>parmaMap);
	public Map<String, Object> selectByIdPw(HashMap<String, Object> map);
}
