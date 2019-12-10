package kr.ac.skuniv.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.springmvc.dao.FoodMapper;
import kr.ac.skuniv.springmvc.dto.Food;

@Service
public class FoodService {
	@Autowired
	FoodMapper fooddao;
	
	public List<Food> getResult(String location, String search){
		return fooddao.getResult(location, search);
	}
	public int getResultCount(String location, String category){
		return fooddao.getResultCount(location, category);
	}
	public int getEtcCount(String location){
		return fooddao.getEtcCount(location);
	}
	
}
