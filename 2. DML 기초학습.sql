CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    reg_date DATE
);

-- INSERT
-- 날짜를 넣을 때는 숫자로 넣으면 안됨
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (1, '선풍기', 120000, SYSDATE);
    

INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (2, '세탁기', 2000000, SYSDATE);


INSERT INTO goods
    (id, goods_name, reg_date)
VALUES
    (3, '달고나', SYSDATE);
    
    
INSERT INTO goods
    (id, goods_name)
VALUES
    (4, '계란');


-- 순서가 뒤바뀌어도 VALUES와 순서만 맞춰주면 문제 x
-- price, 암묵적 형변환 O
INSERT INTO goods
    (goods_name, id, reg_date, price)
VALUES
    ('점퍼', 5, SYSDATE, '49000');

-- 컬럼명 생략시 테이블구조 순서대로 자동 기입
INSERT INTO goods
    
VALUES
    (6, '냉장고', 1000000, SYSDATE);
    
    
    
-- UPDATE
UPDATE goods
SET goods_name = '에어컨'
WHERE id = 1
;
    
UPDATE goods
SET price = 9999;
    
    
UPDATE goods
SET id = 11
WHERE id = 4;


UPDATE goods
SET price = null
WHERE id = 3;


UPDATE goods
SET goods_name = '청바지',
    price = 299000
WHERE id = 3;


-- DELETE
-- 조건 없이 delete하면 전체삭제
-- 다만 이 문법은 복구가 가능함
DELETE FROM goods
WHERE id = 11;


TRUNCATE TABLE goods; -- 복구 불가
DROP TABLE goods; -- 복구 불가 + 테이블까지 삭제

SELECT * FROM goods;


-- SELECT 기본
SELECT
    certi_cd,
    certi_nm,
    issue_insti_nm
FROM tb_certi;


-- 컬럼 순서 바뀌어도 상관 X
SELECT
    certi_nm,
    certi_cd,
    issue_insti_nm
FROM tb_certi;


-- DISTINCT: 중복제거
SELECT DISTINCT
    issue_insti_nm
FROM tb_certi;


-- 모든 컬럼 조회
SELECT
    *
FROM tb_certi;


-- 열 별칭 부여
-- AS "별칭" 인데 AS, "" 생략가능, 띄어쓰기 있으면 ""필요
SELECT
    emp_nm 사원명,
    addr "거주지 주소"
FROM tb_emp;


-- 문자열 결합: ||
SELECT
    '자격증: ' || certi_nm AS "자격증 정보"
FROM tb_certi;


SELECT
    certi_nm || ' (' || issue_insti_nm || ')'
FROM tb_certi;