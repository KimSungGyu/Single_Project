package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindPwController {
	
	private final String command = "/findPw.member";
	private final String viewPage = "findPwForm";
	
	@RequestMapping(value = command)
	public String findPwGet() {
		
		return viewPage;
	}
}
