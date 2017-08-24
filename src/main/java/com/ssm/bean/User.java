package com.ssm.bean;

public class User {
	private int ID;
	private String username;
	private String password;
//String introduce;
	private String type;
	private String uuid;
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
//public String getIntroduce() {
//	return introduce;
//}
//public void setIntroduce(String introduce) {
//	this.introduce = introduce;
//}

public String getUsername() {
	return username;
}
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getUuid() {
	return uuid;
}
public void setUuid(String uuid) {
	this.uuid = uuid;
}
@Override
public String toString() {
	return "User [ID=" + ID + ", username=" + username + ", password="
			+ password + ", type=" + type + ", uuid=" + uuid + "]";
}




}
