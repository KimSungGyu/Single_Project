package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import board.model.BoardDao;

@Controller
public class BoardWriteController {

	private final String command = "/write.board";
	private final String viewPage = "boardWrite";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value = command)
	public String writeGet() {
		
		return viewPage;
	}
}
