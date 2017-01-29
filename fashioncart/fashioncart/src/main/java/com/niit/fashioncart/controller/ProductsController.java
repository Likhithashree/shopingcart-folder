package com.niit.fashioncart.controller;

import javax.validation.Valid;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import com.niit.fashioncart.dao.CategoryDAO;
import com.niit.fashioncart.dao.ProductsDAO;
import com.niit.fashioncart.dao.SupplierDAO;
import com.niit.fashioncart.model.Category;
import com.niit.fashioncart.model.Products;
import com.niit.fashioncart.model.Supplier;
import com.niit.fashioncart.util.Util;

@Controller 
public class ProductsController
{
	@Autowired
	ProductsDAO productsDAO;
	
	//@Autowired
	//Products products;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	Category category;
	
	@Autowired
	Supplier supplier;
	
	private Path path;
	
//	@RequestMapping("/products")
//	public ModelAndView getRegister(Model m)
//	{
//		m.addAttribute("products",new Products());
//		ModelAndView model = new ModelAndView("products");
//		return model;
//	}
	
	@RequestMapping(value="products/add", method=RequestMethod.POST)
	public String addProducts(Model model, @Valid @ModelAttribute("products") Products products,HttpServletRequest request)
	{
		System.out.println(products);
		System.out.println("hello...."+products.getCategory());
		Category category=categoryDAO.getByName(products.getCategory().getCname());
		System.out.println(category);
		categoryDAO.addCategory(category);
		
		Supplier supplier=supplierDAO.getByName(products.getSupplier().getScname());
		supplierDAO.addSupplier(supplier);
		
		products.setCategory(category);
		products.setSupplier(supplier);
		
		products.setCategory_id(category.getCid());
		products.setSupplier_id(supplier.getSid());
		
		Util util = new Util();
		String p_id = util.commaProblem(products.getPid());
		products.setPid(p_id);
		
		productsDAO.addProducts(products);
		
		
		MultipartFile file=products.getImage();
		String rootDirectory=request.getSession().getServletContext().getRealPath("/");
		path=Paths.get(rootDirectory +"\\WEB-INF\\resources\\images\\"+products.getPid()+".jpg");
		
		if(file!=null && !file.isEmpty())
		{
			try 
			{
				file.transferTo(new File(path.toString()));
				System.out.println("Image Uploaded");
			}
			catch(Exception e)
			{
				e.printStackTrace();
				throw new RuntimeException("image not saved");
			}
		}
		return "redirect:/products";		
	}
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String listProducts(Model model)
	{
		model.addAttribute("products",new Products());
		model.addAttribute("category",new Category());
		model.addAttribute("supplier",new Supplier());
		model.addAttribute("productsList",this.productsDAO.list());
		model.addAttribute("categoryList",this.categoryDAO.list());
		model.addAttribute("supplierList",this.supplierDAO.list());
		return "products";	
	}
	@RequestMapping("products/remove/{pid}")
	public String deleteProduct(@PathVariable("pid") String id, ModelMap model) throws Exception {

		try {
			productsDAO.delete(id);
			model.addAttribute("message", "Successfully Deleted");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		// redirectAttrs.addFlashAttribute(arg0, arg1)
		return "redirect:/products";
	}	

	@RequestMapping("products/edit/{pid}")
	public String editProducts(@PathVariable("pid") String id, Model model) {
		System.out.println("editProducts");
		model.addAttribute("products", this.productsDAO.getProducts(id));
		model.addAttribute("productsList", this.productsDAO.list());
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("supplierList", this.supplierDAO.list());
		return "products";
	}	
	@RequestMapping(value="products/get/{pid}")
	public String getSelectedProduct(@PathVariable("pid") String id,Model model,RedirectAttributes redirectAttributes)
	{
	redirectAttributes.addFlashAttribute("selectedProducts",productsDAO.getProducts(id));
	return "redirect:/backToHome";
	}

	@RequestMapping(value="/backToHome",method=RequestMethod.GET)
	public String backToHome(@ModelAttribute("selectedProducts")
	final Products selectedProducts,final Model model)
	{
	model.addAttribute("selectedProducts",selectedProducts);
	model.addAttribute("categoryList",this.categoryDAO.list());
	return "item";
	}
}