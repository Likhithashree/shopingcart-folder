package com.niit.fashioncart.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.niit.fashioncart.dao.ProductsDAO;
import com.niit.fashioncart.model.Products;

public class ProductsTest 
{
	public static void main(String[] args)
	{		
			AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
			context.scan("com.niit.fashioncart");
			context.refresh();
			ProductsDAO productsDAO=(ProductsDAO)context.getBean("productsDAO");
			Products products =(Products) context.getBean("products");
			
			products.setPid("100");
			products.setPname("GMI");
			products.setPdescription("Stylish");
			products.setPprice(1425);
			
			productsDAO.addProducts(products);
			// productsDAO.delete("100");
	}
}
