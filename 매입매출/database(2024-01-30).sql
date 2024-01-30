-- 매입매출
/*
MySQL DataBase Dump 하기
=> Database Schema 를 통째로 파일로 백업하기
다른 DB 에서 사용하거나
DB를 새로 설치할 경우 사전에 기존의 사용하던 DB 를
백업하기
	메뉴의 Server / Data Export 를 선택하고
	백업할 Database 와 폴더를 선택한다
복원하기
	기존의 Database Schema 가 없으면
	복원할 Database Schema 를 생성
    메뉴의 Server / Data Import 를 선택하여
    백업파일이 저장된 폴더를 선택한다
    백업할때의 Databas Schema 와 같은 이름으로
    Database 를 생성해 둔다
*/
DROP DATABASE ecountDB;
CREATE DATABASE ecountDB;
