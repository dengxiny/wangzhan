package com.ssm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;


import com.ssm.bean.User;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse) res;
		 HttpSession session = request.getSession(); 
			String currPath = request.getServletPath();
			System.out.println(currPath);
			String[] paths  =new String[]{
					"/jsp/login.jsp","/jsp/regist.jsp"
			};
			for(String p:paths){
				if(p.equals(currPath)){
					chain.doFilter(request, response);
					return;
				}
			}
	      User user = (User) session.getAttribute("user1");  
	            if(user!=null){  
	                //��½�ɹ����û�  
	            	 chain.doFilter(req, res); 
	            }else{  
	               //û�е�½��ת���½����  
	            	response.sendRedirect("/s/jsp/login.jsp");//���δ��¼���򷵻ص�¼����
	            }  

		}
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	

}
