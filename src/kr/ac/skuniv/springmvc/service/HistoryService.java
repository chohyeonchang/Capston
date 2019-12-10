package kr.ac.skuniv.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.springmvc.dao.HistoryMapper;
import kr.ac.skuniv.springmvc.dto.History;

@Service
public class HistoryService {
	@Autowired
	HistoryMapper historydao;
	
	public List<History> getHistory(String id){
		return historydao.getHistory(id);
	}
	
	public void insertResult(String id, String search, String location) {
		historydao.insertResult(id, search, location);
	}
	
	public int getChartData(String address) {
		return historydao.getChartData(address);
	}
	
	public List<String> getRanking(){
		return historydao.getRanking();
	}
	
	
	
}
