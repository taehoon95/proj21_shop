package proj21_shop.controller.productlist;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prolist")
public class productListController {

	@GetMapping
	public String form() {
		return "/productList/productList";
	}
	
}
