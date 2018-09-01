package com.kakaoix.mall.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kakaoix.mall.util.SHA256Util;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	public void insert(Member member) {
		try {
			member.setPassword(SHA256Util.hashing(member.getPassword()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		memberMapper.insert(member);
	}
	
	public Member isMember(Member member){
		return memberMapper.isMember(member);
	}
	
	public Member selectById(String id) {
		return memberMapper.selectById(id);
	}
	
	public Member selectByMemberNo(long memberNo) {
		return memberMapper.selectByMemberNo(memberNo);
	}

}
