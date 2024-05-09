
 
-- 트랜잭션
CREATE TABLE student(
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
)
;

INSERT INTO student VALUES (1, '김철수', 15);
INSERT INTO student VALUES (2, '홍길동', 16);

SELECT * FROM student;

COMMIT; -- 영구적인 반영 (DB에 저장)

INSERT INTO student VALUES (3, '도우너', 12);

ROLLBACK; -- COMMIT 안한 것들 취소

-- 계좌 이체
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '김철수';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '박영희';

COMMIT;

DELETE FROM student;
ROLLBACK;

SELECT * FROM student;
TRUNCATE TABLE student;