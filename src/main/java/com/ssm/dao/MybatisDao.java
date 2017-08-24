package com.ssm.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MybatisDao {
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate;

}
