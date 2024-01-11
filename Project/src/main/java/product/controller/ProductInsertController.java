package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductInsertController {

	private final String command = "/insert.product";
	private final String viewPage = "productInsert";
	
	@RequestMapping(value = command)
	public String insertGet() {
		
		return viewPage;
	}
}
