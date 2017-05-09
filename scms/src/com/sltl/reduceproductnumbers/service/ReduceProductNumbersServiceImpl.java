package com.sltl.reduceproductnumbers.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sltl.reduceproductnumbers.dao.ReduceProductNumbersDaoImpl;

@Service
public class ReduceProductNumbersServiceImpl {

	
	@Resource
	ReduceProductNumbersDaoImpl reduceProductNumbersDaoImpl;
}
