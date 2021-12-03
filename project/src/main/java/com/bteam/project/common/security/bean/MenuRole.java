package com.bteam.project.common.security.bean;

import java.util.HashMap;

import org.apache.commons.lang3.StringUtils;

public enum MenuRole {
	ROLE_USER(0, "ROLE_USER");

	private static final HashMap<Integer, MenuRole> map;
	private int roleType;
	private String roleName;

	static {
		map = new HashMap<Integer, MenuRole>();
		for (MenuRole f : values()) {
			map.put(Integer.valueOf(f.getRoleType()), f);
		}
	}

	private MenuRole(int roleType, String roleName) {
		this.roleType = roleType;
		this.roleName = roleName;
	}

	public int getRoleType() {
		return this.roleType;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public static MenuRole valueOf(int roleType) {
		return (MenuRole) map.get(Integer.valueOf(roleType));
	}

	public boolean equals(MenuRole role) {
		return StringUtils.equals(this.roleName, role.getRoleName());
	}
}
