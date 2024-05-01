-- 1. employees ���̺��� ��� ����� first_name�� �빮�ڷ� ��ȯ�Ͽ� ����ϼ���.
SELECT
    UPPER(first_name) FirstName
FROM employees
;
-- 2. employees ���̺��� ��� ����� last_name�� �ҹ��ڷ� ��ȯ�Ͽ� ����ϼ���.
SELECT
    LOWER(last_name) lastname
FROM employees
;
-- 3. employees ���̺��� �� ����� hire_date�� ������ �����Ͽ� ����ϼ���.
SELECT
    TO_CHAR(hire_date, 'YYYY') YEAR
FROM employees
;
-- 4. employees ���̺��� �� ����� hire_date�� ���� ���� �����Ͽ� ����ϼ���. ��: MM-DD ����.
SELECT
    TO_CHAR(hire_date, 'MM-DD')
FROM employees
;
-- 5. departments ���̺��� ��� �μ��� department_name�� �� �� ���ڸ� ����ϼ���.
SELECT
    SUBSTR(department_name, 1, 2)
FROM departments
;
-- 6. employees ���̺��� manager_id�� NULL�� ����� �̸��� ��å�� ����ϼ���.
SELECT
    first_name,
    job_id
FROM employees
WHERE manager_id IS NULL
;
-- 7. jobs ���̺��� job_title�� ���̸� ����Ͽ� ����ϼ���.
SELECT
    LENGTH(job_title)
FROM jobs
;
-- 8. employees ���̺��� ����� �̸��� ���� �̸����� ������ ���� '��', '�̸�' ��Ī���� ����ϼ���.
SELECT
    last_name ��,
    first_name �̸�
FROM employees
;
-- 9. employees ���̺��� �� ����� ���� ù ���ڿ� �̸��� �����Ͽ� ����ϼ���.
SELECT
    CONCAT(SUBSTR(last_name, 1, 1),first_name)
FROM employees
;
-- 10. locations ���̺��� city�� �̸��� ������ ����ϼ���. 
SELECT
    REVERSE(city)
FROM locations
;
-- 11. employees ���̺��� �� ����� salary�� 100�޷� ������ �ø��Ͽ� ����ϼ���.
SELECT
    CEIL(salary/100)*100
FROM employees
;
    
-- 12. employees ���̺��� �� ����� commission_pct�� NULL�� ���, 0���� ǥ���Ͽ� ����ϼ���.
SELECT
    NVL(commission_pct, 0)
FROM employees
;
-- 13. employees ���̺��� �� ����� �̸��� ù ���ڿ� ���� ù ���ڸ� �����Ͽ� ����ϼ���.
SELECT
    first_name,
    last_name,
    CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 1))
FROM employees
;
-- 14. employees ���̺��� �� ����� salary�� ���� 10% �λ��� �ݾ��� ����Ͽ� ����ϼ���.
SELECT
    salary *1.1
FROM employees
;
-- 15. countries ���̺��� �� ������ �̸��� �� ���ڷ� �ٿ��� ����ϼ���.
SELECT
    SUBSTR(country_name, 1, 3)
FROM countries
;
-- 16. employees ���̺��� �� ����� last_name�� �� ��° ���ڸ� '*'�� �����Ͽ� ����ϼ���
SELECT
    REPLACE(last_name, SUBSTR(last_name, 2, 1), '*')
FROM employees
;
? 17. employees ���̺��� job_id�� it_prog�� ����� first_name�� salary�� ����ϼ���.
?  ����1 ) ���ϱ� ���� ���� �ҹ��ڷ� �Է��� ��!
?  ����2 ) �̸��� �� 3���ڱ����� ����ϰ� �������� *�� ��ŷ�� ��. 
?          �� ���� ��Ī�� name�Դϴ�.

SELECT
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') NAME,
    salary SALARY
FROM employees
WHERE LOWER(job_id) = 'it_prog'
;