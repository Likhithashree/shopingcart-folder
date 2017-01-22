package com.niit.fashioncart.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.niit.fashioncart.dao.UserDAO;
import com.niit.fashioncart.model.User;

public class UserTest {

	public static void main(String[] args) {
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.fashioncart");
		context.refresh();
		
		UserDAO userDAO=(UserDAO)context.getBean("userDAO");
		User user =(User) context.getBean("user");
		
		user.setName("Samaksh");
		user.setPassword("sam");
		user.setAddress("Whitefield");
		user.setEmail("samak29");
		user.setPhone("9844786146");
		
		userDAO.addUser(user);
	}
}
