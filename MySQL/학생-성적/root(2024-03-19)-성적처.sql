-- 성적데이터 처리
CREATE DATABASE scoreDB;
USE scoreDB;
CREATE TABLE tbl_temp_score (
	s_stnum	VARCHAR(5),
	s_kor	VARCHAR(10),
	s_eng	VARCHAR(10),
	s_math	VARCHAR(10),
	s_music	VARCHAR(10),
	s_art	VARCHAR(10),
	s_sw	VARCHAR(10),
	s_db	VARCHAR(10)
);
SELECT COUNT(*) FROM tbl_temp_score;

SELECT s_stnum,'국어', s_kor FROM tbl_temp_score
UNION
SELECT s_stnum,'영어', s_eng FROM tbl_temp_score
UNION
SELECT s_stnum,'수학', s_math FROM tbl_temp_score
UNION
SELECT s_stnum,'음악', s_music FROM tbl_temp_score
UNION
SELECT s_stnum,'미술', s_art FROM tbl_temp_score
UNION
SELECT s_stnum,'소프트웨어공학', s_sw FROM tbl_temp_score
UNION
SELECT s_stnum,'데이터베이스', s_db FROM tbl_temp_score;

CREATE TABLE tbl_score (
		s_stnum	VARCHAR(5),		
		s_subject	VARCHAR(10),		
		s_score	INT	NOT NULL,	
		PRIMARY KEY(s_stnum,s_subject)	
);        
SELECT COUNT(*) FROM tbl_score;

CREATE TABLE tbl_student (
	st_num	VARCHAR(5)	NOT NULL UNIQUE	PRIMARY KEY,
	st_name	VARCHAR(10)	NOT NULL,	
	st_dept	VARCHAR(20),		
	st_grade	VARCHAR(1),		
	st_tel	VARCHAR(13),		
	st_addr	VARCHAR(125)		
);

SELECT *
FROM tbl_student ST
	JOIN tbl_score S
		on ST.st_num = s.s_stnum
WHERE st_num = 'S0010';        

-- 성적테이블과 학생테이블간에 FK 설정
ALTER TABLE tbl_score
ADD CONSTRAINT FOREIGN KEY fk_num (s_stnum)
REFERENCES tbl_student(st_num);


