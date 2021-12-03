package com.bteam.project.service;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bteam.project.mapper.MainMapper;
import com.bteam.project.mapper.ShopMapper;

@Service
public class MainService {
	@Autowired
	MainMapper mainMapper;
	
	@Autowired
	ShopMapper shopMapper;
	
	/* --- 회원가입 --- */
	public void joinSite(Map<String, Object> paramMap) {
		mainMapper.joinSite(paramMap);
	}
	
	/* --- id 중복확인 --- */
	public int checkSelectUser(String uid) {

		int count = mainMapper.checkSelectUser(uid);
	
		return count;
	}
	
	/* --- 마이페이지 포인트 확인 --- */
	public int selectByPoint(Integer uidx) {
		return mainMapper.selectByPoint(uidx);
	}
}
