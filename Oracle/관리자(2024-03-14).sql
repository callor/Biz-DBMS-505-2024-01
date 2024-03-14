-- 여기는 관리자 화면입니다

/*
오라클에서는 데이터저장소를 TableSpace 라고 한다
TableSpace 는 로컬스토리지에 파일형식으로 생성을 하며
이 TableSpace 에 Table 등 객체, 데이터를 저장한다

오라클 DB 를 사용할때 제일먼저 할일이 관리자로 접속하여
TableSpace를 만드는 일이다

프로그램등에서 
오라클 DB를 접속할때는 SYS, SYSTEM 등 시스템과 관련된 id 는 절대 사용하지 말자
관리자 화면에서 사용자를 생성하고, 사용자의 권한을 부여하여 접속을 한다

오라클에서 사용자는 SCHEMA 개념을 갖는다
사용자로 로그인을 하면, 별도의 Database 를 접속, 연결(USE)를 하지 않는다
*/

-- myDB 라는 TableSpace 를 만들어라
-- 물리적 저장소는 c:/app/data/myDB.dbf 라는 파일로 만들어라
-- 초기 크기는 1M Byte 저장소를 설정하고
-- 만약 저장소 크기가 부족하면 1K Byte 씩 자동으로 확장하라
CREATE TABLESPACE myDB
DATAFILE 'c:/app/data/myDB.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- myDB TableSpace를 삭제하라
-- 삭제할때 모든 내용, 파일, 제약조건 등을 함께 깨끗하게 삭제하라
DROP TABLESPACE myDB
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

-- oracld 12c 이상에서 사용자를 생성하는 방법
-- 사용자 이름 앞에 반드시 C##
CREATE USER C##user1 IDENTIFIED BY 12341234
DEFAULT TABLESPACE myDB;

/*
Oracle 12c 이상 버전에서 보안, 계정 정책이 변경되어
사용자의 이름 앞에 C## 를 부착해야하는 규정이 생겼다
사용자를 생성할때마다 불편함을 가지게 된다

특별하게 명령을 수행하면 이전 방법으로 사용자 생성을 할수 있도록 했다
*/
-- 오라클 12c 이전의 표준 SQL 명령으로 사용자 생성을 할수 있도록하는 명령
-- 사용자생성을 하기전에 항상 실행해야 한다
ALTER SESSION SET "_ORACLE_SCRIPT" = true;

CREATE USER user1 IDENTIFIED BY 12341234
DEFAULT TABLESPACE myDB;

/*
사용자 생성 후 권한 부여
새로운 사용자를 생성하면 아무런 권한이 없다.
심지 로그인을 할수 있는 권한도 없는 상태이다
사용자에게 부여하는 권하는 표준화(조직내에서) 된 정책을 수립하고
그 정책에 따라 세부적으로 권한을 부여하는 것이 좋다
*/
-- 로그인을 할수 있는 권한 부여
GRANT CREATE SESSION TO user1;
-- 로그인 권한을 회수
REVOKE CREATE SESSION FROM user1;

-- 관리자(sys) 권한으로 user1 SCHEMA 에 임시 테이블 생성
CREATE TABLE user1.tbl_user (
    sq NUMBER,
    username VARCHAR2(125),
    nickname nVARCHAR2(125)
);

-- user1 에게 tbl_user 테이블의 CRUD 를 구현할수 있는 권한 부여하기
GRANT SELECT ON user1.tbl_user TO user1;
GRANT UPDATE ON user1.tbl_user TO user1;
GRANT INSERT ON user1.tbl_user TO user1;
GRANT DELETE ON user1.tbl_user TO user1;

-- user1 에 새로운 테이블을 생성, 삭제, 변경 하는 권한을 부여하기
GRANT CREATE ANY TABLE TO user1;
GRANT DROP ANY TABLE TO user1;
GRANT ALTER ANY TABLE TO user1;

-- 원칙은 세부적으로 권한을 부여해야 하지만
-- 학습적 목적에서 세부적인 권한을 일일이 부여하는 것은 불편한 상황이다
-- 오라클 DB 학습에서는 DBA 라는 권한을 새로 생성한 사용자에게 부여한다
-- 오라클에서 DBA 는 SYSDBA 보다 다소 등급이 낮은 권한이다
-- 하지만 DBA 권한을 부여하면 DDL, DML, DCL 모든 명령을 수행할수 있다
-- 실무에서는 DBA 권한을 함부로 부여하면 안된다.
GRANT DBA TO user1;






