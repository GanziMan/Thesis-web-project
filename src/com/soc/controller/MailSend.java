package com.soc.controller;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
	private static class SMTPAuthenticator extends Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			//지메일 아이디 , 비밀번호
			return new PasswordAuthentication("qjatn50089", "kim50089!!");
		}
	}
	
	
	public static String send(String a,String toEmail) {
		
		Properties p = new Properties();
		p.put("mail.smtp.user", "qjatn50089@gmail.com"); //본인 지메일
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");

		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			session.setDebug(true); 

			MimeMessage msg = new MimeMessage(session);
			String message = a;
			msg.setSubject("K-MMSE 인증번호");
			
			Address fromAddr = new InternetAddress("qjatn50089@gmail.com"); 
			msg.setFrom(fromAddr);
			
			Address toAddr = new InternetAddress(toEmail); 
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(message, "text/html;charset=KSC5601");
	
			Transport.send(msg);
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return "";
	}
}