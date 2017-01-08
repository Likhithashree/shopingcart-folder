package com.niit.fashioncart.config;

import java.util.Properties;
import javax.sql.DataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.niit.fashioncart.model.Category;
import com.niit.fashioncart.model.Products;
import com.niit.fashioncart.model.Supplier;
import com.niit.fashioncart.model.User;





@Configuration
@ComponentScan("com.niit.fashioncart")
@EnableTransactionManagement
public class ApplicationContext 
{
	@Bean(name="dataSource")
	public DataSource getDataSource(){
		DriverManagerDataSource dataSource=new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/collab");
		dataSource.setUsername("sa");
		dataSource.setPassword("");
		return dataSource;
	}
	
	
	private Properties getHibernateProperties(){
		Properties properties =new Properties();
		properties.put("hibernate.show_sql","true");
		properties.put("hibernate.dialect","org.hibernate.dialect.H2Dialect");
		return properties;
	}
	
	@Autowired
	@Bean(name="sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource){
		LocalSessionFactoryBuilder sessionBuilder=new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.addAnnotatedClass(User.class);
		sessionBuilder.addAnnotatedClass(Category.class);
		sessionBuilder.addAnnotatedClass(Supplier.class);
		sessionBuilder.addAnnotatedClass(Products.class);
		

		//sessionBuilder.addAnnotatedClass(UserDetails.class);
		System.out.println("connected");
		return sessionBuilder.buildSessionFactory();
	}
	
	@Autowired
	@Bean(name="transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory){
		HibernateTransactionManager transactionManager=new HibernateTransactionManager(sessionFactory);
		System.out.println("Transaction...");
		return transactionManager;
	}

}