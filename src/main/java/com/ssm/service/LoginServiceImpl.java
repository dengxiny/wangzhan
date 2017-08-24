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
	//����
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
	//ע��
	@Override
	public void regist(User u) {
		// TODO Auto-generated method stub
		loginDao.regist(u);
	}
	//���伤���˺�
	@Override
	public void regist1(User u) {
		// TODO Auto-generated method stub
		loginDao.regist1(u);
	}
	//����user����
	@Override
	public User selectIntroduce(User user) {
		return loginDao.selectIntroduce(user);
	}
	//�жϸ��û��Ƿ����
	@Override
	public String forget(String username) {
		// TODO Auto-generated method stub
		return loginDao.forget(username);
	}
	//��������
	@Override
	public void remember(User u) {
		// TODO Auto-generated method stub
		loginDao.remember(u);
	}
	///���伤���˺���֤
	@Override
	public boolean regist2(User u) {
		// TODO Auto-generated method stub
		return loginDao.regist2(u);
	}
	////�����һ�������֤
	@Override
	public boolean forget1(User u) {
		// TODO Auto-generated method stub
		return loginDao.forget1(u);
	}
	//������ϸ��Ϣ
	@Override
	public UserDetail selectDetail(UserDetail userDetail) {
		// TODO Auto-generated method stub
		return loginDao.selectDetail(userDetail);
	}
	//����ID
	@Override
	public int selectID(User u) {
		// TODO Auto-generated method stub
		return loginDao.selectID(u);
	}
	//���������Ϣ
	@Override
	public void insertDetail(UserDetail userDetail) {
		// TODO Auto-generated method stub
	loginDao.insertDetail(userDetail);
	}
	//����ͷ��
	@Override
	public void updateTouXiang(UserDetail userDetail) {
		// TODO Auto-generated method stub
		loginDao.updateTouXiang(userDetail);
	}
	//���¸�����Ϣ
	@Override
	public void updateIntroduce(UserDetail userDetail) {
		// TODO Auto-generated method stub
		loginDao.updateIntroduce(userDetail);
	}

}
