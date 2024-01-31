-- 매입매출
DROP DATABASE edb;
CREATE DATABASE edb;
USE edb;
SHOW TABLES;

DESC tbl_iolist;

-- 정의된 FK 를 삭제하기
ALTER TABLE tbl_iolist
DROP FOREIGN KEY tbl_iolist_ibfk_2;

-- FK 정의
-- Table 간의 참조무결성관계를 설정하기
-- 1:N 관계의 table 에서 N 의 위치에 있는 Table 에 선언
ALTER TABLE tbl_iolist
ADD CONSTRAINT FK_PCODE
FOREIGN KEY (io_pcode)
REFERENCES tbl_products(p_code);

ALTER TABLE tbl_iolist
ADD CONSTRAINT FK_DCODE
FOREIGN KEY (io_dcode)
REFERENCES tbl_depts(d_code);





