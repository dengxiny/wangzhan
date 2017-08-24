package com.ssm.service;

import com.ssm.bean.User;
import com.ssm.bean.UserDetail;

public interface LoginService {

	
//����	
public boolean login(User user);

public void update(User user);
//ע��
public void regist(User u);
//��������
public void remember(User u);
//���伤���˺�
public void regist1(User u);
//����user����
public User selectIntroduce(User user);
//�жϸ��û��Ƿ����
public String forget(String username);
//���伤���˺���֤
public boolean regist2(User u);
//�����һ�������֤
public boolean forget1(User u);
//������ϸ��Ϣ
public UserDetail selectDetail(UserDetail userDetail);
//����ID
public int selectID(User u);
//���������Ϣ
public void insertDetail(UserDetail userDetail);
//����ͷ��
public void updateTouXiang(UserDetail userDetail);
//���¸�����Ϣ
public void updateIntroduce(UserDetail userDetail);

}
