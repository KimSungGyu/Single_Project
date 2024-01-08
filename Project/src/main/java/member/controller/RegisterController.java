package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {
	
	private final String command = "/register.member";
	private final String viewPage = "registerForm";
	
	@RequestMapping(value = command)
	public String registerGet() {
		
		return viewPage;
	}
}
