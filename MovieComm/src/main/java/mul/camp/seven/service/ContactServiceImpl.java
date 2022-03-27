package mul.camp.seven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.camp.seven.dao.ContactDao;
import mul.camp.seven.dto.ContactDto;
import mul.camp.seven.dto.ContactParam;

@Service
public class ContactServiceImpl implements ContactService{
	
	@Autowired
	ContactDao dao;

	@Override
	public List<ContactDto> contact(ContactParam param) {
		return dao.contact(param);
	}

	@Override
	public int contactwrite(ContactDto dto) {
		return dao.contactwrite(dto);
	}

	@Override
	public ContactDto getContact(int seq) {
		return dao.getContact(seq);
	}


	@Override
	public int deletecontact(ContactDto dto) {
		return dao.deletecontact(dto);
	}

	@Override
	public int contactupdate(ContactDto dto) {
		return dao.contactupdate(dto);
	}

	@Override
	public int answer(ContactDto dto) {
		return dao.answer(dto);
	}
	
}
