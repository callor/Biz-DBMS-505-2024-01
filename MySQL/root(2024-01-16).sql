/*
 DB Handling
 SQL 명령을 통해서 DBMS의 storage 에 저장된 데이터에
 접근하여 여러가지 연산을 수행하는 것
 */
 -- 저장소(Scheme, Schema)를 설계, 생성
 -- 저장소를 기준으로 데이터를 추가, 수정, 삭제, 조회
 -- DDL(Data Definition Lang. 데이터 정의의)
 -- 저장소를 생성, 삭제, 변경 하는 명령어 체계
 -- DDL 명령의 생성하는 명령어는 "CREATE" 키워드로 시작
 -- CREATE DATABASE, CREATE TABLE, CREATE USER
 -- 물리적 저장소인 내부 Schema 생성하기 : schoolDB
 CREATE DATABASE schoolDB;
 
 -- Database open(물리적 저장소 열기)
 USE schoolDB;
 
 -- 실제 데이터를 저장할(보관할) Table 을 생성
 CREATE TABLE tbl_student (
	st_num	VARCHAR(5) PRIMARY KEY,
	st_name	VARCHAR(10)	NOT NULL,	
	st_dept	VARCHAR(20)	NOT NULL,	
	st_grade	VARCHAR(1),		
	st_tel	VARCHAR(13),		
	st_addr	VARCHAR(125)		
 );
 /*
 데이터베이스 무결성 제약 조건 설정하기
 
 PRIMARY KEY
 NOT NULL 이면서 UNIQUE 한 성질을 부여하기
 절대 공백이 없고, 중복된 데이터가 없어야 한다
 == 객체무결성 설정
 
 NOT NULL
 절대 공백인 데이터가 없어야 한다.
 불필요한 공백인 데이터가 저장되어 있으면
 그 데이터는 공간을 낭비할 뿐이다
 
 UNIQUE
 중복된 데이터가 없다
*/
-- 데이터를 CRUD 를 실행하자
-- 새로운(Table 에 없는 없는데이터)를 
-- Table 에 추가하기
-- INSERT INTO [table] ([columns]) VALUES (값들)
INSERT INTO 
tbl_student(
	st_num, st_name, st_dept, st_grade, st_tel, st_addr
) VALUES (
	'S0001','갈한수',
	'기계공학과','2','090-4407-3262',
	'경북 경산시 사정동 278-1' );
    
INSERT INTO
tbl_student(st_num,st_name,st_dept)
VALUES('S0002','강이찬','유전공학과');

-- 필수항목(PK)인 st_num 의 데이터가 준비되지 않아
-- 데이터 추가 실패
INSERT INTO
tbl_student(st_name,st_dept)
VALUES('개원훈','기계공학과');

-- 필수항목(NOT NULL)인 st_name 의 데이터가 준비되지 않아
-- 데이터 추가 실패
INSERT INTO
tbl_student(st_num,st_dept)
VALUES('S0003','기계공학과');

-- 필수항목(NOT NULL)인 st_dept 의 데이터가 준비되지 않아
-- 데이터 추가 실패
INSERT INTO
tbl_student(st_num,st_name)
VALUES('S0003','개원훈');
 
-- 필수항목 3가지의 데이터가 준비되어
-- 추가 성공
INSERT INTO
tbl_student(st_num,st_name,st_dept)
VALUES('S0003','개원훈','기계공학과');

-- 테이블에 추가되어(저장되어, 보관되어) 있는 데이터를
-- 조회하기(Manufulation, Read)
-- SELECT (columns) FROM [table]
SELECT *
FROM tbl_student;

-- projection 설정하기
-- tbl_student 테이블에서 모든 데이터를 가져오는데
-- st_num, st_name, st_dept 칼럼의 데이터만 선택적으로
-- 보고 싶다
SELECT st_num, st_name, st_dept
FROM tbl_student;

SELECT st_name, st_num, st_dept, st_grade
FROM tbl_student;

-- SELECTION
-- 어떤 조건을 부여하여 조건에 맞는 데이터들만
-- 확인하고 싶을때
-- 이때 WHERE 절에 조건문을 부여하여 조회를 한다
SELECT st_num, st_name, st_dept
FROM tbl_student
WHERE st_name = '갈한수';

-- SELECTION, PROJECTION 을 동시에 적용한 명령문
-- SELECTION 조건을 PK 칼럼을 기준으로 적용
-- 결과는 0 또는 1개의 데이터
SELECT st_num, st_name, st_dept
FROM tbl_student
WHERE st_num = 'S0001';

----------
SELECT * FROM tbl_student;
-- 데이터 변경하기
-- 이미 추가된(Insert 된)데이터의 특정 칼럼의 값을
-- 변경하는 것, Update
-- Update 명령을 잘못 입력하고, 실행을 하면
-- 재앙이 올수 있다.
-- UPDATE 명령에 WHERE 조건절이 생략되면
-- TABLE에 있는 모든 데이터가 변경되버린다
-- 그래서 반드시 UPDATE 명령은 WHERE 조건절이 필수이다

-- st_name 에 조건을 부여하여 UPDATE 를 실행하고 있다
-- st_name 칼럼은 데이터가 중복될수 있다(동명이인있다)
-- 때문에 아래와 같은 코드도 문제를 일으킬 소지가 매우
-- 많다
UPDATE tbl_student
SET st_grade = 3
WHERE st_name ='강이찬';

-- UPDATE 순서
-- 1. Update 할 조건의 데이터를 SELECT 한다
-- 2. SELECT 된 데이터 목록중에서 Update 할 데이텅의
-- PK 값을 확인한다.
-- 3. PK 칼럼을 기준으로 Update 를 실행한다
SELECT * FROM tbl_student 
WHERE st_name = '강이찬';
UPDATE tbl_student 
SET st_grade = '3'
WHERE st_num = 'S0002';

SELECT * FROM tbl_student;
-- 불필요한 데이터 삭제하기
-- DELETE FROM [table] WHERE 조건

/*
DML(Data Manipulation Lang. 데이터 조작어, 데이터 관리어) 
이미 존재하는 DB, Table 에 새로운 데이터를
추가(Create, INSERT INTO)
읽기(React, SELECT FROM, 조회, 찾기)
변경(Update, UPDATE SET WHERE)
삭제(Delete, DELETE FROM WHERE)
하는 명령어 집합
*/


SELECT * FROM tbl_student;



 
 