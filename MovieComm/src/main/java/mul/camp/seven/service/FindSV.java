package mul.camp.seven.service;

import java.util.List;
import mul.camp.seven.dto.MemberDto;

public interface FindSV { // FindDao와 동일
	int sameEmail(String email);
	String getId(String email);

	int sameId(String id);
	
	List<MemberDto> changePwd(MemberDto dto);
}