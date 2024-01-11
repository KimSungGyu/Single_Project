package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import category.model.CategoryBean;
import category.model.CategoryDao;

@Controller
public class ProductListController {

	private final String command = "/list.product";
	private final String viewPage = "productList";
	
	@Autowired
	private CategoryDao categoryDao;
	
	@RequestMapping(value = command)
	public String list(Model model) {
		
		List<CategoryBean> lists = categoryDao.getAllCategory();
		model.addAttribute("categoryList", lists);
		
		return viewPage;
	}
}
