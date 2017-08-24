package com.ssm.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.bean.Pictures;
import com.ssm.dao.LoginDao;
import com.ssm.dao.PicturesDao;


@Service("PicturesService")
public class PicturesServiceImpl implements PicturesService{
	@Autowired
	PicturesDao picturesDao;
	@Override
	public List<Pictures> selectType(Pictures pic) {
		// TODO Auto-generated method stub
		return picturesDao.selectType(pic);
	}
	@Override
	public List<Pictures> selectType2(Pictures pic) {
		// TODO Auto-generated method stub
		return picturesDao.selectType2(pic);
	}
	@Override
	public List<String> selectTypeDetail(Pictures pic) {
		// TODO Auto-generated method stub
		return picturesDao.selectTypeDetail(pic);
	}
	@Override
	public int selectTypeCount(Pictures pic) {
		// TODO Auto-generated method stub
		return picturesDao.selectTypeCount(pic);
	}
	@Override
	public List<Pictures> selectTypeList(Pictures pic, int pagecode,
			int pagerecord) {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		map.put("type", pic.getType());
		map.put("startnum", (pagecode-1)*pagerecord);
		map.put("pagerecord", pagerecord);
		return picturesDao.selectTypeList(map);
	}
	@Override
	public void add() {
		// TODO Auto-generated method stub
		File file = new File("C:/Users/Administrator/Desktop/apache-tomcat-7.0.73/webapps/s/c");  
	     
        String [] fileName = file.list(); 
		for (String string : fileName) {
			//picturesDao.add("b/"+string);
			picturesDao.add("pictures/"+string);
		}
	
	}

}
