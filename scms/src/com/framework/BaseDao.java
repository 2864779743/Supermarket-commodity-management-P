package com.framework;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.entity.Adminlogin;
import com.entity.Product;
import com.entity.ProductSales;
import com.entity.Sales;

/**
 * @author 吴森
 * @Time 2016-11-20 14:49:01
 * @describe 这是一个数据库操作的类
 */
public abstract class BaseDao{
	@Resource
	private SessionFactory sessionFactory;
	
	

	//查询真实姓名
	public String findrealNameByLoginname(String sql) throws SQLException, ClassNotFoundException {
//		 Statement statement= this.getConnection().createStatement();
//		 ResultSet resultSet=statement.executeQuery(sql);
//		 while(resultSet.next()){
//			 //return resultSet.getString("realname");
//			 return resultSet.getString("name");
//		 }
//		return null;
		
		 Statement statement= ConnectionManager.getInstance().getConnection().createStatement();
		 ResultSet resultSet=statement.executeQuery(sql);
		 while(resultSet.next()){
			 //return resultSet.getString("realname");
			 return resultSet.getString("name");
		 }
		return null;
		
		
	}
	//查询存在吗
	public Adminlogin findOne(String hql, Object[] params) throws Exception {
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
			{
				System.out.println(params[i]);
				query.setParameter(i, params[i]);
				//query.setString(i, (String) params[i]);
			}
				
		}
		return (Adminlogin) query.uniqueResult();
	}
	
	//商品查询
	public List<Product> findList(Product product)throws Exception{
		List<Product> query = new ArrayList<Product>();
		String sql = "select p.productid as productId,p.name,p.count,p.bid,p.price,p.profit,pss.salecount from product p "
				+" left join ( "
				+" select ps.productid,sum(s.salecount) as salecount from sales s "
				+" left join productsales ps on ps.salesid=s.salesid "
				+" group by ps.productid "
				+" )pss on pss.productid=p.productid ";
		Connection conn = ConnectionManager.getInstance().getConnection();
		Statement statement = conn.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			Product p = new Product();
			p.setProductId(resultSet.getInt("productId"));
			p.setName(resultSet.getString("name"));
			p.setCount(resultSet.getInt("count"));
			p.setBid(resultSet.getFloat("bid"));
			p.setPrice(resultSet.getFloat("price"));
			p.setProfit(resultSet.getFloat("profit"));
			p.setSalecount(resultSet.getInt("salecount"));
			query.add(p);
		}
		statement.close();
		conn.close();
		conn.close();
		return query;
	}
	
	//单个商品查询
    public Product getProductById(Integer productId) throws Exception { 
    	 Connection conn = ConnectionManager.getInstance().getConnection();
    	 Statement statement= conn.createStatement();
		 ResultSet resultSet=statement.executeQuery("select p.productid as productId,p.name,p.count,p.bid,p.price,p.profit from product p where p.productid="+productId);
		 Product p = new Product();
		 while(resultSet.next()){
			p.setProductId(resultSet.getInt("productId"));
			p.setName(resultSet.getString("name"));
			p.setCount(resultSet.getInt("count"));
			p.setBid(resultSet.getFloat("bid"));
			p.setPrice(resultSet.getFloat("price"));
			p.setProfit(resultSet.getFloat("profit"));
		 }
		 statement.close();
		 conn.close();
		 return p;
    }  
    
    //修改操作
    public void updateProduct(Product product) throws Exception {  
    	String sql = "update product set count="+product.getCount()+",profit="+product.getProfit()+" where productid="+product.getProductId();
    	Connection conn = ConnectionManager.getInstance().getConnection();
    	Statement statement= conn.createStatement();
		statement.executeUpdate(sql);
		statement.close();
		conn.close();
    }  
    
    //新增Sales
    public Integer saveSales(Sales sales) throws Exception {  
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String sql = "insert into sales(date,salecount) values ('"+sdf.format(sales.getDate())+"',"+sales.getSaleCount()+")";
    	Connection conn = ConnectionManager.getInstance().getConnection();
    	Statement statement= conn.createStatement();
		statement.executeUpdate(sql);
    	
		ResultSet resultSet=statement.executeQuery("select max(salesid) as salesid from sales");
		int salesId = 0;
		while(resultSet.next()){
			salesId = resultSet.getInt("salesid");
		}
		statement.close();
		conn.close();
    	return salesId;
    }  
    
    //新增ProductSales
    public void saveProductSales(ProductSales productSales) throws Exception {  
    	String sql = "insert into productsales(productid,salesid) values ("+productSales.getProductId()+","+productSales.getSalesId()+")";
    	Connection conn = ConnectionManager.getInstance().getConnection();
    	Statement statement= conn.createStatement();
		statement.executeUpdate(sql);
		statement.close();
		conn.close();
    }  
    
    
    
    
	
}
