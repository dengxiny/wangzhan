package com.ssm.bean;

public class Pictures {
	private int picturesID;
	private String type;
	private String typedetail;
	private String imagepath;
	private int ID;
	private int count;

public String getTypedetail() {
	return typedetail;
}
public void setTypedetail(String typedetail) {
	this.typedetail = typedetail;
}
public int getPicturesID() {
	return picturesID;
}
public void setPicturesID(int picturesID) {
	this.picturesID = picturesID;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getImagepath() {
	return imagepath;
}
public void setImagepath(String imagepath) {
	this.imagepath = imagepath;
}
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
@Override
public String toString() {
	return "Pictures [picturesID=" + picturesID + ", type=" + type
			+ ", imagepath=" + imagepath + ", ID=" + ID + ", count=" + count
			+ "]";
}




}
