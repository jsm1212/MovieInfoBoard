package mul.camp.seven.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import mul.camp.seven.dto.MemberDto;
import mul.camp.seven.service.FindSV;
import mul.camp.seven.tool.Encrypt;
import mul.camp.seven.tool.Mailer;

@Controller
public class FindController {
	private static Logger lg = LoggerFactory.getLogger(FindController.class);

	@Autowired
	FindSV sv;
	
	/* #21# MemberController에 있어서 login.do, idFind.do, pwdFind.do 주석 처리 */
	// login.jsp는 희정님이 하심
	/*@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		lg.info("CTR login()" + new Date());
		return "login";
	}*/
	
	// 아이디 찾기 창으로 이동
	/*@RequestMapping(value = "idFind.do", method = RequestMethod.GET)
	public String idFind() {
		lg.info("CTR idFind()" + new Date());
		return "idFind";
	}*/
	
	// idFind.jsp에서 회원테이블에 존재하는 이메일인지 확인 후 회원이면 인증번호 전송
	@ResponseBody
	@RequestMapping(value = "emailCheck.do", method = RequestMethod.POST)
	public int emailCheck(String email) {
		lg.info("CTR emailCheck()" + new Date());
		
		Mailer mail = new Mailer();
		int result = sv.sameEmail(email);
		
		if(result > 0) { // 회원 O
			// 인증번호 랜덤 생성
			Random rd = new Random();
			int randomNum = rd.nextInt(899999) + 100000; // 100000 ~ 999999까지 랜덤번호 생성
			
			String title = "인증번호 전송";							// 메일 제목 
	        String content = "인증번호는 " + randomNum + " 입니다";	// 메일 내용
			mail.SendMail(email, title, content);
			
			return randomNum;
		} else {
			return -1;
		}
	}
	
	// 이메일과 일치하는 아이디를 보여주고 로그인 or 비밀번호 찾기로 이동
	@RequestMapping(value = "idView.do", method = RequestMethod.GET)
	public String idView(String email, Model md) {
		lg.info("CTR idView()" + new Date());
		
		String id = sv.getId(email);
		md.addAttribute("_id", id);
		
		return "idView";
	}
	
	// 비밀번호 찾기 창으로 이동
	/*@RequestMapping(value = "pwdFind.do", method = RequestMethod.GET)
	public String pwdFind() {
		lg.info("CTR pwdFind()" + new Date());
		return "pwdFind";
	}*/
	
	// pwdFind.jsp에서 회원테이블에 존재하는 아이디인지 확인
	@ResponseBody		
	@RequestMapping(value = "idCheck.do", method = RequestMethod.POST)
	public int idCheck(String id) {
		lg.info("CTR idCheck()" + new Date());
		
		return sv.sameId(id);
	}
	
	// 회원 목록에 존재하면 pwdFind2.jsp에서 이메일 인증
	@RequestMapping(value = "pwdFind2.do", method = RequestMethod.GET)
	public String pwdFind2() {
		lg.info("CTR pwdFind2()" + new Date());
		return "pwdFind2";
	}
	
	// 비밀번호 재설정
	@RequestMapping(value = "pwdReset.do", method = RequestMethod.GET)
	public String pwdReset(String email, Model md) {
		lg.info("CTR pwdReset()" + new Date());
		
		String id = sv.getId(email);
		md.addAttribute("_id2", id);
		
		return "pwdReset";
	}
	
	// 변경한 비밀번호 DB에 반영
	@RequestMapping(value = "pwdUpdate.do", method = RequestMethod.GET)
	public String pwdUpdate(MemberDto dto) {
		lg.info("CTR pwdUpdate()" + new Date());
		
		Encrypt encrypt = new Encrypt();
		String enc_password = encrypt.hashingWithSHA256(dto.getPwd());
		dto.setPwd(enc_password);
		
		List<MemberDto> mem = sv.changePwd(dto);
		return "redirect:/login.do";
	}
}