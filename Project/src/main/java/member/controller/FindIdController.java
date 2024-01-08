package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindIdController {

	private final String command = "/findId.member";
	private final String viewPage = "findIdForm";
	
	@RequestMapping(value = command)
	public String findIdGet() {
		
		return viewPage;
	}
}
