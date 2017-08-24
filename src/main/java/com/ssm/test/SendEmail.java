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
    public static final String FROM = "15958102060@163.com";//�����˵�email  
    public static final String PWD = "dxy1994";//����������  
      
    /** 
     * ��ȡSession 
     * @return 
     */  
    private static Session getSession() {  
        Properties props = new Properties();  
        props.put("mail.smtp.host", HOST);//���÷�������ַ  
        props.put("mail.store.protocol" , PROTOCOL);//����Э��  
        props.put("mail.smtp.port", PORT);//���ö˿�  
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
            msg.setSubject("�˺ż����ʼ�");  
            msg.setSentDate(new Date());  
            StringBuilder builder = new StringBuilder();
            builder.append("<p>�װ����û� <span style=\"color:#C40000\">");
            builder.append(toEmail);
            builder.append("</span> , ���ã�</p>");
            builder.append("\n"+content);
            builder.append("<p style=\"margin:30px 0 0;color:#c80000;\"><b>�������Ҫ�������������������!����Ǳ��˲��������</b></p>");
          //  builder.append("\nʱ�� " + new Date()+"<br>");
            builder.append("\n����:"+"<br>");
            //118.89.148.122
            //localhost
           // builder.append("http://118.89.148.122:8080/s/regist1?mail=");
            builder.append("http://localhost:8080/s/regist1?mail=");
            builder.append(toEmail);
            builder.append("&code=");
            builder.append(uuid);
            builder.append("<br>(��������޷�������뽫��������������ĵ�ַ����)���ߵ������һ��");
           // builder.append("<br><a href=\"http://118.89.148.122:8080/s/regist1?mail=");
            builder.append("<br><a href=\"http://localhost:8080/s/regist1?mail=");
            builder.append(toEmail);
            builder.append("&code=");
            builder.append(uuid);
            builder.append("\">������</a>");
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
        	String content1= "<p>�װ����û� <span style=\"color:#C40000\">"+toEmail+"</span> , ���ã�</p>";
            System.out.println("--send--"+content);  
            // Instantiate a message  
            Message msg = new MimeMessage(session);  
   
            //Set message attributes  
            msg.setFrom(new InternetAddress(FROM));  
            InternetAddress[] address = {new InternetAddress(toEmail)};  
            msg.setRecipients(Message.RecipientType.TO, address);  
            msg.setSubject("�˺����������ʼ�");  
            msg.setSentDate(new Date());  
            StringBuilder builder = new StringBuilder();
            builder.append(content1);
            builder.append("\n"+content);
            builder.append("<p style=\"margin:30px 0 0;color:#c80000;\"><b>�������Ҫ��������������������!����Ǳ��˲��������</b></p>");
            // builder.append("\nʱ�� " + new Date()+"<br>");
            builder.append("\n����:"+"<br>");
            //builder.append("http://118.89.148.122:8080/s/jsp/forget1?mail=");
            builder.append("http://localhost:8080/s/jsp/forget1?mail=");
            builder.append(toEmail);
            builder.append("&code=");
            builder.append(uuid);
            builder.append("<br>(��������޷�������뽫��������������ĵ�ַ����)���ߵ������һ��");
           // builder.append("<br><a href=\"http://118.89.148.122:8080/s/jsp/forget1?mail=");
            builder.append("<br><a href=\"http://localhost:8080/s/jsp/forget1?mail=");
            builder.append(toEmail);
            builder.append("&code=");
            builder.append(uuid);
            builder.append("\">������</a>");
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
    	//send("yw.19941007@qq.com", "ע��ɹ�");
    	//sendPassword("15958102060@163.com,546574897897", "��������");
    	sendPassword("yw.19941007@qq.com,546574897897", "��������");
	}
  
}  