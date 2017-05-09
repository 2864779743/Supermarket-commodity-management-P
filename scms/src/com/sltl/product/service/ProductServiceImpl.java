package com.sltl.product.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.entity.Product;
import com.entity.ProductSales;
import com.entity.Sales;
import com.sltl.product.dao.ProductDaoImpl;

@Service
public class ProductServiceImpl {

	
	@Resource
	ProductDaoImpl productDaoImpl;
	
	//查询商品列表
	public List<Product> findList(Product product){
		return productDaoImpl.findList(product);
	}
	
	public Product getProductById(Integer productId){
		return productDaoImpl.getProductById(productId);
	}
	
	
	//进货
	public boolean addProductNumbers(Integer productId, Integer number){
		try{
			Product product = productDaoImpl.getProductById(productId);
			product.setCount(number + product.getCount());
			product.setProfit(product.getProfit());
			productDaoImpl.updateProduct(product);
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//出货
	public boolean reduceProductNumbers(Integer productId, Integer number){
		try{
			Sales sales = new Sales();
			sales.setDate(new Date());
			sales.setSaleCount(number);
			int salesId = productDaoImpl.saveSales(sales);
			
			ProductSales productSales = new ProductSales();
			productSales.setProductId(productId);
			productSales.setSalesId(salesId);
			productDaoImpl.saveProductSales(productSales);
			
			Product product = productDaoImpl.getProductById(productId);
			product.setCount(product.getCount() - number);
			Float profit = number*(product.getPrice() - product.getBid());
			product.setProfit(profit + product.getProfit());
			productDaoImpl.updateProduct(product);
			
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
}
