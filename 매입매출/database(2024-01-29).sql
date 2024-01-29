-- 매입매출관리
USE ecountDB;
SHOW TABLES;
DESC tbl_iolist;
SELECT * FROM tbl_iolist;

-- TABLE 의 전체 레코드개수 확인
SELECT COUNT(*) FROM tbl_iolist;

-- io_div(매입매출구분) 별로 레코드 개수 확인
SELECT io_div,COUNT(io_div)
FROM tbl_iolist
GROUP BY io_div;

-- io_div(구분) 별로 매입금액 합산, 매출금액 합산
SELECT io_div,
SUM(io_quan * io_iprice) AS 매입합계,
SUM(io_quan * io_oprice) AS 매출합계
FROM tbl_iolist
GROUP BY io_div;

SELECT 
SUM(io_quan * io_iprice) AS 매입합계,
SUM(io_quan * io_oprice) AS 매출합계
FROM tbl_iolist;

/*
SQL 통계함수
개수세기, 합산하기, 평균내기
최대값, 최소값
*/

-- IF(조건, 참일때, 참이 아닐때)
-- Table 에 저장된 값이 명확히 구분이 어려울때
-- 출력 결과를 명확히 하고자 할때 사용
SELECT 
IF(io_div = '1','매입','매출') AS 구분,
SUM(io_quan * io_iprice) AS 매입합계,
SUM(io_quan * io_oprice) AS 매출합계
FROM tbl_iolist
GROUP BY io_div;

SELECT * 
FROM tbl_iolist;
/*
데이터베이스 정규화
	RDBMS(관계형데이터베이스 관리 시스템)에서
		Relation DataBase Management System
	데이터의 중복을 최소하고, 
    데이터를 구조화 하는 것   
    
정규화 목표 : 이상(문제점)이 있는 관계를 재구성 하고
	잘 조직된 관계를 생성하는 것이다
    
데이터의 이상(문제점 보다는 다소 약한)현상    
삽입(추가)이상
	데이터를 추가할때 추가할 항목이 많아서
    일부 항목이 누락되는 현상
    일부 항목의 값이 잘못 입력되는 현상
수정이상
	데이터를 변경(수정)할때 일부 데이터가
    수정되지 않거나, 또는 수정되어서는 안되는 데이터가
    변경되는 현상
삭제이상
	데이터를 삭제할때 일부데이터가 삭제 되지 않거나
	삭제되어서는 안되는 데이터가 삭제되는 현상
수정, 삭제 이상은 PK 가 아닌 다른 칼럼을 조건으로
	하여 실행하는 과정에서 발생한다

목적 : 
	이러한 이상(삽입, 수정, 삭제) 현상을 방지하기 위하여 
	정규화를 실행한다    
*/

-- 매입매출 Table 에서 "상품정보"와 "거래처정보"를
-- 분리하여 Table 을 구조화 하는 것
-- 상품정보를 Table 로 별도 분리하기
-- 1. 매입매출 Table 에서 상품명을 중복없이 추출하기
SELECT io_pname,
ROUND(AVG(io_iprice),0) AS 매입단가,
ROUND(AVG(io_oprice),0) AS 매출단가
FROM tbl_iolist
GROUP BY io_pname
ORDER BY io_pname;

-- 2. 매입매출 테이블의 상품명 칼럼 대신, 
-- 상품코드 칼럼으로 대체
-- 기존의 테이블을 삭제하고, 새로 작성
DROP TABLE tbl_iolist;
CREATE TABLE tbl_iolist (
	io_seq	BIGINT		PRIMARY KEY,
	io_date	VARCHAR(10)		NOT NULL,
	io_time	VARCHAR(10)		NOT NULL,
	io_pcode	VARCHAR(6)		NOT NULL,
	io_dname	VARCHAR(125)		NOT NULL,
	io_dceo	VARCHAR(10),		
	io_div	VARCHAR(1),		
	io_quan	INT,		
	io_iprice	INT,		
	io_oprice	INT		
);
DESC tbl_iolist;

-- 3 상품 테이블 생성하기
CREATE TABLE tbl_products (
	p_code	VARCHAR(6)		PRIMARY KEY,
	p_name	VARCHAR(50)	NOT NULL,	
	p_item	VARCHAR(20),		
	p_std	VARCHAR(20),		
	p_comp	VARCHAR(50),		
	p_iprice	INT,		
	p_oprice	INT		
);

-- 4. import 된 데이터 확인하기
SELECT COUNT(*) FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_products;
SELECT * FROM tbl_products;

-- 5. 정규화가 된 매입매출데이터 확인하기
SELECT * FROM tbl_iolist LIMIT 10;
-- 매입매출데이터에는 실제 보고자 하는 상품이름은 없고
-- 상품코드 칼럼만 있는 상태이다
-- 이 데이터에서 매입매출데이터와 상품데이터를 "JOIN"하여
-- 확인하기
SELECT *
FROM tbl_iolist, tbl_products
WHERE io_pcode = p_code;

-- tbl_iolist 와 tbl_products 테이블을 join
-- Projection 하기
SELECT io_date, io_time,
io_pcode, p_name, io_div, io_iprice, io_oprice
FROM tbl_iolist, tbl_products
WHERE io_pcode = p_code;


