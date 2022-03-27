package mul.camp.seven.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import mul.camp.seven.dto.MemberDto;

@Repository
public class FindDaoImpl implements FindDao{
	@Autowired
	SqlSession session;
	
	String ns = "MovieMember.";

	// id찾기
	@Override
	public int sameEmail(String email) {
		return session.selectOne(ns + "sameEmail", email);
	}
	@Override
	public String getId(String email) {
		return session.selectOne(ns + "getId", email);
	}
	
	// 비밀번호 찾기
	@Override
	public int sameId(String id) {
		return session.selectOne(ns + "sameId", id);
	}
	
	// 비밀번호 변경
	@Override
	public List<MemberDto> changePwd(MemberDto dto) {
		return session.selectList(ns + "changePwd", dto);
	}
}