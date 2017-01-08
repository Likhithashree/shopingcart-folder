package com.niit.fashioncart.dao;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import com.niit.fashioncart.model.Products;
import com.niit.fashioncart.model.Supplier;

@Repository("productsDAO")
@EnableTransactionManagement

public class ProductsDAOImpl implements ProductsDAO {
	@Autowired
	private SessionFactory sessionFactory;
	

	public ProductsDAOImpl(SessionFactory sessionFactory) {
		
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public void addProducts(Products products) {
		sessionFactory.getCurrentSession().saveOrUpdate(products);
	}
	@Transactional
	public void delete(String id)
	{
		Products products=new Products();
		products.setPid(id);
		sessionFactory.getCurrentSession().delete(products);
	}
	
	@Transactional
	public Products getProducts(String id)
	{
		String hql="from Products where c_ID="+"'"+id+"'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		List<Products> list=(List<Products>) query.list();
		if(list!=null&& !list.isEmpty())
		{
			return list.get(0);
		}
		return null;
		
	}
	
	@Transactional
	public Products getByName(String name)
	{
		String hql="from Products where c_Name="+"'"+ name +"'";
		@SuppressWarnings("rawtypes")
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Products> list= query.list();
		if(list!=null && !list.isEmpty())
		{
			return list.get(0);
		}
		return null;
		
	}
	
	@Transactional
	public List<Products> list()
	{
		List<Products> list= (List<Products>) sessionFactory.getCurrentSession().createCriteria(Products.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return list;
				
	}
	
}
