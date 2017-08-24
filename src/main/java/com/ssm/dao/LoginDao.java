package com.ssm.dao;

import com.ssm.bean.User;
import com.ssm.bean.UserDetail;

public interface LoginDao {
//����
User login(User user);

void update(User user);
//ע��
void regist(User u);
//���伤���˺�
void regist1(User u);
//��������
 void remember(User u);

//�жϸ��û��Ƿ����
 String forget(String username);

//����user����
User selectIntroduce(User user);
//���伤���˺���֤
boolean regist2(User u);
//�����һ�������֤
boolean forget1(User u);
//������ϸ��Ϣ
UserDetail selectDetail(UserDetail userDetail);
//����ID
int selectID(User u);
//���������Ϣ
void  insertDetail(UserDetail userDetail);
//����ͷ��
void updateTouXiang(UserDetail userDetail);
//���¸�����Ϣ
void updateIntroduce(UserDetail userDetail);
}
