package mul.camp.seven.dao;

import java.util.List;

import mul.camp.seven.dto.BbsDto;
import mul.camp.seven.dto.BbsParam;

public interface BbsDao {

	List<BbsDto> bbslist(BbsParam param);
	
	int writebbs(BbsDto dto);
	
	BbsDto getBbs(int seq);
	
	int replyBbsUpdate(BbsDto dto);
	int replyBbsInsert(BbsDto dto);
	
	void update(BbsDto dto);
	void delete(int seq);
}
