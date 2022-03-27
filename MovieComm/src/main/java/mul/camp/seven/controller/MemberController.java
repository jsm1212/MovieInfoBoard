package mul.camp.seven.controller;

import java.lang.reflect.Member;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.internal.Normalizer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.camp.seven.controller.MemberController;
import mul.camp.seven.dto.MemberDto;
import mul.camp.seven.service.MemberService;
import mul.camp.seven.tool.Encrypt;
import mul.camp.seven.tool.ValChecker;

@Controller
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	private ValChecker valchecker = new ValChecker();

	@Autowired
	MemberService service;

	/* [login.do] > login.jsp로 단순 이동 */
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		logger.info("MemberController login()" + new Date());

		return "login";
	}

	/* [regi.do] > regi.jsp로 단순 이동 */
	@RequestMapping(value = "regi.do", method = RequestMethod.GET)
	public String regi() {
		logger.info("MemberController regi()" + new Date());

		return "regi";
	}

	/* [idcheck.do] > ID 중복확인, Ajax 사용(비동기 처리) */
	@ResponseBody
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public String idcheck(String id) {
		logger.info("MemberController idcheck()" + new Date());
//		System.out.println("id 중복확인을 위해 가져온 값: " + id);

		int result = service.duplId(id);
//		System.out.println("전달받은 result 값 확인: " + result);
		if (result > 0) {
			return "no"; // id 사용불가
		} else {
			return "yes"; // id 사용가능
		}
	}

	/* [nickcheck.do] > NICKNAME 중복확인, Ajax 사용(비동기 처리) */
	@ResponseBody
	@RequestMapping(value = "nickcheck.do", method = RequestMethod.POST)
	public String nickcheck(String nickname) {
		logger.info("MemberController nickcheck()" + new Date());
//		System.out.println("닉네임 중복확인을 위해 가져온 값: " + nickname);

		int result = service.duplNick(nickname);
		if (result > 0) {
			return "no"; // 사용불가
		} else {
			return "yes"; // 사용가능
		}
	}

	/* [emailcheck.do] > EMAIL 중복확인, Ajax 사용(비동기 처리) */
	@ResponseBody
	@RequestMapping(value = "emailcheck.do", method = RequestMethod.POST)
	public String emailcheck(String email) {
		logger.info("MemberController emailcheck()" + new Date());
//		System.out.println("이메일 중복확인을 위해 가져온 값: " + email);

		int result = service.duplEmail(email);
		if (result > 0) {
			return "no"; // 사용불가
		} else {
			return "yes"; // 사용가능
		}
	}

	/* [regiAf.do] > 회원가입 기능 */
	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(MemberDto dto, Model model) {
		logger.info("MemberController regiAf()" + new Date());
		System.out.println("regiAf() 전달받은 값 확인: " + dto.toString());

		/* (Back) 회원가입 데이터 유효성 check _ ValChecker참조 */
		// ID
		String checkResult = valchecker.checkEmpty(dto.getId());
		if (checkResult == "false") {
			System.out.println("ID 유효성 검사 fail- > id값: " + dto.getId());

			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}
		// PWD
		checkResult = valchecker.checkPassword(dto.getPwd());
		if (checkResult == "false") {
			System.out.println("PWD 유효성 검사 fail- > 패스워드값: " + dto.getPwd());

			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}
		// NAME
		checkResult = valchecker.checkNAME(dto.getName());
		if (checkResult == "false") {
			System.out.println("NAME 유효성 검사 fail- > name값: " + dto.getName());

			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}
		// NICKNAME
		checkResult = valchecker.checkEmpty(dto.getNickname());
		if (checkResult == "false") {
			System.out.println("NICKNAME 유효성 검사 fail- > nickname값: " + dto.getNickname());

			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}
		// AGE
		checkResult = valchecker.checkNumber(Integer.toString(dto.getAge()));
		if (checkResult == "false") {
			System.out.println("AGE 유효성 검사 fail- > age값: " + dto.getAge());

			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}
		// EMAIL
		checkResult = valchecker.checkEmail(dto.getEmail());
		if (checkResult == "false") {
			System.out.println("EMAIL 유효성 검사 fail- > email값: " + dto.getEmail());

			model.addAttribute("msg", "회원가입 실패");
			model.addAttribute("url", "regi.do");
			return "errorAlert";
		}

		/* 비밀번호 암호화 */
		Encrypt encrypt = new Encrypt();
		String enc_password = encrypt.hashingWithSHA256(dto.getPwd()); // 암호화 진행
		logger.info("패스워드 암호화: " + enc_password); // 암호화된 PWD값 확인용 LOG
		dto.setPwd(enc_password); // dto에 암호화된 PWD로 넣기

		/* 회원가입 진행 */
		boolean result = service.regiMember(dto);
		if (result == true) {
			System.out.println("회원가입이 완료되었습니다.");
		}

		return "redirect:/login.do";
	}

	/* [loginAf.do] > 로그인 기능 */
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(MemberDto dto, HttpServletRequest req, Model model) {
		logger.info("MemberController loginAf()" + new Date());

		/* 회원가입에서 비밀번호 암호화했기 때문에 로그인에서도 동일하게 진행 */
		Encrypt encrypt = new Encrypt();
		String enc_password = encrypt.hashingWithSHA256(dto.getPwd()); // 암호화 진행
		// logger.info("패스워드 암호화: " + enc_password); // 암호화된 PWD값 확인용 LOG
		dto.setPwd(enc_password);

		MemberDto result = service.login(dto);
		if (result != null) {
			req.getSession().setAttribute("login", result); // login 결과값을 session(서버)에 저장 == 현재 로그인한 사용자의 PW빼고 모든 정보

			return "home";
			/* return "redirect:/mypage.do"; */
		} else {
			// 로그인 실패 시 alert창이 뜨도록 진행
			model.addAttribute("msg", "아이디 또는 비밀번호를 정확히 입력해주세요.");
			model.addAttribute("url", "login.do");
			return "errorAlert";
		}
	}

	/* [idFind.do] > idFind.jsp로 단순 이동 */
	@RequestMapping(value = "idFind.do", method = RequestMethod.GET)
	public String idFind() {
		logger.info("MemberController idFind()" + new Date());

		return "idFind";
	}

	/* [pwdFind.do] > pwdFind.jsp로 단순 이동 */
	@RequestMapping(value = "pwdFind.do", method = RequestMethod.GET)
	public String pwdFind() {
		logger.info("MemberController pwdFind()" + new Date());

		return "pwdFind";
	}
	
}
