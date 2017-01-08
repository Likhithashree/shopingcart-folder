package com.niit.fashioncart.dao;

import java.util.List;

import com.niit.fashioncart.model.Products;

public interface ProductsDAO
{
	public void addProducts(Products products);
	public Products getProducts(String id);
	public void delete(String id);
	public List<Products> list();
	public Products getByName(String name);
}
