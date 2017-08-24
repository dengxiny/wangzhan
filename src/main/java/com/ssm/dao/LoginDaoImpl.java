package com.ssm.dao;

import org.springframework.stereotype.Repository;

import com.ssm.bean.User;
import com.ssm.bean.UserDetail;
@Repository
public class LoginDaoImpl extends MybatisDao implements LoginDao {
	

	//����
	@Override
	public User login(User user) {
		User s=(User) sqlSessionTemplate.selectOne("LoginDao.login1", user);
		return s;
	}

	@Override
	public void update(User user) {
	
		sqlSessionTemplate.update("LoginDao.update",user);
		
	}
	//ע��
	@Override
	public void regist(User u) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("LoginDao.insert",u);
	}
	//���伤���˺�
	@Override
	public void regist1(User u) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("LoginDao.update1",u);
	}
	//����user����
	@Override
	public User selectIntroduce(User user) {
		User s=(User) sqlSessionTemplate.selectOne("LoginDao.selectIntroduce", user);
		return s;
	}
	//�жϸ��û��Ƿ����
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
	//��������
	@Override
	public void remember(User u) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("LoginDao.updatePassword", u);
	}
	//���伤����֤
	@Override
	public boolean regist2(User u) {
		if(sqlSessionTemplate.selectOne("LoginDao.selectregist2",u )==null)
		{
			return false;	
		}
		
		return true;
		
	}
	//�����һ�������֤
	@Override
	public boolean forget1(User u) {
		if(sqlSessionTemplate.selectOne("LoginDao.selectregist2",u )==null)
		{
			return false;	
		}
		
		return true;
	}
	//������ϸ��Ϣ
	@Override
	public UserDetail selectDetail(UserDetail userDetail) {
		userDetail=sqlSessionTemplate.selectOne("LoginDao.selectDetail",userDetail);
		/*if(userDetail.getSex()==null)
		{
			userDetail.setSex("��֪��");
		}else if(userDetail.getTouxiang()==null){
			userDetail.setTouxiang("../test/a1.jpg");
		}*/
		return userDetail;
	}
	//����ID
	@Override
	public int selectID(User u) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("LoginDao.selectID",u);
	}
	//���������Ϣ
	@Override
	public void insertDetail(UserDetail userDetail) {
		// TODO Auto-generated method stub
		userDetail.setSex("��֪��");
		userDetail.setTouxiang("../test/a1.jpg");
		sqlSessionTemplate.insert("LoginDao.insertDetail", userDetail);
	}
	//����ͷ��
	@Override
	public void updateTouXiang(UserDetail userDetail) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("LoginDao.updateTouXiang",userDetail);
	}
	//���¸�����Ϣ
	@Override
	public void updateIntroduce(UserDetail userDetail) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("LoginDao.updateIntroduce",userDetail);
	}

}
