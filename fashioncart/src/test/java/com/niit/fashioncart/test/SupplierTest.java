package com.niit.fashioncart.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import com.niit.fashioncart.dao.SupplierDAO;
import com.niit.fashioncart.model.Supplier;

public class SupplierTest
{
public static void main(String[] args) {
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.fashioncart");
		context.refresh();		
		SupplierDAO supplierDAO=(SupplierDAO)context.getBean("supplierDAO");
		Supplier supplier =(Supplier) context.getBean("supplier");
		
		supplier.setSid("1011");
		supplier.setScname("Sneha");
		supplier.setSphone("9844786125");
		supplier.setSaddress("jaynagar");
		
		supplierDAO.addSupplier(supplier);
		
	
}
}
