package com.poly.service.impl;

import javax.servlet.ServletContext;

import com.poly.entity.User;
import com.poly.service.EmailService;
import com.poly.util.SendEmailUtil;

public class EmailServiceImpl implements EmailService {

	private static final String EMAIL_WELCOM_SUBJECT = "Welcom to Molistar Entertainment";
	private static final String EMAIL_FORGOT_PASSWORD = "Molistar Entertainment -  New Password";

	@Override
	public void sendEmail(ServletContext context, User recipient, String type) {

		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");

		try {
			String content = null;
			String subject = null;
			
			switch (type) {
			case "welcome": // Gửi lời chào đăng kí về email đăng kýz
				subject = EMAIL_WELCOM_SUBJECT;
				content = "Dear " + recipient.getUsername()
						+ ".\n Welcome to Molistar Entertainment. \n --------------------- \n Contact for work : \n Name : Nguyen The Hung(Yellow) \n Number Phone : 0813302348";

				break;

			case "forgot": // Gửi mật khẩu về email đăng ký
				subject = EMAIL_FORGOT_PASSWORD;
				content = "Dear " + recipient.getUsername()
						+ " \n Your password to login to Molistar Entertainment is : " + recipient.getPassword()
						+ " .\n --------------------- \n Contact for work : \n Name : Nguyen The Hung(Yellow) \n Number Phone : 0813302348";
				break;
			default:
				subject = "Molistar Entertainment";
				content = "Maybe this email is wrong, do not care about it !!!";
			}
			SendEmailUtil.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
