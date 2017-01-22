package com.niit.fashioncart.dao;

import java.util.List;
import com.niit.fashioncart.model.Cart;

public interface CartDAO 
{ 
  public void addCart(Cart cart); 
  public void deleteCart(int id);
  public Cart getCart(String p_id); 
  public List<Cart> list();
  public List<Cart> userCartList(String uname);  
}
