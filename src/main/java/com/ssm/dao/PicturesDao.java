package com.ssm.dao;

import java.util.List;
import java.util.Map;

import com.ssm.bean.Pictures;
import com.ssm.bean.User;

public interface PicturesDao {


List<Pictures> selectType(Pictures pic);

List<Pictures> selectType2(Pictures pic);

List<String> selectTypeDetail(Pictures pic);

int selectTypeCount(Pictures pic);

List<Pictures> selectTypeList(Map map);

void add(String string);
}
