package com.ssm.dao;

import org.springframework.stereotype.Repository;

import com.ssm.bean.User;
import com.ssm.bean.UserDetail;
@Repository
public class LoginDaoImpl extends MybatisDao implements LoginDao {
	

	//登入
	@Override
	public User login(User user) {
		User s=(User) sqlSessionTemplate.selectOne("LoginDao.login1", user);
		return s;
	}

	@Override
	public void update(User user) {
	
		sqlSessionTemplate.update("LoginDao.update",user);
		
	}
	//注册
	@Override
	public void regist(User u) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("LoginDao.insert",u);
	}
	//邮箱激活账号
	@Override
	public void regist1(User u) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("LoginDao.update1",u);
	}
	//返回user对象
	@Override
	public User selectIntroduce(User user) {
		User s=(User) sqlSessionTemplate.selectOne("LoginDao.selectIntroduce", user);
		return s;
	}
	//判断该用户是否存在
	@Override
	public String forget(String username) {
		// TODO Auto-generated method stub
		
		User s=(User) sqlSessionTemplate.selectOne("LoginDao.selectForgetName", username);
		if(s==null)
		{
			return "0,";	
		}
		
		return "1,"+s.getUuid();
	}
	//密码重置
	@Override
	public void remember(User u) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("LoginDao.updatePassword", u);
	}
	//邮箱激活验证
	@Override
	public boolean regist2(User u) {
		if(sqlSessionTemplate.selectOne("LoginDao.selectregist2",u )==null)
		{
			return false;	
		}
		
		return true;
		
	}
	//邮箱找回密码验证
	@Override
	public boolean forget1(User u) {
		if(sqlSessionTemplate.selectOne("LoginDao.selectregist2",u )==null)
		{
			return false;	
		}
		
		return true;
	}
	//查找详细信息
	@Override
	public UserDetail selectDetail(UserDetail userDetail) {
		userDetail=sqlSessionTemplate.selectOne("LoginDao.selectDetail",userDetail);
		/*if(userDetail.getSex()==null)
		{
			userDetail.setSex("不知道");
		}else if(userDetail.getTouxiang()==null){
			userDetail.setTouxiang("../test/a1.jpg");
		}*/
		return userDetail;
	}
	//查找ID
	@Override
	public int selectID(User u) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("LoginDao.selectID",u);
	}
	//插入个人信息
	@Override
	public void insertDetail(UserDetail userDetail) {
		// TODO Auto-generated method stub
		userDetail.setSex("不知道");
		userDetail.setTouxiang("../test/a1.jpg");
		sqlSessionTemplate.insert("LoginDao.insertDetail", userDetail);
	}
	//更新头像
	@Override
	public void updateTouXiang(UserDetail userDetail) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("LoginDao.updateTouXiang",userDetail);
	}
	//更新个人信息
	@Override
	public void updateIntroduce(UserDetail userDetail) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("LoginDao.updateIntroduce",userDetail);
	}

}
