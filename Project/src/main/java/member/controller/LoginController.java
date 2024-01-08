package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	private final String command = "/login.member";
	private final String viewPage = "loginForm";
	
	@RequestMapping(value = command)
	public String login() {
		
		return viewPage;
	}
}
