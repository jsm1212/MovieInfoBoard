package mul.camp.seven.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.camp.seven.dto.BbsDto;
import mul.camp.seven.dto.BbsParam;

@Repository
public class BbsDaoImpl implements BbsDao{

	@Autowired
	SqlSession session;
	
	String ns = "MovieBbs.";
	
	@Override
	public List<BbsDto> bbslist(BbsParam param) {
		return session.selectList(ns + "bbslist", param);
	}
	
	@Override
	public int writebbs(BbsDto dto) {
		int count = session.insert(ns + "writebbs", dto);
		return count;
	}
	
	@Override
	public BbsDto getBbs(int seq) {
		return session.selectOne(ns + "getBbs", seq);
	}
	
	@Override
	public int replyBbsUpdate(BbsDto dto) {
		int n = session.update(ns + "replyBbsUpdate", dto);
		return n;
	}
	
	@Override
	public int replyBbsInsert(BbsDto dto) {
		int n = session.insert(ns + "replyBbsInsert", dto);
		return n;
	}

	@Override
	public void update(BbsDto dto) {
		session.update(ns + "update", dto);		
	}

	@Override
	public void delete(int seq) {
		session.delete(ns + "delete", seq);
		
	}
	
	
	
}
