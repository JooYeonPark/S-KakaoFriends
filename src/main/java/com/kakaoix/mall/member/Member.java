package com.kakaoix.mall.member;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor()
public class Member {
	
	private long memberNo;
	private String id;
	private String password;
	private String name;
	private String email;
	private String address;
	private String postcode;
	private String phone;
	
	public Member(String id, String password) {
		this.id = id;
		this.password = password;
	}
	
}
