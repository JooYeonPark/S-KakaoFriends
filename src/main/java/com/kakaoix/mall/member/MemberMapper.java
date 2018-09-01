package com.kakaoix.mall.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface MemberMapper {
	
	public void insert(Member member);
	
	public Member isMember(Member member);
	
	public Member selectById(String id);

	public Member selectByMemberNo(long memberNo);
	
}
