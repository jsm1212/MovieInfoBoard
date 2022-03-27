package mul.camp.seven.dao;

import java.util.List;
import mul.camp.seven.dto.MemberDto;

public interface FindDao {
	int sameEmail(String email); // 이메일 존재여부 확인
	String getId(String email);	 // email정보와 일치하는 아이디 조회

	int sameId(String id);		 // 아이디 존재여부 확인
	
	List<MemberDto> changePwd(MemberDto dto); // DB 비밀번호 변경
}