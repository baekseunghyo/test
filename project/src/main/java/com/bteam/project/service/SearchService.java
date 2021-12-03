package com.bteam.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bteam.project.mapper.SearchMapper;

@Service
public class SearchService {
	
	@Autowired
	SearchMapper searchMapper;
	
	public List<Map<String, Object>> selectByShop(HashMap<String, Object> paramMap) {
		return searchMapper.selectByShop(paramMap);
	}
	
	public List<Map<String, Object>> selectByLocation(HashMap<String, Object> paramMap) {
		return searchMapper.selectByLocation(paramMap);
	}
	

	//조회 많은 순 정렬 1 stype, searchText 2.stype
	public List<Map<String,Object>>selectTopView1(HashMap<String, Object> paramMap){
		return searchMapper.selectTopView1(paramMap);
	}
	public List<Map<String,Object>>selectTopView2(HashMap<String, Object> paramMap){
		return searchMapper.selectTopView2(paramMap);
	}
	//조회 적은 순 정렬 1 stype, searchText 2.stype
	public List<Map<String,Object>>selectBottomView1(HashMap<String, Object> paramMap){
		return searchMapper.selectBottomView1(paramMap);
	}
	public List<Map<String,Object>>selectBottomView2(HashMap<String, Object> paramMap){
		return searchMapper.selectBottomView2(paramMap);
	}
	//가격 높은 순 정렬 1 stype, searchText 2.stype
	public List<Map<String,Object>>selectTopPrice1(HashMap<String, Object> paramMap){
		return searchMapper.selectTopPrice1(paramMap);
	}
	public List<Map<String,Object>>selectTopPrice2(HashMap<String, Object> paramMap){
		return searchMapper.selectTopPrice2(paramMap);
	}
	//가격 낮은 순 정렬 1 stype, searchText 2.stype
	public List<Map<String,Object>>selectBottomPrice1(HashMap<String, Object> paramMap){
		return searchMapper.selectBottomPrice1(paramMap);
	}
	public List<Map<String,Object>>selectBottomPrice2(HashMap<String, Object> paramMap){
		return searchMapper.selectBottomPrice2(paramMap);
	}

}
