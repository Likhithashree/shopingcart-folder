package com.niit.fashioncart.dao;

import java.util.List;
import com.niit.fashioncart.model.Category;

public interface CategoryDAO
{
	public void addCategory(Category category);
	public Category getCategory(String id);
	public void delete(String id);
	public List<Category> list();
	public Category getByName(String name);
}
