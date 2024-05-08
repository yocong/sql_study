

-- ����� first_name, employee_id, department_id, dept_name
SELECT
    E.employee_id,
    E.first_name,
    department_id,
    D.department_name
FROM employees E
NATURAL JOIN departments D
ORDER BY E.employee_id
;


SELECT
    E.employee_id,
    E.first_name,
    E.department_id,
    D.department_name
FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
    AND E.manager_id = D.manager_id
ORDER BY E.employee_id
;




-- 1. employees���̺�� departments���̺��� inner join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    E.employee_id ���,
    E.department_id �μ��ڵ�,
    E.first_name �̸�,
    E.last_name ��,
    D.department_name �μ���
FROM employees E 
JOIN departments D
ON E.department_id = D.department_id
;

-- 2. employees���̺�� departments���̺��� natural join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    E.employee_id ���,
    department_id �μ��ڵ�,
    E.first_name �̸�,
    E.last_name ��,
    D.department_name �μ���
FROM employees E 
NATURAL JOIN departments D
;



-- 3. employees���̺�� departments���̺��� using���� ����Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    E.employee_id ���,
    department_id �μ��ڵ�,
    E.first_name �̸�,
    E.last_name ��,
    D.department_name �μ���
FROM employees E 
JOIN departments D
USING (department_id)
;

-- 4. employees���̺�� departments���̺�� locations ���̺��� 
--    join�Ͽ� employee_id, first_name, department_name, city�� ��ȸ�ϼ���
SELECT
    E.employee_id ���,
    E.department_id �μ��ڵ�,
    E.first_name �̸�,
    D.department_name �μ���,
    L.city ����
FROM employees E 
JOIN departments D
ON E.department_id = D.department_id
JOIN locations L
ON D.location_id = L.location_id
;

-- 5. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
-- ����� first_name, last_name, job_title�� ��ȸ�ϼ���.
SELECT
    E.first_name �̸�,
    E.last_name ��,
    J.job_title 
FROM employees E
JOIN jobs J
ON e.job_id = j.job_id
;

-- 6. employees ���̺�� departments ���̺��� INNER JOIN�Ͽ� 
-- �μ���� �� �μ��� �ִ� �޿����� ��ȸ�ϼ���.
SELECT 
    D.department_name �μ���,
    MAX(E.salary) �ִ�޿�
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
GROUP BY D.department_name
;
-- 7. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
--    ������ ��� �޿��� ���� Ÿ��Ʋ�� ��ȸ�ϼ���.
SELECT 
    E.job_id,
    J.job_title,
    AVG(E.salary)
FROM employees E, jobs J
WHERE E.job_id = J.job_id
GROUP BY E.job_id, J.job_title
;
