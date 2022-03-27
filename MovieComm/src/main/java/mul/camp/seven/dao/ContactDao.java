package mul.camp.seven.dao;

import java.util.List;

import mul.camp.seven.dto.ContactDto;
import mul.camp.seven.dto.ContactParam;

public interface ContactDao {
	List<ContactDto> contact(ContactParam param);
	
	int contactwrite(ContactDto dto);
	
	ContactDto getContact(int seq);
	
	int deletecontact(ContactDto dto);
	
	int contactupdate(ContactDto dto);
	
	int answer(ContactDto dto);
}
