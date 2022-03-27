package mul.camp.seven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.camp.seven.dao.BbsDao;
import mul.camp.seven.dto.BbsDto;
import mul.camp.seven.dto.BbsParam;

@Service
public class BbsServiceImpl implements BbsService{

	@Autowired
	BbsDao dao;
	
	@Override
	public List<BbsDto> bbslist(BbsParam param) {
		return dao.bbslist(param);
	}
	
	@Override
	public boolean writebbs(BbsDto dto) {
		int count = dao.writebbs(dto);
		return count>0?true:false;
	}
	
	@Override
	public BbsDto getBbs(int seq) {
		return dao.getBbs(seq);
	}
	
	@Override
	public void reply(BbsDto dto) {
		int n = dao.replyBbsUpdate(dto);
		if(n == 0) {
			System.out.println("replyBbsUpdate fail~");
		}
		
		n = dao.replyBbsInsert(dto);
		if(n == 0) {
			System.out.println("replyBbsInsert fail~");
		}
	}

	@Override
	public void update(BbsDto dto) {
		dao.update(dto);
	}

	@Override
	public void delete(int seq) {
		dao.delete(seq);
	}
}
