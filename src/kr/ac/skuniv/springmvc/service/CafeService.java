package kr.ac.skuniv.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.springmvc.dao.CafeMapper;
import kr.ac.skuniv.springmvc.dto.Cafe;

@Service
public class CafeService {
	@Autowired
	CafeMapper cafedao;
	
	public List<Cafe> getCafeResult(String location){
		return cafedao.getCafeResult(location);
	}
	
}
