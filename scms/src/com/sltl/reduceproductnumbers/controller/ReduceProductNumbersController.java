package com.sltl.reduceproductnumbers.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sltl.reduceproductnumbers.service.ReduceProductNumbersServiceImpl;

@Controller
@RequestMapping("reducenumber")
public class ReduceProductNumbersController {
	@Resource
	private ReduceProductNumbersServiceImpl reduceProductNumbersServiceImpl;
}
