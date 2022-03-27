package mul.camp.seven.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mul.camp.seven.service.MovieReplyService;

@Controller
public class MovieReplyController {
	private static Logger logger = LoggerFactory.getLogger(MovieReplyController.class);
	
	@Autowired
	MovieReplyService Service;
	
	@RequestMapping(value="moviereply.do", method= RequestMethod.GET)
	public String moviereply() {
		logger.info("MovieReplyController moviereply() " + new Date());
		
		return "moviereview";
	}
	
	@RequestMapping(value="moviereview1.do", method= RequestMethod.GET)
	public String moviereview1() {
		logger.info("MovieReplyController moviereview1() " + new Date());
		
		return "moviereview1";
	}
	
	@RequestMapping(value="moviereview2.do", method= RequestMethod.GET)
	public String moviereview2() {
		logger.info("MovieReplyController moviereview2() " + new Date());
		
		return "moviereview2";
	}
	
	@RequestMapping(value="moviereview3.do", method= RequestMethod.GET)
	public String moviereview3() {
		logger.info("MovieReplyController moviereview3() " + new Date());
		
		return "moviereview3";
	}
	
	@RequestMapping(value="footer.do", method=RequestMethod.GET)
	public String footer() {
		logger.info("MovieReplyController footer() " + new Date());
		
		return "footer";
	}
}
