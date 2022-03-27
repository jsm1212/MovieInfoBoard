package mul.camp.seven.dto;

import java.io.Serializable;
import java.util.Date;

public class ContactDto implements Serializable{
	/* -- 문의사항
	CREATE TABLE CONTACT(
		CONTACT_SEQ NUMBER(4) PRIMARY KEY, -- 문의사항 시퀀스
		ID VARCHAR2(30) NOT NULL, -- ID
		TITLE VARCHAR2(100) NOT NULL, -- 문의제목
		CONTENT VARCHAR2(3000) NOT NULL, -- 문의내용
		WDATE DATE NOT NULL, --문의글 등록날짜
		DEL NUMBER(1) NOT NULL -- 문의글을 삭제할지 말지 여부
	); */
	
	/* #21# seq를 contact_seq로 모두 바꿈 */
	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private int del;
	private String answer;
	
	public ContactDto() {
		
	}

	public ContactDto(int seq, String id, String title, String content, String wdate, int del, String answer) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.answer = answer;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "ContactDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate="
				+ wdate + ", del=" + del + ", answer=" + answer + "]";
	}

	
}
