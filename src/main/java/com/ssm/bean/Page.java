package com.ssm.bean;

import java.util.List;

public class Page<E> {
	private int pagecode;
	private int totalpage;
	private int totalrecord;
	private int pagerecord;
	private List<E> list;
	public int getPagecode() {
		return pagecode;
	}
	public void setPagecode(int pagecode) {
		this.pagecode = pagecode;
	}
	public int getTotalpage() {
		totalpage=totalrecord/pagerecord;
		return totalrecord%pagerecord==0?totalpage:totalpage+1;
	}
//	public void setTotalpage(int totalpage) {
//		this.totalpage = totalpage;
//	}
	public int getTotalrecord() {
		return totalrecord;
	}
	public void setTotalrecord(int totalrecord) {
		this.totalrecord = totalrecord;
	}
	public int getPagerecord() {
		return pagerecord;
	}
	public void setPagerecord(int pagerecord) {
		this.pagerecord = pagerecord;
	}
	public List<E> getList() {
		return list;
	}
	public void setList(List<E> list) {
		this.list = list;
	}
	
	
}
