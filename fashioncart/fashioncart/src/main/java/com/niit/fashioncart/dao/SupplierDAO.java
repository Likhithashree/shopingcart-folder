package com.niit.fashioncart.dao;

import java.util.List;

import com.niit.fashioncart.model.Supplier;

public interface SupplierDAO 
{
	public void addSupplier(Supplier supplier);
	public Supplier getSupplier(String id);
	public void delete(String id);
	public List<Supplier> list();
	public Supplier getByName(String name);

	
	

}
