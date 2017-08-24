package com.ssm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ssm.bean.Pictures;
import com.ssm.bean.User;
@Repository
public class PicturesDaoImpl extends MybatisDao implements PicturesDao {
	

	@Override
	public List<Pictures> selectType(Pictures pic) {
		List<Pictures> list=sqlSessionTemplate.selectList("PicturesDao.selectType", pic);
		return list;
	}
	@Override
	public List<Pictures> selectType2(Pictures pic) {
		List<Pictures> list=sqlSessionTemplate.selectList("PicturesDao.selectType2", pic);
		return list;
	}
	@Override
	public List<String> selectTypeDetail(Pictures pic) {
		// TODO Auto-generated method stub
		
		List<String> list=sqlSessionTemplate.selectList("PicturesDao.selectTypeDetail", pic);
		return list;
	}
	@Override
	public int selectTypeCount(Pictures pic) {
		// TODO Auto-generated method stub
		if(null==sqlSessionTemplate.selectOne("PicturesDao.selectTypeCount", pic)){
		return 0;
		}
		
		int a=sqlSessionTemplate.selectOne("PicturesDao.selectTypeCount", pic);
		return a;
	}
	@Override
	public List<Pictures> selectTypeList(Map map) {
		List<Pictures> list=sqlSessionTemplate.selectList("PicturesDao.selectTypeList",map);
		return list;
	}
	@Override
	public void add(String string) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("PicturesDao.add",string);
	}
}
