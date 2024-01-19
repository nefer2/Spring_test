package com.myweb.www.service;

import org.springframework.stereotype.Service;

import com.ezen.www.security.MemberVO;
import com.myweb.www.repository.MemberDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor

public class MemberServiceImpl implements MemberService{
	
	private final MemberDAO mdao;

	@Override
	public int insert(MemberVO mvo) {
		int isOk = mdao.insert(mvo);
		return isOk;
	}
	
}
