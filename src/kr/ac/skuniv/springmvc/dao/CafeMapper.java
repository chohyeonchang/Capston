package kr.ac.skuniv.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ac.skuniv.springmvc.dto.Cafe;
import kr.ac.skuniv.springmvc.mapper.Mapper;

@Mapper
public interface CafeMapper {
	public List<Cafe> getCafeResult(@Param("location") String location);

}
