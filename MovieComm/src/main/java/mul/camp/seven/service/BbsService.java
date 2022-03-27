package mul.camp.seven.service;

import java.util.List;

import mul.camp.seven.dto.BbsDto;
import mul.camp.seven.dto.BbsParam;

public interface BbsService {

	List<BbsDto> bbslist(BbsParam param);
	
	boolean writebbs(BbsDto dto);
	
	BbsDto getBbs(int seq);
	
	void reply(BbsDto dto);
	
	void update(BbsDto dto);
	
	void delete(int seq);
}
