package mul.camp.seven.dto;

import java.io.Serializable;

/*
-- 자유 게시판
CREATE TABLE MOVIEBBS(
	SEQ NUMBER(4) PRIMARY KEY, -- 게시판 시퀀스
	ID VARCHAR2(30) NOT NULL, -- 아이디
	REF NUMBER(4) NOT NULL, -- 게시글 순서
	STEP NUMBER(4) NOT NULL, -- 게시글에 달린 댓글 순서
	DEPTH NUMBER(4) NOT NULL, -- 그 댓글에 달린 답글 순서
	TITLE VARCHAR2(100) NOT NULL, -- 게시글 제목
	CONTENT VARCHAR2(3000) NOT NULL, -- 게시글 내용
	WDATE DATE NOT NULL, -- 게시글 등록 날짜
	DEL NUMBER(1) NOT NULL, -- 삭제할지 말지 여부를 판단
	READCOUNT NUMBER(8) NOT NULL -- 게시글 조회수
);

-- 자유 게시판 시퀀스
CREATE SEQUENCE BBS_SEQ
START WITH 1 INCREMENT BY 1;

-- MOVIEBBS 테이블의 ID는 LOGINMEMBER 테이블의 기본키인 ID를 외래키로 참조
ALTER TABLE MOVIEBBS
ADD CONSTRAINT FK_MOVIEBBS_ID FOREIGN KEY(ID)
REFERENCES LOGINMEMBER(ID);
*/

public class BbsDto implements Serializable {
	
	private int seq;		// 글의 번호
	private String id;		// 작성자
	
	private int ref;		// 그룹번호 -> 댓글용
	private int step;		// 행번호
	private int depth;  	// 깊이
	
	private String title;   // 제목
	private String content; // 내용
	private String wdate;   // 작성일
	
	private int del;		// 삭제
	private int readcount;  // 조회수
	
	public BbsDto() {
		
	}

	public BbsDto(int seq, String id, int ref, int step, int depth, String title, String content, String wdate, int del,
			int readcount) {
		super();
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "BbsDto [seq=" + seq + ", id=" + id + ", ref=" + ref + ", step=" + step + ", depth=" + depth + ", title="
				+ title + ", content=" + content + ", wdate=" + wdate + ", del=" + del + ", readcount=" + readcount
				+ "]";
	}
	
	
}
