package com.bteam.project.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MainMapper {
	/* --- 회원가입 --- */
	public void joinSite(Map<String,Object> paramMap);
	/* --- id 중복확인 --- */
	public int checkSelectUser(String uid);
	/* --- 마이페이지 포인트 체크 --- */
	public int selectByPoint(Integer uidx);
}
