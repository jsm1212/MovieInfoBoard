package mul.camp.seven.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mul.camp.seven.dto.ContactDto;
import mul.camp.seven.dto.ContactParam;
import mul.camp.seven.service.ContactService;

@Controller
public class ContactController {

private static Logger logger = LoggerFactory.getLogger(ContactController.class);
	
	@Autowired
	ContactService service;
	
	@RequestMapping(value="contact.do",  method = RequestMethod.GET)
	public String contact(Model model, ContactParam param) {
		logger.info("ContactController contact()" + new Date());
		
		List<ContactDto> list = service.contact(param);
		model.addAttribute("contact", list);
		
		return "contact";
	}
	
	@RequestMapping(value="contactwrite.do", method = RequestMethod.GET)
	public String contactwrite() {
		logger.info("ContactController contactwrite()" + new Date());
		
		return "contactwrite";
	}
	
	@RequestMapping(value="contactwriteAf.do", method =RequestMethod.POST)
	public String contactwriteAf(ContactDto dto) {
		logger.info("ContactController contactwriteAf()" + new Date());
		
		System.out.println(dto.toString());		// 확인
		
		int i = service.contactwrite(dto);
		if(i == 1) {
			System.out.println("성공적으로 추가되었습니다");
		}
		
		return "redirect:/contact.do";
	}
	
	@RequestMapping(value="contactdetail.do", method=RequestMethod.GET)
	public String contactdetail(Model model, int seq) {
		logger.info("ContactController contactdetail() " + new Date());
		
		ContactDto contact = service.getContact(seq);
		
		model.addAttribute("contact", contact);
		System.out.println(contact);
		
		return "contactdetail";
	}
	
	@RequestMapping(value="contactanswer.do", method=RequestMethod.GET)
	public String contactanswer(Model model, int seq) {
		logger.info("ContactController contactanswer() " + new Date());
		
		
		ContactDto contact = service.getContact(seq);
		model.addAttribute("contact", contact);
		
		return "contactanswer";
	}
	
	@RequestMapping(value="contactanswerAf.do", method=RequestMethod.GET)
	public String contactanswerAf(ContactDto dto) {
		logger.info("ContactController contactanswerAf()" + new Date());
		System.out.println("답변:" +dto.toString());
		
		service.answer(dto);
		
		return "redirect:/contact.do";
	}
	
	@RequestMapping(value="deletecontact.do", method=RequestMethod.GET)
	public String deletecontact(ContactDto dto) {
		logger.info("ContactController deletecontact()" + new Date());
		
		int i = service.deletecontact(dto);
		if(i == 1) {
			System.out.println("삭제되었습니다.");
		}
		
		return "redirect:/contact.do";
	}
	
	@RequestMapping(value="updatecontact.do", method=RequestMethod.GET)
	public String updatecontact(Model model, int seq) {
		logger.info("ContactController updatecontact()" + new Date());
		System.out.println("게시글 업데이트 페이지로 이동: " + seq);
		
		ContactDto contact = service.getContact(seq);
		model.addAttribute("contact", contact);
		
		return "contactupdate";
	}
	
	@RequestMapping(value="contactupdate.do", method=RequestMethod.POST)
	public String contactupdate(ContactDto dto, Model model) {
		logger.info("ContactController contactupdate()" + new Date());
		System.out.println("게시글 수정: " + dto.toString());
		
		int i = service.contactupdate(dto);
		if(i>0) {
			model.addAttribute("seq", dto.getSeq());
			System.out.println("수정되었습니다.");
		}
		return "redirect:/contactdetail.do";
	}
}
