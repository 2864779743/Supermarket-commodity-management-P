package com.sltl.addproductnumbers.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sltl.addproductnumbers.dao.AddProductNumbersDaoImpl;

@Service
public class AddProductNumbersServiceImpl {

	@Resource
	AddProductNumbersDaoImpl addProductNumbersDaoImpl;
}
