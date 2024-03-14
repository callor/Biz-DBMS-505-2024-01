-- addrUser 화면
/*
주소록 테이블명세를 보고
tbl_address 테이블을 생셩하시오
*/

CREATE TABLE tbl_address (
    a_code	VARCHAR2(6)		PRIMARY KEY,
    a_name	nVARCHAR2(20)	NOT NULL,	
    a_tel	VARCHAR2(15)	NOT NULL,	
    a_addr	nVARCHAR2(125),		
    a_hobby1	nVARCHAR2(20),		
    a_hobby2	nVARCHAR2(20),		
    a_hobby3	nVARCHAR2(20)		
);

SELECT COUNT(*) FROM tbl_address;
SELECT * FROM tbl_address;

-- 이름순으로 오름차순 정렬하여 SELECT 하기
SELECT * FROM tbl_address
ORDER BY a_name ;

-- 이름, 전화번호, 취미1 칼럼만 나타나도록 Projection 실행
SELECT a_name, a_tel, a_hobby1
FROM tbl_address;

-- 이름 칼럼에 민 이란 단어가 포함된 리스트만 SELECTION 실행
SELECT * FROM tbl_address
WHERE a_name LIKE '%민%'
ORDER BY a_name;

-- 취미1 의 각 취미별 인원수를 계산하기
SELECT a_hobby3, count(a_hobby3)
FROM tbl_address
GROUP BY a_hobby3
ORDER BY COUNT(a_hobby3) DESC;

-- 주소록 테이블에는 취미1, 취미2, 취미3 이 있다
-- 여행이 취미인 사람 리스트를 출력하기
SELECT * FROM tbl_address
WHERE a_hobby1 =  '여행' OR a_hobby2 = '여행' OR a_hobby3 = '여행';


SELECT * FROM
(
    SELECT a_hobby1 AS 취미 FROM tbl_address WHERE a_hobby1 IS NOT NULL GROUP BY a_hobby1
    UNION
    SELECT a_hobby2 FROM tbl_address WHERE a_hobby2 IS NOT NULL GROUP BY a_hobby2
    UNION
    SELECT a_hobby3 FROM tbl_address WHERE a_hobby3 IS NOT NULL GROUP BY a_hobby3
)
ORDER BY 취미


