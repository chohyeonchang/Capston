package kr.ac.skuniv.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.springmvc.dao.MemberMapper;
import kr.ac.skuniv.springmvc.dto.Member;

@Service
public class MemberService {
	@Autowired
	MemberMapper memberdao;
	
	
	public boolean loginCheck(String id, String password) {
		boolean loginCheck = false;
		Member member = memberdao.getMember(id);
		if (member != null && member.getId().equals(id) && member.getPassword().equals(password)) {
			loginCheck = true;
		}
		return loginCheck;
	}
	
	public Member getMember(String id) {
		return memberdao.getMember(id);
	}
	
	public List<Member> getId() {
		return memberdao.getId();
	}
	
	public void insertMember(String id, String name, String email, String password) {
		memberdao.insertMember(id, name, email, password);
	}
	
	public void updateMember(String name, String email, String password, String id) {
		memberdao.updateMember(name, email, password, id);
	}

}
