package com.ssm.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import Decoder.BASE64Decoder;

import com.ssm.bean.User;
import com.ssm.bean.UserDetail;
import com.ssm.service.LoginService;
import com.ssm.test.JavaEmailSender;
import com.ssm.test.SendEmail;

@Controller
public class LoginControl {
	@Resource(name="LoginService")
	LoginService loginService;
	//登入
	@RequestMapping("/jsp/login")
	public String login(HttpServletRequest request,User user){
		 String kaptchaExpected = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		 String kaptchaReceived = request.getParameter("kaptcha"); //获取填写的验证码内容
		System.out.println(user);
		//验证码验证
		//&&kaptchaReceived.equalsIgnoreCase(kaptchaExpected)
		if(loginService.login(user)){
			user=loginService.selectIntroduce(user);
			System.out.println(getIpAddr(request));
			UserDetail userDetail=new UserDetail();
			userDetail.setID(user.getID());
			userDetail=loginService.selectDetail(userDetail);
			HttpSession session=request.getSession();
			session.removeAttribute("user");
			System.out.println(userDetail.getSex());
			session.setAttribute("user1", user);
			session.setAttribute("user1Detail", userDetail);
			return "jsp/Home";
		}else{
			return "jsp/login";
		}
	}
	//"redirect:/index.jsp"

	
	//注册
	@ResponseBody
	@RequestMapping("/jsp/regist")
	public String regist(HttpServletRequest request,String username,String password,User u) throws Exception{
		try {
			u.setUsername(username);
			u.setPassword(password);
			UUID uuid = UUID.randomUUID();
			u.setUuid(uuid.toString().replaceAll("-", ""));
			loginService.regist(u);
			SendEmail sendEmail=new SendEmail();
			sendEmail.send(u.getUsername()+","+uuid.toString().replaceAll("-", ""), "恭喜你注册成功");
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
		
	}
	//查找个人信息
	@RequestMapping(value="/jsp/introduce",method={RequestMethod.GET})
	public String introduce(HttpServletRequest request) throws Exception{
		HttpSession session=request.getSession();
		session.removeAttribute("user1Detail");
		User user=(User) session.getAttribute("user1");
		UserDetail userDetail=new UserDetail();
		userDetail.setID(user.getID());
		userDetail=loginService.selectDetail(userDetail);
		
		session.setAttribute("user1Detail", userDetail);
		//return "redirect:/jsp/introduce.jsp";
		
		return "jsp/introduce";
		
	}
	//发送重置邮件
	@ResponseBody
		@RequestMapping("/jsp/forget")
		public String regist(HttpServletRequest request,String username) throws Exception{
		  String flag=null;
		  flag=loginService.forget(username);
			if(flag.split(",")[0].equals("1")){
				SendEmail sendEmail=new SendEmail();
				String uuid =flag.split(",")[1];
				sendEmail.sendPassword(username+","+uuid, "重置密码");
				return "success";
			}else{
				return  "error";
			}
			
		}
	  //邮箱密码重置
		@RequestMapping(value="/jsp/forget1",method={RequestMethod.GET})
		public String forget1(HttpServletRequest request){
			System.out.println("---------------");
			String mail=request.getParameterValues("mail")[0];
			String uuid=request.getParameterValues("code")[0];
			System.out.println("---------------");
			User u=new User();
			u.setUsername(mail);
			u.setUuid(uuid);
			if(loginService.forget1(u)){
			request.setAttribute("username", mail);
		
			return "jsp/remember";}
			return "redirect:/jsp/forget.jsp"; 
		}
		//密码重置
		@RequestMapping(value="/jsp/remember")
		public String remember(HttpServletRequest request,User u){
			String password1=request.getParameterValues("password1")[0];
			if(u.getPassword().equals(password1)){
				loginService.remember(u);
				return "redirect:/jsp/login.jsp";
			}else{
				request.setAttribute("remembererror", "重置失败");
				request.setAttribute("username", u.getUsername());
				return  "jsp/remember";
			}
		}
	
	//邮箱激活账号
	@RequestMapping(value="/regist1",method={RequestMethod.GET})
	public String regist1(HttpServletRequest request){
		System.out.println("-----------------------");
		String mail=request.getParameterValues("mail")[0];
		String uuid=request.getParameterValues("code")[0];
		System.out.println(uuid);
		User u=new User();
		u.setUsername(mail);
		u.setUuid(uuid);
		if(loginService.regist2(u)){
		u.setType("1");
		UserDetail userDetail=new UserDetail();
		int id=loginService.selectID(u);
		userDetail.setID(id);
		loginService.regist1(u);
		loginService.insertDetail(userDetail);
		return "redirect:/jsp/login.jsp";
		}
		return "redirect:/jsp/regist.jsp";
	}
	
	//用户登出
	@RequestMapping(value="/jsp/logout",method={RequestMethod.GET})
	public String logout(HttpServletRequest request){
		String username=request.getParameter("username");
		
		HttpSession session=request.getSession();
		session.removeAttribute("user1");
		return "redirect:/jsp/login.jsp";
	}	
	
	
	//测试验证码
	@RequestMapping("/kaptcha.do")
    public void kaptcha(HttpServletRequest request, HttpServletResponse response) {
    String kaptchaExpected =(String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
    String kaptchaReceived =request.getParameter("kaptcha"); //获取填写的验证码内容
    if (kaptchaReceived == null || !kaptchaReceived.equalsIgnoreCase(kaptchaExpected)) {  //判断内容是否相同
        try {
        response.getWriter().print("validation code is wrong.");
        } catch (IOException e) {
        e.printStackTrace();
        }
    } else {
        try {
        response.getWriter().print("validation code is right.");
        } catch (IOException e) {
        e.printStackTrace();
        }
    }
    }
	//测试ajax
		@ResponseBody
		@RequestMapping(value="/yanzheng.do",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	    public void yanzheng(HttpServletRequest request, HttpServletResponse response,String name,String password) throws IOException {
			System.out.println("ajax1");
			System.out.println(password);
			User usr=new User();
			JSONObject jsonObject = new JSONObject();
			  ServletOutputStream out = response.getOutputStream();
			if(name.equals("a")&&password.equals("a")){
				usr.setUsername(name);
				usr.setPassword(password);
				JSONArray Js = JSONArray.fromObject(usr);
				String s=Js.toString();
				System.out.println(s);
		        System.out.println(s.replace("[", "").replace("]", ""));
		        System.out.println(s);
		        jsonObject.put("msg", "success");
		        jsonObject.put("data", s.replace("[", "").replace("]", ""));
		        System.out.println(jsonObject);
				 out.print(jsonObject.toString());
	    }else{
	    	System.out.println("ajax2");
	    	 jsonObject.put("msg", "error");
	    	 out.print(jsonObject.toString());
	    }
	    }
		@ResponseBody
		@RequestMapping("/jsp/registV1")
	    public String registV1(HttpServletRequest request, HttpServletResponse response,String username) {
		if(loginService.forget(username).split(",")[0].equals("0")){
	    	return "success";
	    }else{
	    	return "error";
	    }
	    }
		//修改个人信息
		@RequestMapping(value="/jsp/updateintroduce")
		public String updateintroduce(HttpServletRequest request,UserDetail userDetail){
			HttpSession session=request.getSession();
			User user=(User) session.getAttribute("user1");
			//System.out.println(userDetail);
			userDetail.setID(user.getID());
			try {
				userDetail.setSex(new String(userDetail.getSex().getBytes("iso-8859-1"),"utf-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			loginService.updateIntroduce(userDetail);
			session.removeAttribute("user1Detail");
			userDetail=loginService.selectDetail(userDetail);
			
			session.setAttribute("user1Detail", userDetail);
				return  "jsp/introduce";
		}
		//上传头像
		@ResponseBody
		@RequestMapping("/jsp/stouxiang")
	    public String stouxiang(HttpServletRequest request, HttpServletResponse response,String img,int ID) {
			//int ID=Integer.valueOf(ID1);
			System.out.println(img);
			BASE64Decoder decoder = new BASE64Decoder();  
			String leixing=img.split("/")[1].split(";")[0];
		    String arr = img.split("base64,")[1];
		    
//		    User user=new User();
//		    user.setID(ID);
		    UserDetail userDetail=new UserDetail();
		    userDetail.setID(ID);
		    String oldpath=loginService.selectDetail(userDetail).getTouxiang();
		    if(oldpath.split("/")[1].equals("test")){
		    }else{
		    	//先删除原图像 oldpath
		    	oldpath="E:/sWORK"+oldpath;
		    	File file=new File(oldpath);
		    	file.delete();
		    }
		    String picPath =  "/touxiang"+"/"+UUID.randomUUID().toString()+"."+leixing;  
		    userDetail.setTouxiang(picPath);
		    loginService.updateTouXiang(userDetail);
		    // 数据中：data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABI4AAAEsCAYAAAClh/jbAAA ...  在"base64,"之后的才是图片信息  
		    picPath="E:/sWORK"+picPath;
		    try {  
		        byte[] buffer = decoder.decodeBuffer(arr);  
		        OutputStream os = new FileOutputStream(picPath);  
		        os.write(buffer);  
		        os.close();  
		    } catch (IOException e) {  
		    	e.printStackTrace();
		    } 
			return "success";
	    }
	
	//获取登入ID
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getRemoteAddr();
		}
		return ip;
		}
	
}
