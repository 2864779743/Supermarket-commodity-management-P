package com.sltl.product.controller;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aop.DataSourceContextHolder;
import com.entity.Product;
import com.sltl.product.service.ProductServiceImpl;


@Controller
@RequestMapping("product")
public class ProductController {
	@Resource
	private ProductServiceImpl productServiceImpl;
	
	@RequestMapping("findProductList")
	public String findProductList(ModelMap modelMap, HttpSession session) throws SQLException, ClassNotFoundException{
		
		System.out.println("½øÀ´ÁË");
		DataSourceContextHolder.setDbInfo("zs," + "root" + ","+ "123");
		session.setAttribute("dbInfo","zs," + "root" + ","+ "123");
		
		List<Product> list=this.productServiceImpl.findList(new Product());
		modelMap.put("list", list);
		return "shangpin-imexport";
	}
	
	@RequestMapping(value = "/addProductNumber",method = RequestMethod.POST)
    @ResponseBody
	public String addProductNumber(@RequestParam("productId") Integer productId,
			@RequestParam("number") Integer number,HttpSession session) throws SQLException, ClassNotFoundException{
		
		System.out.println("productId£º"+productId);
		System.out.println("number£º"+number);
		
		boolean bl = this.productServiceImpl.addProductNumbers(productId, number);
		if(bl){
			return "success";
		}else{
			return "error";
		}
	}
	
	@RequestMapping(value = "/reductProductNumber",method = RequestMethod.POST)
    @ResponseBody
	public String reductProductNumber(@RequestParam("productId") Integer productId,
			@RequestParam("number") Integer number,HttpSession session) throws SQLException, ClassNotFoundException{
		
		System.out.println("productId£º"+productId);
		System.out.println("number£º"+number);
		
		boolean bl = this.productServiceImpl.reduceProductNumbers(productId, number);
		if(bl){
			return "success";
		}else{
			return "error";
		}
	}
}
