package kr.ac.skuniv.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ac.skuniv.springmvc.dto.History;
import kr.ac.skuniv.springmvc.mapper.Mapper;

@Mapper
public interface HistoryMapper {
	public void insertResult(@Param("id") String id, @Param("search_food") String search_food, @Param("address") String address);
	public List<History> getHistory(@Param("id") String id);
	public void deleteHistory();
	public int getChartData(@Param("address") String address);
	public List<String> getRanking();
}
