package com.bteam.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bteam.project.bean.User;
import com.bteam.project.mapper.LoginMapper;

@Service
public class LoginService {

    @Autowired
    LoginMapper loginMapper;
    
    

    public List<HashMap<String, Object>> SelectUser(HashMap<String, Object> map) {
        return loginMapper.SelectUser(map);
    }

    public User SelectUserByIdAndPassword(String id, String password) {
        HashMap<String, Object> paramMap = new HashMap<>();

        paramMap.put("uid", id);
        paramMap.put("upw", password);
        return loginMapper.SelectUserByIdAndPassword(paramMap);
    }

    /* --- 아이디 중복 확인  --- */
    public int selectIdCount(HashMap<String, Object> map) {
        return loginMapper.selectIdCount(map);
    }
    
	/* --- id/pw 찾기--- */
	public String selectForId(Map<String, Object>paramMap) {
		
		return loginMapper.selectForId(paramMap);
	}


	public String selectForPw(Map<String, Object>paramMap) {
		
		return loginMapper.selectForPw(paramMap);
	}
}
