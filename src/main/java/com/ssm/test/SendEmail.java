package com.ssm.test;
import java.util.Date;  
import java.util.Properties;  
import javax.mail.Authenticator;  
import javax.mail.Message;  
import javax.mail.MessagingException;  
import javax.mail.PasswordAuthentication;  
import javax.mail.Session;  
import javax.mail.Transport;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  

import org.junit.Test;
  
  
/** 
 *  
 * @author Qixuan.Chen 
 */  
public class SendEmail {  
      
    public static final String HOST = "smtp.163.com";  
    public static final String PROTOCOL = "smtp";     
    public static final int PORT = 25;  
    public static final String FROM = "15958102060@163.com";//发件人的email  
    public static final String PWD = "dxy1994";//发件人密码  
      
    /** 
     * 获取Session 
     * @return 
     */  
    private static Session getSession() {  
        Properties props = new Properties();  
        props.put("mail.smtp.host", HOST);//设置服务器地址  
        props.put("mail.store.protocol" , PROTOCOL);//设置协议  
        props.put("mail.smtp.port", PORT);//设置端口  
        props.put("mail.smtp.auth" , true);  
          
        Authenticator authenticator = new Authenticator() {  
  
            @Override  
            protected PasswordAuthentication getPasswordAuthentication() {  
                return new PasswordAuthentication(FROM, PWD);  
            }  
              
        };  
        Session session = Session.getDefaultInstance(props , authenticator);  
          
        return session;  
    }  
      
    public static void send(String toEmail , String content) {  
        Session session = getSession();  
        try {  
        	String uuid= toEmail.split(",")[1];
        	toEmail =toEmail.split(",")[0];
            System.out.println("--send--"+content);  
            // Instantiate a message  
            Message msg = new MimeMessage(session);  
            //Set message attributes  
            msg.setFrom(new InternetAddress(FROM));  
            InternetAddress[] address = {new InternetAddress(toEmail)};  
            msg.setRecipients(Message.RecipientType.TO, address);  
            msg.setSubject("账号激活邮件");  
            msg.setSentDate(new Date());  
            StringBuilder builder = new StringBuilder();
            builder.append("<p>亲爱的用户 <span style=\"color:#C40000\">");
            builder.append(toEmail);
            builder.append("</span> , 您好！</p>");
            builder.append("\n"+content);
            builder.append("<p style=\"margin:30px 0 0;color:#c80000;\"><b>如果您需要激活登入请点击以下链接!如果非本人操作请忽略</b></p>");
          //  builder.append("\n时间 " + new Date()+"<br>");
            builder.append("\n链接:"+"<br>");
            //118.89.148.122
            //localhost
           // builder.append("http://118.89.148.122:8080/s/regist1?mail=");
            builder.append("http://localhost:8080/s/regist1?mail=");
            builder.append(toEmail);
            builder.append("&code=");
            builder.append(uuid);
            builder.append("<br>(如果链接无法点击，请将它拷贝到浏览器的地址栏中)或者点击下面一行");
           // builder.append("<br><a href=\"http://118.89.148.122:8080/s/regist1?mail=");
            builder.append("<br><a href=\"http://localhost:8080/s/regist1?mail=");
            builder.append(toEmail);
            builder.append("&code=");
            builder.append(uuid);
            builder.append("\">点这里</a>");
            content=builder.toString();
            msg.setContent(content , "text/html;charset=utf-8");  
   
            //Send the message  
           
            Transport.send(msg);  
        }  
        catch (MessagingException mex) {  
            mex.printStackTrace();  
        }  
    }  
    public static void sendPassword(String toEmail , String content) {  
        Session session = getSession();  
        try {  
        	String uuid= toEmail.split(",")[1];
        	toEmail =toEmail.split(",")[0];
        	String content1= "<p>亲爱的用户 <span style=\"color:#C40000\">"+toEmail+"</span> , 您好！</p>";
            System.out.println("--send--"+content);  
            // Instantiate a message  
            Message msg = new MimeMessage(session);  
   
            //Set message attributes  
            msg.setFrom(new InternetAddress(FROM));  
            InternetAddress[] address = {new InternetAddress(toEmail)};  
            msg.setRecipients(Message.RecipientType.TO, address);  
            msg.setSubject("账号重置密码邮件");  
            msg.setSentDate(new Date());  
            StringBuilder builder = new StringBuilder();
            builder.append(content1);
            builder.append("\n"+content);
            builder.append("<p style=\"margin:30px 0 0;color:#c80000;\"><b>如果您需要重置密码请点击以下链接!如果非本人操作请忽略</b></p>");
            // builder.append("\n时间 " + new Date()+"<br>");
            builder.append("\n链接:"+"<br>");
            //builder.append("http://118.89.148.122:8080/s/jsp/forget1?mail=");
            builder.append("http://localhost:8080/s/jsp/forget1?mail=");
            builder.append(toEmail);
            builder.append("&code=");
            builder.append(uuid);
            builder.append("<br>(如果链接无法点击，请将它拷贝到浏览器的地址栏中)或者点击下面一行");
           // builder.append("<br><a href=\"http://118.89.148.122:8080/s/jsp/forget1?mail=");
            builder.append("<br><a href=\"http://localhost:8080/s/jsp/forget1?mail=");
            builder.append(toEmail);
            builder.append("&code=");
            builder.append(uuid);
            builder.append("\">点这里</a>");
            content=builder.toString();
            msg.setContent(content , "text/html;charset=utf-8");  
   
            //Send the message  
           
            Transport.send(msg);  
        }  
        catch (MessagingException mex) {  
            mex.printStackTrace();  
        }  
    }
    @Test
    public void fun() {
    	//send("yw.19941007@qq.com", "注册成功");
    	//sendPassword("15958102060@163.com,546574897897", "重置密码");
    	sendPassword("yw.19941007@qq.com,546574897897", "重置密码");
	}
  
}  