package com.bteam.project.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bteam.project.bean.User;

@Mapper
public interface LoginMapper {
	public List<HashMap<String, Object>> SelectUser(HashMap<String, Object> map);

	public User SelectUserByIdAndPassword(HashMap<String, Object> map);

	public User SelectUserById(String id);

	public int selectIdCount(HashMap<String, Object> map);
	
	/* --- id/pw 찾기--- */
	public String selectForId(Map<String, Object> parmaMap);
	public String selectForPw(Map<String, Object> paramMap);
}
