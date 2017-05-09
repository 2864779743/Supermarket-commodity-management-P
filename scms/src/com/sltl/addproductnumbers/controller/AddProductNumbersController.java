package com.sltl.addproductnumbers.controller;

/**
 * @author  袁赞
 * @Time 2016年11月29日09:04:20
 * @describe 增加商品数量（进货）
 */
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sltl.addproductnumbers.service.AddProductNumbersServiceImpl;

@Controller
@RequestMapping("addnumbers")
public class AddProductNumbersController {
	@Resource
	private AddProductNumbersServiceImpl addProductNumbersServiceImpl;
}
