package mul.camp.seven.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import mul.camp.seven.dao.FindDao;
import mul.camp.seven.dto.MemberDto;

@Service
public class FindSvImpl implements FindSV{
	@Autowired
	FindDao dao;
	
	// id찾기
	@Override
	public int sameEmail(String email) {
		return dao.sameEmail(email);
	}
	@Override
	public String getId(String email) {
		return dao.getId(email);
	}
	
	// 비밀번호 찾기
	@Override
	public int sameId(String id) {
		return dao.sameId(id);
	}
	
	// 비밀번호 변경
	@Override
	public List<MemberDto> changePwd(MemberDto dto) {
		return dao.changePwd(dto);
	}
}