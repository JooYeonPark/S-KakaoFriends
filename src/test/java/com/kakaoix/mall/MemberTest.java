package com.kakaoix.mall;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.kakaoix.mall.member.Member;
import com.kakaoix.mall.member.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class MemberTest {
	@Autowired
	MemberMapper memberMapper;
	
	@Test
	public void isMemberTest() {
		Member mem = memberMapper.isMember(new Member("jy","jy"));
		log.info("{}", mem);
	}
	
	@Test
	public void input() {
		Member mem = new Member();
		mem.setId("123");
		mem.setPassword("123");
		mem.setName("haha");
		mem.setPhone("010101010101");
		
		memberMapper.insert(mem);
	}
	
	@Test
	public void ckId() {
		Member mem = memberMapper.selectById("jy");
		log.info("{}", mem);
	}
}
