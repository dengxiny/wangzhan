package com.ssm.dao;

import com.ssm.bean.User;
import com.ssm.bean.UserDetail;

public interface LoginDao {
//登入
User login(User user);

void update(User user);
//注册
void regist(User u);
//邮箱激活账号
void regist1(User u);
//密码重置
 void remember(User u);

//判断该用户是否存在
 String forget(String username);

//返回user对象
User selectIntroduce(User user);
//邮箱激活账号验证
boolean regist2(User u);
//邮箱找回密码验证
boolean forget1(User u);
//查找详细信息
UserDetail selectDetail(UserDetail userDetail);
//查找ID
int selectID(User u);
//插入个人信息
void  insertDetail(UserDetail userDetail);
//更新头像
void updateTouXiang(UserDetail userDetail);
//更新个人信息
void updateIntroduce(UserDetail userDetail);
}
