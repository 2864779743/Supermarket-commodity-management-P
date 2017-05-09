package com.sltl.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Product;
import com.entity.ProductSales;
import com.entity.Sales;
import com.framework.BaseDao;

@Repository
public class ProductDaoImpl extends BaseDao{

	
	public List<Product> findList(Product product){
		try{
			return super.findList(product);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public Product getProductById(Integer productId){
		try{
			return super.getProductById(productId);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateProduct(Product product) throws Exception {
		super.updateProduct(product);
	}
	
	//新增Sales
    public Integer saveSales(Sales sales) throws Exception {  
    	return super.saveSales(sales);
    }  
    
    //新增ProductSales
    public void saveProductSales(ProductSales productSales) throws Exception {  
    	super.saveProductSales(productSales);
    }  
}
