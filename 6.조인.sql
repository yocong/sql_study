

-- ����� ���, �̸�, �μ���ȣ, �μ��� ��ȸ
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
;


SELECT
    dept_cd,
    dept_nm
FROM tb_dept;


-- JOIN
SELECT
    tb_emp.emp_no, 
    tb_emp.emp_nm, 
    tb_dept.dept_cd,
    tb_dept.dept_nm
FROM tb_emp, tb_dept
WHERE tb_emp.dept_cd = tb_dept.dept_cd -- �μ��ڵ尡 ��ġ�ϴ� �͸� ����
; 



-- ���� ���� �׽�Ʈ ������
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, '������', 1);
INSERT INTO TEST_B  VALUES (2, '������', 1);
INSERT INTO TEST_B  VALUES (3, '������', 2);
INSERT INTO TEST_B  VALUES (4, '������', 3);

SELECT * FROM test_a;
SELECT * FROM test_b;

-- ������ ������ ���ϱ⿬��
-- Cartesian production : product����
-- Cross Join : ������ ��� ����� ���� ��Ī�Ͽ� ��ȸ


-- INNER JOIN
-- �� ���̺� ���� �����÷��� �̿��Ͽ�
-- ���谡 �ִ� �����͸� ��Ī�Ͽ� ����
SELECT
    *
FROM test_a, test_b
WHERE test_a.id = test_b.a_id
;


SELECT
    E.emp_no,
    E.emp_nm,
    E.addr,
    D.dept_cd,
    D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd -- �μ��ڵ尡 ��ġ�ϴ� �͸� ����
; 

-- ����� �����ȣ�� ������ ����� �ڰ������� ��ȸ
SELECT
    E.emp_no,
    E.emp_nm,
    EC.certi_cd,
    EC.acqu_de,
    c.certi_nm
FROM tb_emp E, tb_emp_certi EC, tb_certi C
WHERE E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
;


-- ����� �����ȣ�� ������ ����� �ڰ�����, �μ����� ��ȸ
SELECT
    E.emp_no,
    E.emp_nm,
    D.dept_nm,
    EC.certi_cd,
    c.certi_nm,
    EC.acqu_de
FROM tb_emp E, tb_emp_certi EC, tb_certi C, tb_dept D
WHERE E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
    AND E.dept_cd = D.dept_cd
;

-- �μ����� �� �ڰ��� ��� ������ ��ȸ
SELECT
    D.dept_cd,
    D.dept_nm,
    COUNT(EC.certi_cd)
FROM tb_dept D, tb_emp_certi EC, tb_emp E
WHERE E.dept_cd = D.dept_cd
    AND E.emp_no = EC.emp_no
GROUP BY D.dept_cd, D.dept_nm -- code�� name�� 1��1��Ī �Ǿ���ϱ� ������ �׷���
ORDER BY D.dept_cd
;

-- # INNER JOIN
-- 1. 2�� �̻��� ���̺��� ����� �÷��� ���� �������� ���յǴ� ���α���Դϴ�.
? 2. WHERE���� ���� �÷����� �������(=)�� ���� ���ε˴ϴ�.

? ���νÿ� ��� ����� �����ȣ, �����, �ּ�, �μ��ڵ�, �μ����� ��ȸ�ϰ� �ʹ�.

SELECT
    E.emp_no,
    E.emp_nm,
    E.addr,
    E.dept_cd,
    D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.addr LIKE '%����%'
    AND E.dept_cd = D.dept_cd
    AND E.emp_nm LIKE '��%'
;


-- JOIN ON (ANSI ǥ�� ����)
-- 1. FROM�� ��, WHERE �� ��
-- 2. JOIN Ű���� �ڿ��� ������ ���̺���� ���
-- 3. ON Ű���� �ڿ��� ���� ������ ���
-- 4. ���� ���� ������(ON��) �Ϲ� ���� ������ (WHERE��)�� �и��ؼ� �ۼ��ϴ� ���
-- 5. ON���� �̿��ϸ� JOIN ������ �������̳� ���������� ���� �߰� ������ ����

SELECT
    E.emp_no,
    E.emp_nm,
    E.addr,
    E.dept_cd,
    D.dept_nm
FROM tb_emp E JOIN tb_dept D -- JOIN�� ���� �տ� INNER ����
ON E.dept_cd = D.dept_cd -- join ����
WHERE E.addr LIKE '%����%' -- �Ϲ� ����
    AND E.emp_nm LIKE '��%'
;


SELECT
    E.emp_no,
    E.emp_nm,
    D.dept_nm,
    EC.certi_cd,
    c.certi_nm,
    EC.acqu_de
FROM tb_emp E
JOIN tb_emp_certi EC
ON E.emp_no = EC.emp_no
JOIN tb_ce rti C
ON EC.certi_cd = C.certi_cd
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
WHERE E.dept_cd IN (100004, 100006)
    AND EC.acqu_de >= '20180101'
;


-- 1980���� ������� ���, �����, �μ���,
-- �ڰ�����, ������� ��ȸ
SELECT
    E.emp_no ���,
    D.dept_nm �μ���,
    C.certi_nm �ڰ�����,
    EC.acqu_de �������
FROM tb_emp E
INNER JOIN tb_dept D
ON E.dept_cd = D.dept_cd
INNER JOIN tb_emp_certi EC
ON E.emp_no = EC.emp_no
INNER JOIN tb_certi C
ON C.certi_cd = EC.certi_cd
WHERE E.birth_de BETWEEN '19800101' AND '19891231'
;

-- INNER ������ �� ���̺� ����
-- ���������Ͱ� �ִ� ��쿡�� ���
-- � ���θ�ȸ���� �� �ǵ� �ֹ����� ���� ���
-- INNER JOIN������ �ش� ȸ���� ��ȸ���� ����


-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];


-- ���� ������ �Ȱɸ� ī�׽þ� ���� �������
-- = CROSS JOIN
SELECT
    *
FROM test_a, test_b
;

-- �� �ڵ�� ����
SELECT
    *
FROM test_a
CROSS JOIN test_b
;


-- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ����� ���������� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �� �� ���εǴ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ�, 
--    ALIAS�� ���̺���� �ڵ� ���� �÷� �տ� ǥ���ϸ� �ȵ˴ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷��� ���տ��� �ѹ��� ǥ��˴ϴ�.
-- 5. ���� �÷��� n�� �̻��̸� ���� ������ n���� ó���˴ϴ�.

-- ��� ���̺�� �μ� ���̺��� ���� (���, �����, �μ��ڵ�, �μ���)
SELECT 
    A.emp_no, A.emp_nm, B.dept_cd, B.dept_nm
--    *
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

-- ����� �κ��� �˾Ƽ� ã���ְ� �ѹ��� ǥ��
SELECT 
    A.emp_no, A.emp_nm, dept_cd, B.dept_nm
--    *
FROM tb_emp A
NATURAL JOIN tb_dept B -- ON���� �˾Ƽ� ã���� (����� �κ�
;


-- ����� �κ��� ������ �̸��� �ƴϱ� ������ NATURAL JOIN �Ұ�
SELECT 
    *
FROM test_a A
NATURAL JOIN test_b B
;



-- # USING�� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� Ÿ���� ��ġ�ϴ� ��� �÷��� ����
?    ������ �Ͼ���� USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ������ ���������� 
?    �ο��� �� �ֽ��ϴ�.
? 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ǥ���Ͻø� �ȵ˴ϴ�.
SELECT 
   A.emp_no, A.emp_nm, dept_cd, B.dept_nm
FROM tb_emp A
NATURAL JOIN tb_dept B
;

SELECT 
   A.emp_no, A.emp_nm, B.dept_cd, B.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;


SELECT 
   A.emp_no, A.emp_nm, dept_cd, B.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
USING (dept_cd)
;