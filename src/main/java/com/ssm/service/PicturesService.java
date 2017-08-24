package com.ssm.service;

import java.util.List;

import com.ssm.bean.Pictures;

public interface PicturesService {

List<Pictures> selectType(Pictures pic);

List<Pictures> selectType2(Pictures pic);

List<String> selectTypeDetail(Pictures pic);

int selectTypeCount(Pictures pic);

List<Pictures> selectTypeList(Pictures pic, int pagecode, int pagerecord);

void add();
}
