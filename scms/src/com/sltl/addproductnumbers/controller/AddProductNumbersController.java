package com.sltl.addproductnumbers.controller;

/**
 * @author  Ԭ��
 * @Time 2016��11��29��09:04:20
 * @describe ������Ʒ������������
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
