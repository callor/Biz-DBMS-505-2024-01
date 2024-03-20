-- 학생성적 데이터
USE scoreDB;
SHOW TABLES;

SELECT ST.*,SC.s_subject,SC.s_score
FROM tbl_student ST
	JOIN tbl_score SC
		ON ST.st_num = SC.s_stnum;
SELECT ST.st_num, ST.st_name, ST.st_dept, 
		SC.s_subject, SC.s_score        
FROM tbl_student ST
	JOIN tbl_score SC
		ON ST.st_num = SC.s_stnum;
        
/*
  PIVOT 테이블 view 만들기
 학생-성적 테이블을 JOIN 하여 확인을 하면
 성적테이블의 연관 데이터 개수만큼 레코드(ROW)가
 출력된다.
 일반적인 데이터 확인 하는데는 큰 문제가 없지만
 보고서 형식의 출력을 원할때는 다소 불편한 모양이 된다
 
 이럴때 키(PK)를 기준으로 1개의 레코드(ROW)만 출력되고
 연관된 데이터를 가로방향으로 나열하는 방법
*/ 
-- 일반적인 JOIN 문
SELECT ST.st_num, ST.st_name, SC.s_subject, SC.s_score
	FROM tbl_student ST
		JOIN tbl_score SC
			ON ST.st_num = SC.s_stnum
	WHERE ST.st_num = 'S0001';

-- 조건문을 이용하여 국어 점수만 확인하기
SELECT ST.st_num, ST.st_name, 
	IF(SC.s_subject = '국어', SC.s_score, 0) AS 국어 
	FROM tbl_student ST
		JOIN tbl_score SC
			ON ST.st_num = SC.s_stnum
    WHERE ST.st_num = 'S0001';
-- 위의 결과에서 국어점수는 표시가 되고, 
-- 나머지 점수는 0 으로 나타난다
-- 표시된 '국어' 칼럼의 데이터의 합계를 계산하면
-- 역시 국어 점수만 나타날 것이다
-- '국어' 칼럼의 합계를 계산하려면 
-- 전제조건이 학번, 이름을 GROUP BY 로 묶어야 한다

SELECT ST.st_num, ST.st_name, 
	SUM(IF(SC.s_subject = '국어', SC.s_score, 0)) AS 국어, 
    SUM(IF(SC.s_subject = '영어', SC.s_score, 0)) AS 영어,
    SUM(IF(SC.s_subject = '수학', SC.s_score, 0)) AS 수학,
    SUM(IF(SC.s_subject = '음악', SC.s_score, 0)) AS 음악,
    SUM(IF(SC.s_subject = '미술', SC.s_score, 0)) AS 미술,
    SUM(IF(SC.s_subject = '소프트웨어공학', SC.s_score, 0)) AS SW,
    SUM(IF(SC.s_subject = '데이터베이스', SC.s_score, 0)) AS DB
	FROM tbl_student ST
		JOIN tbl_score SC
			ON ST.st_num = SC.s_stnum
    -- WHERE ST.st_num = 'S0001'
    GROUP BY ST.st_num, ST.st_name;

/*
MySQL 통계함수
SUM() : 합계, AVG() : 평균, COUNT() : 개수
MAX() : 최대값, MIN() : 최소값

MySQL 수학합수
ROUND() 실수(float) 를 소수점 반올림하여 값 정리하기
ROUND(값, 소수자릿수), 
ROUND(3.62) : 결과는 4, ROUND(3.62,1) : 결과는 3.6
TRUNCATE() 실수(float) 를 버리기 하여 값 정리하기
TRUNCATE(3.62,0) : 결과는 3

*/
SELECT ST.st_num, ST.st_name, 
	SUM(IF(SC.s_subject = '국어', SC.s_score, 0)) AS 국어, 
    SUM(IF(SC.s_subject = '영어', SC.s_score, 0)) AS 영어,
    SUM(IF(SC.s_subject = '수학', SC.s_score, 0)) AS 수학,
    SUM(SC.s_score) AS 총점,
    ROUND(AVG(SC.s_score),1) AS 평균
	FROM tbl_student ST
		JOIN tbl_score SC
			ON ST.st_num = SC.s_stnum
    WHERE ST.st_num = 'S0001' 
    GROUP BY ST.st_num, ST.st_name;


SELECT ST.st_num, ST.st_name, 
	MAX(IF(SC.s_subject = '국어', SC.s_score, 0)) AS 국어, 
    MAX(IF(SC.s_subject = '영어', SC.s_score, 0)) AS 영어,
    MAX(IF(SC.s_subject = '수학', SC.s_score, 0)) AS 수학,
    SUM(SC.s_score) AS 총점,
    ROUND(AVG(SC.s_score),1) AS 평균
	FROM tbl_student ST
		JOIN tbl_score SC
			ON ST.st_num = SC.s_stnum
    WHERE ST.st_num = 'S0001' 
    GROUP BY ST.st_num, ST.st_name;

-- IF 명령이 없는 DBMS 에서 PIVOT 사용하기
SELECT ST.st_num, ST.st_name, 
	MAX(CASE WHEN SC.s_subject = '국어' 
			THEN SC.s_score ELSE 0 END) AS 국어, 
    MAX(CASE WHEN SC.s_subject = '영어' 
			THEN SC.s_score ELSE 0 END) AS 영어,
    MAX(CASE WHEN SC.s_subject = '수학' 
			THEN SC.s_score ELSE 0 END) AS 수학,
    SUM(SC.s_score) AS 총점,
    ROUND(AVG(SC.s_score),1) AS 평균
	FROM tbl_student ST
		JOIN tbl_score SC
			ON ST.st_num = SC.s_stnum
    WHERE ST.st_num = 'S0001' 
    GROUP BY ST.st_num, ST.st_name;

-- 전체학생 중에서
-- '국어점수'가 '60점 이상인 학생'의 
-- 총점과 평균을 계산하기
SELECT ST.st_num, 
	SUM(IF(SC.s_subject = '국어',SC.s_score,0)) AS 국어,
	SUM(SC.s_score) AS 총점,
    AVG(SC.s_score) AS 평균
	FROM tbl_student ST
		JOIN tbl_score SC
			ON ST.st_num = SC.s_stnum
	GROUP BY ST.st_num
    HAVING SUM(IF(SC.s_subject = '국어',SC.s_score,0)) >= 60
    ORDER BY ST.st_num;

-- WHERE 절에 PK 를 기준으로 조건주면 결과는 0..1 한개의 객체
-- WHERE 절에 PK 가 아닌 칼럼으로 조건을 주면
-- 결과는 0..N List(배열) type 의 데이터이다
-- List<String> type 의 데이터가 출력된다.
SELECT s_stnum FROM tbl_score
WHERE s_subject = '국어' AND s_score >= 60;

-- 위의 List<학번> 결과를 조건으로 하는 쿼리를 만들면
-- 문제의 해결 방법이 되겠다
/*
SubQuery 를 사용하여 성적테이블로 부터
국어점수가 60점 이상인 학생들의 List<학번>데이터를 찾는다
그리고 찾아진 List 를 WHERE 조건으로 하여
학생테이블의 데이터를 SELECTION 한다
그리고, JOIN 을 실행하고 GROUP BY를 실행하고
총점과 평균을 계산한다

전체 데이터를 GROUP BY 하고 
국어점수, 총점, 평균을 계산한 후
HAVING 절을 통하여 조건을 주어 원하는 결과를 찾는 것 보다
효율적인 연산이 된다
*/
SELECT ST.st_num, 
	SUM(IF(SC.s_subject = '국어',SC.s_score,0)) AS 국어,
	SUM(SC.s_score) AS 총점,
    AVG(SC.s_score) AS 평균
	FROM tbl_student ST
		JOIN tbl_score SC
			ON ST.st_num = SC.s_stnum
	WHERE ST.st_num IN (
						SELECT st_num 
                        FROM tbl_score BS
                        WHERE BS.s_subject = '국어' 
							AND BS.s_score >= 60
						)
	GROUP BY ST.st_num
    ORDER BY ST.st_num;

SELECT * FROM tbl_student
WHERE st_num = 'S0001' OR st_num = 'S0002' OR
st_num = 'S0005' OR st_num = 'S0019';

SELECT * FROM tbl_student
WHERE st_num IN ('S0001','S0002','S0005','S0019');

-- 전체학생의 국어점수 총점과 평균을 계산하시오
SELECT SUM(s_score) AS 총점,AVG(s_score) AS 평균
	FROM tbl_score
	WHERE s_subject = '국어';

SELECT 
	SUM(IF(s_subject = '국어',s_score,0)) AS 총점,
    AVG(IF(s_subject = '국어',s_score,null)) AS 평균
FROM tbl_score;    
    
-- 전체학생의 국어점수 총점, 수학점수 총점, 영어점수 총점계산
-- PIVOT 테이블로 표현하기
SELECT 
	SUM(IF(s_subject = '국어',s_score,0)) AS 국어총점,
    SUM(IF(s_subject = '수학',s_score,null)) AS 수학총점,
    SUM(IF(s_subject = '영어',s_score,null)) AS 영어총점
FROM tbl_score;    

-- 일반적인 방법으로 표현하기
SELECT s_subject AS 과목,
	SUM(s_score) 총점
    FROM tbl_score
    WHERE s_subject IN ('국어','영어','수학')
    GROUP BY s_subject;





        