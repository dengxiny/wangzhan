package com.ssm.service;

import com.ssm.bean.User;
import com.ssm.bean.UserDetail;

public interface LoginService {

	
//登入	
public boolean login(User user);

public void update(User user);
//注册
public void regist(User u);
//密码重置
public void remember(User u);
//邮箱激活账号
public void regist1(User u);
//返回user对象
public User selectIntroduce(User user);
//判断该用户是否存在
public String forget(String username);
//邮箱激活账号验证
public boolean regist2(User u);
//邮箱找回密码验证
public boolean forget1(User u);
//查找详细信息
public UserDetail selectDetail(UserDetail userDetail);
//查找ID
public int selectID(User u);
//插入个人信息
public void insertDetail(UserDetail userDetail);
//更新头像
public void updateTouXiang(UserDetail userDetail);
//更新个人信息
public void updateIntroduce(UserDetail userDetail);

}
