package kr.ac.skuniv.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ac.skuniv.springmvc.dto.Favorites;
import kr.ac.skuniv.springmvc.mapper.Mapper;

@Mapper
public interface FavoritesMapper {
	public void insertFavorites(@Param("id") String id, @Param("name") String name, @Param("address") String address);
	public List<Favorites> getFavorites(@Param("id") String id);
	public void deleteFavorites(@Param("id") String id, @Param("name") String name);
}
