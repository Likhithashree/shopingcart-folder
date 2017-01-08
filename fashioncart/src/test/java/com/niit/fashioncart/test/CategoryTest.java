package com.niit.fashioncart.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.niit.fashioncart.dao.CategoryDAO;
import com.niit.fashioncart.model.Category;

public class CategoryTest
{
public static void main(String[] args)
{		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.fashioncart");
		context.refresh();
		CategoryDAO categoryDAO=(CategoryDAO)context.getBean("categoryDAO");
		Category category =(Category) context.getBean("category");
		
		category.setCid("121");
		category.setCname("Designer Suits");
		category.setCdescription("Designer ethnic dress");
		
	    categoryDAO.addCategory(category);
		//categoryDAO.delete("121");
	
		
}
}

