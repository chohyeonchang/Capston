package kr.ac.skuniv.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ac.skuniv.springmvc.dto.Member;
import kr.ac.skuniv.springmvc.mapper.Mapper;

@Mapper
public interface MemberMapper {
	public boolean checkLogin(String id, String password);
	public Member getMember(@Param("id") String id);
	public List<Member> getId();
	public void insertMember(@Param("id") String id, @Param("name") String name, 
			@Param("email") String email, @Param("password") String password);
	public void updateMember(@Param("name") String name, 
			@Param("email") String email, @Param("password") String password, @Param("id") String id);
}
