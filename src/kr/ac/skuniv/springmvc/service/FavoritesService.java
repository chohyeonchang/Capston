package kr.ac.skuniv.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.springmvc.dao.FavoritesMapper;
import kr.ac.skuniv.springmvc.dto.Favorites;

@Service
public class FavoritesService {
	@Autowired
	FavoritesMapper favoritesdao;
	
	public List<Favorites> getFavorites(String id){
		return favoritesdao.getFavorites(id);
	}
	
	public void insertFavorites(String id, String name, String address) {
		favoritesdao.insertFavorites(id, name, address);
	}
	public void deleteFavoreites(String id, String name){
		favoritesdao.deleteFavorites(id, name);
	}
	
	
	
}
