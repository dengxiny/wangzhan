package com.ssm.bean;

public class UserDetail {
	private int ID;
	private String introduce;
	private String touxiang;
	private String sex;
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public String getIntroduce() {
	return introduce;
}
public void setIntroduce(String introduce) {
	this.introduce = introduce;
}
public String getTouxiang() {
	return touxiang;
}
public void setTouxiang(String touxiang) {
	this.touxiang = touxiang;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
@Override
public String toString() {
	return "UserDetail [ID=" + ID + ", introduce=" + introduce + ", touxiang="
			+ touxiang + ", sex=" + sex + "]";
}

}
