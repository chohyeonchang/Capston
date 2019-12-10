package kr.ac.skuniv.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ac.skuniv.springmvc.dto.Food;
import kr.ac.skuniv.springmvc.mapper.Mapper;

@Mapper
public interface FoodMapper {
	public List<Food> getResult(@Param("location") String location, @Param("main_edf") String main_edf);
	public int getResultCount(@Param("location") String location, @Param("category") String category);
	public int getEtcCount(@Param("location") String location);
}
