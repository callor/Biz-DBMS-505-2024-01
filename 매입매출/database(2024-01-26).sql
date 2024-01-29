-- 매입매출관리
CREATE DATABASE ecountDB;
USE ecountDB;
/*
AUTO_INCREMENT
PRIMARY KEY이고, 정수형인 칼럼에 설정하는 키워드
데이터를 INSERT 할때 이 칼럼은 데이터를 포함하지 않는다
그러면 자동으로 UNIQUE 한 일련번호를 만들어 준다
*/
CREATE TABLE tbl_iolist (
	io_seq	BIGINT PRIMARY KEY AUTO_INCREMENT,
	io_date	VARCHAR(10) NOT NULL,
	io_time	VARCHAR(10) NOT NULL,
	io_pname VARCHAR(50) NOT NULL,
	io_dname VARCHAR(125) NOT NULL,
	io_dceo	VARCHAR(10),		
	io_div VARCHAR(1),		
	io_quan	INT,		
	io_iprice INT,		
	io_oprice INT		
);

INSERT INTO tbl_iolist(
io_date,io_time,io_pname,
io_dname,io_dceo,io_div,io_quan,
io_iprice,io_oprice
)
VALUES
("2023-01-03","10:00:48","버터링","강릉농협하나로마트정동점","강시우","1","62","655","0"),
("2023-01-03","10:03:29","브라우니","강원양돈농협성덕하나로마트","갈성원","2","68","0","1000"),
("2023-01-03","10:08:14","브라우니","삼척농협하나로마트미로점","경동율","2","95","0","1000"),
("2023-01-03","10:13:37","심플(갑)","토성농협하나로마트본점","강이찬","2","61","0","2300"),
("2023-01-05","10:25:49","연양갱","동해삼척태백축협하나로마트제2판매장","견장혁","2","56","0","500"),
("2023-01-06","10:27:18","(신)허쉬드링크","원덕농협하나로마트본점","개성현","2","60","0","800"),
("2023-01-06","10:29:38","(신)허쉬드링크","동해삼척태백축협하나로마트본점","견준상","2","55","0","800"),
("2023-01-07","10:32:30","인디고","강원양돈농협 본점하나로마트","간채민","1","95","1844","0"),
("2023-01-08","10:37:12","(신)허쉬드링크","북강릉농협하나로마트연곡점","강연호","1","76","393","0"),
("2023-01-09","10:40:24","순두유230ml","동해삼척태백축협하나로마트본점","견준상","1","89","614","0");

-- tbl_iolist 테이블에 저장된 데이터의 개수가 몇개
-- 데이터의 레코드수가 몇개
SELECT COUNT(io_seq) 
FROM tbl_iolist;

SELECT * 
FROM tbl_iolist;

-- LIMIT 원한는 개수의 레코드만 보고싶을때
SELECT * 
FROM tbl_iolist LIMIT 3;

-- OFFSET : 건너뛰기
-- 처음부터 15개의 레코드를 건너뛰고
-- 5개의 레코드만 보여주기
-- Pagination 에서 사용하는 코드
SELECT *
FROM tbl_iolist LIMIT 5 OFFSET 15;

/*
2023년 02월 01 이전의 데이터만 보여주기
io_date 칼럼은 문자열형 데이터 이지만
SQL 에서는 숫자값처럼 부등호를 사용하여
범위를 지정할수 있다.
단 자릿수가 같아야 된다
*/
SELECT *
FROM tbl_iolist
WHERE io_date < "2023-02-01" ;

SELECT *
FROM tbl_iolist
WHERE io_date >= "2023-02-01" AND
		io_date < "2023-03-01";

-- 시작이상 종료이하의 범위는 BETWEEN 키워드를
-- 사용하여 검사한다        
SELECT * 
FROM tbl_iolist
WHERE io_date BETWEEN '2023-02-01' AND '2023-02-29';

SELECT *
FROM tbl_iolist
WHERE io_date = '2023-02-25' 
		OR io_date = '2023-02-10'
        OR io_date = '2023-03-07';
        
-- 거래구분(io_div)이 2 이고
-- 거래수량(io_quan)이 50개 이하인 
-- 데이터만 SELECTION
SELECT *
FROM tbl_iolist
WHERE io_div = '2' AND io_quan <= 50;

-- 계산식의 결과로 확인하기
SELECT 
	io_quan * io_iprice, 
	io_quan * io_oprice
FROM tbl_iolist;

-- 계산식에 별명(Alias) 붙이기
SELECT
	io_pname AS 상품명,
	io_quan * io_iprice AS 매입합계,
    io_quan * io_oprice AS 매출합계
FROM tbl_iolist;    

/*
상품명(io_pname)이 같은 값끼리 GROUP 을 만들어가
그리고 같은 GROUP 내에서 합산하여 결과를 보여라
*/
SELECT
	io_pname AS 상품명,
	SUM(io_quan * io_iprice) AS 매입합계,
    SUM(io_quan * io_oprice) AS 매출합계
FROM tbl_iolist
GROUP BY io_pname;

-- 상품별로 몇번 거래가 이루워졌는가?
-- 상품명으로 GROUP 을 만들고
-- GROUP 내부에서 개수를 세어서 보여라
SELECT io_pname AS 상품명,
	COUNT(io_pname) AS 횟수
FROM tbl_iolist
GROUP BY io_pname;

-- 상품별로 매입 매출이 각각 몇번씩 이루어졌나?
-- 상품명으로 GROUP 을 설정하고
-- 같은 상품중에서 거래구분으로 분리하여 GROUP 설정
-- 그리고 그 GROUP 에서 개수를 세어서 보여라
SELECT io_pname AS 상품명,
	io_div AS 거래구분,
    COUNT(io_pname) AS 횟수
FROM tbl_iolist
GROUP BY io_pname, io_div
ORDER BY io_pname;

        








