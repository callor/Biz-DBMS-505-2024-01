-- iolist 작업화면
USE ecountDB;
SHOW TABLES;
DESC tbl_products;

/*
기존의 상품정보 테이블에 이미지 정보를 추가하기 위하여
칼럼을 추가하기
기존의 데이터가 있는 테이블에 새로운 칼럼을 추가하는 것은
Table 의 구조를 변경하는 것이다
실무에서 운영중인 Table의 구조를 변경하는 것은 
매우 신중해야 한다

구조를 변경하는 명령이 실행되면, 
사용중인 Table 은 Lock 이 걸리고 모든 CRUD 가 금지된다
만약 활발하게 조회 등이 발생하는 Table 의 경우
다른 Transaction의 영향으로 전체 시스템에 문제가 
발생할수 도 있다
*/ 
-- 칼럼 추가하기
ALTER TABLE tbl_products
ADD COLUMN p_image_name
VARCHAR(255);
DESC tbl_products;

-- 기존의 칼럼 삭제
ALTER TABLE tbl_products
DROP COLUMN p_image_name;

ALTER TABLE tbl_products
ADD COLUMN p_image_origin_name
VARCHAR(255);
DESC tbl_products;

SELECT * FROM tbl_products
ORDER BY p_code DESC;

SELECT * FROM tbl_products
WHERE p_name = '초코하임';

/*
LIKE 연산자
	문자열에 포함된 일부 값으로 조회하기
	SELECT 명령문중에서 가장 느린 연산
	SELECT WHERE 을 사용하면 Index 라는 것을 내부적으로 사용
	또는 여러가지 SEARCH(검색) 알고리즘을 사용하여 
    최적의 검색을 한다
    DBMS에서는 보통 이진 TREE 를 응용한 검색을 많이 사용한다
    
    하지만 LIKE 키워드가 있는 SELELCT 는 순차검색을 한다
*/
SELECT * FROM tbl_products
WHERE p_name LIKE '초코%';

-- p_name 에 초코 가 포함된 데이터들을 SELECT
SELECT * FROM tbl_products
WHERE p_name LIKE '%초코%';

-- like 연산자를 사용하여 SELECT를 실행하는데
-- 조건이 없다
SELECT * FROM tbl_products
WHERE p_name LIKE '%%';



