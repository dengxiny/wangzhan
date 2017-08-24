package com.ssm.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.bean.User;
import com.ssm.bean.UserDetail;
import com.ssm.dao.LoginDao;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	@Autowired
	LoginDao loginDao;
	//登入
	@Override
	public boolean login(User user) {
		boolean flag;
		if(loginDao.login(user)==null||loginDao.login(user).getType().equals("0")){
			flag=false;
		}else{
			flag=true;
		}
		
		return flag;
	}
	@Override
	public void update(User user) {
		loginDao.update(user);
	}
	//注册
	@Override
	public void regist(User u) {
		// TODO Auto-generated method stub
		loginDao.regist(u);
	}
	//邮箱激活账号
	@Override
	public void regist1(User u) {
		// TODO Auto-generated method stub
		loginDao.regist1(u);
	}
	//返回user对象
	@Override
	public User selectIntroduce(User user) {
		return loginDao.selectIntroduce(user);
	}
	//判断该用户是否存在
	@Override
	public String forget(String username) {
		// TODO Auto-generated method stub
		return loginDao.forget(username);
	}
	//重置密码
	@Override
	public void remember(User u) {
		// TODO Auto-generated method stub
		loginDao.remember(u);
	}
	///邮箱激活账号验证
	@Override
	public boolean regist2(User u) {
		// TODO Auto-generated method stub
		return loginDao.regist2(u);
	}
	////邮箱找回密码验证
	@Override
	public boolean forget1(User u) {
		// TODO Auto-generated method stub
		return loginDao.forget1(u);
	}
	//查找详细信息
	@Override
	public UserDetail selectDetail(UserDetail userDetail) {
		// TODO Auto-generated method stub
		return loginDao.selectDetail(userDetail);
	}
	//查找ID
	@Override
	public int selectID(User u) {
		// TODO Auto-generated method stub
		return loginDao.selectID(u);
	}
	//插入个人信息
	@Override
	public void insertDetail(UserDetail userDetail) {
		// TODO Auto-generated method stub
	loginDao.insertDetail(userDetail);
	}
	//更新头像
	@Override
	public void updateTouXiang(UserDetail userDetail) {
		// TODO Auto-generated method stub
		loginDao.updateTouXiang(userDetail);
	}
	//更新个人信息
	@Override
	public void updateIntroduce(UserDetail userDetail) {
		// TODO Auto-generated method stub
		loginDao.updateIntroduce(userDetail);
	}

}
