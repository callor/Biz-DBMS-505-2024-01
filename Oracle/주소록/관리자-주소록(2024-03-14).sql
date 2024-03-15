/*

TableSpace 생성
이름 : addrDB
파일 : c:/app/data/addrDB.dbf
초기크기 : 1M Byte
확장크기 : 자동확장 1K Byte
*/
CREATE TABLESPACE addrDB
DATAFILE 'c:/app/data/addrDB.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1;

/*
사용자 생성
이름 : addrUser
비번 : 12341234
기본 TableSpace : addrDB
권한 부여 : DBA
*/

ALTER SESSION SET "_ORACLE_SCRIPT" = true;

CREATE USER addrUser IDENTIFIED BY 12341234
DEFAULT TABLESPACE addrDB;

GRANT DBA TO addrUser;



