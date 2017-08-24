package com.ssm.aop;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;

import com.mysql.jdbc.Util;

import com.ssm.util.DateUtil;

public class LogAspect {
	

	public void before(JoinPoint joinpoint) {

		String clsname = joinpoint.getTarget().getClass().getName();

		String methodname = joinpoint.getSignature().getName();

		System.out.println();
		System.out.println("-----------------before---------------");
		System.out.println(DateUtil.getdatestrByDate(new Date(), "yyyy-MM-dd")
				+ ":" + clsname + "." + methodname);

	}

	public void after(JoinPoint joinpoint) {
		System.out.println("------------------after---------------");
//		System.out.println("鍙傛暟锛�");
		String methodname = joinpoint.getSignature().getName();
	
		System.out.println();

	}


	
	public void afterReturn(JoinPoint joinpoint, Object result) {

//		System.out.println("鎵ц缁撴灉锛�" + result);
		System.out.println("------------------end-----------------");
		System.out.println();

	}


	
	
	

}
