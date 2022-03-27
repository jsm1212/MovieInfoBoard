package mul.camp.seven.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.camp.seven.dto.ContactDto;
import mul.camp.seven.dto.ContactParam;

@Repository
public class ContactDaoImpl implements ContactDao{
	
	@Autowired
	SqlSession session;
	
	String ns = "Contact.";

	@Override
	public List<ContactDto> contact(ContactParam param) {
		return session.selectList(ns + "contact", param);
	}

	@Override
	public int contactwrite(ContactDto dto) {
		return session.insert(ns + "contactwrite", dto);
	}

	@Override
	public ContactDto getContact(int seq) {
		return session.selectOne(ns + "getContact", seq);
	}
	
	@Override
	public int deletecontact(ContactDto dto) {
		return session.delete(ns + "deletecontact", dto);
	}

	@Override
	public int contactupdate(ContactDto dto) {
		return session.update(ns + "contactupdate", dto);
	}

	@Override
	public int answer(ContactDto dto) {
		return session.update(ns+ "answer", dto);	
	}
}
