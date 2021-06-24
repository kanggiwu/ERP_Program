/* UI���Ǽ� v0.0.4���� */

/***********************���� ����***********************/

/* PAGE 8 */ 
/* login �� DB���� ���̵� �ش��ϴ� ����� �ҷ��ͼ� ����ڰ� �Է��� ����� ��ġ�ϸ� �α���*/
/*--------getPassword*/
SELECT emp_pw
  FROM emp
WHERE emp_no = "#�Էµ� ������ȣ";


/* PAGE 9 */

/* ����� �̸�, ����, �μ��� ��������*/
/* getEMPInfoHead*/
SELECT e.emp_name|| " - " || r.rank_name || " - " ||  d.dept_name /* ��� ���� �������� */
FROM emp e, dept d, rank r
WHERE n.emp_no = e.emp_no AND e.dept_no = d.deptno AND e.emp_no = "#���� �������� ����� �����ȣ";


/*insertAttendanceTime */
INSERT INTO attendance (attendance_code, emp_no, attendance_start_work) VALUES( "#������ ��뿹��",  "#���� �������� ����� �����ȣ", SYSDATE); /* ��� ��ư�� ���� ���*/

/*�ֽ��� ���� 3�� �ҷ����� */
/*getMainNoticeList*/
SELECT notice_title, notice_date
  FROM notice
WHERE ROWNUM <= 3
ORDER BY notice_date DESC;

/* PAGE10 */
/* getMenuName */
SELECT menu_name 
    FROM Menu;
    

/* PAGE11 */

/***********************����*******************************/

/* PAGE14 */

SELECT DECODE(n.notice_type, '�μ�', d.dept_name, '����') as notice_type, n.notice_title, d.dept_name, n.emp_name, n.notice_date
  FROM      notice n, emp e, dept d
WHERE n.emp_no = e.emp_no AND e.dept_no = d.deptno
          /*AND ROWNUM > "��������" AND ROWNUM < "������ ����" ----- ����Ʈ�ϴ� ��ȣ�� ���� ������ ����� �ٲ��ֱ����� �κ�,�ϴ� �밭 ����, �� ���� ���̵�� ������, ���� �ʿ� */
ORDER BY notice_date DESC;

/* PAGE15 */
SELECT n.notice_title, d.dept_name||' '||e.emp_name, n.notice_date, n.notice_content
  FROM notice n, emp e, dept d
WHERE n.emp_no = e.emp_no AND e.dept_no = d.deptno AND n.notice_no = #{���õ� ������ȣ};

/* PAGE17 */
INSERT INTO notice (notice_no, notice_type, notice_title, emp_no, notice_content, notice_date)
                  VALUES ( #{������},    #{�����з��Է�},     #{���������Է�}  ,#{�ۼ� ���},               #{���� ����},  SYSDATE);

/* PAGE19 */
UPDATE notice
SET
notice_type = #{�Է¹��� ��} ,           /*�����ʿ�: ȭ�鿡�� �������� ������ ������ �з��� ���氡���ϰ� �Ұ��ΰ�?*/
notice_title = "#�Է¹��� ����",
notice_content = "#�Է¹��� ��������",
notice_date = "#������ �ð�?"        /*�����Ҷ� �ð��� ������ �ð����� ������ ���ΰ�?*/
WHERE notice_no = "#���� �����󼼷� ���ö� ���� ���� ��ȣ";

/* PAGE23 */
DELETE notice
WHERE notice_no =  "#���� �����󼼷� ���ö� ���� ���� ��ȣ";

/***********************���� ������**********************/

/* PAGE26 */
SELECT e.emp_name, TRUNC(MONTHS_BETWEEN(SYSDATE, m_lunch_date)/12)||'����', d.dept_name, r.rank_name, e.emp_hiredate, emp_status, e.emp_pw, e.emp_tel, e.emp_email
  FROM emp e, dept d, rank r
WHERE e.dept_no = d.dept_no AND e.rank_no = r.rank_no AND emp_no = "#���� ���� ����� �����ȣ";

/* PAGE28   ���ݹ��������� ���ν����� ������� �����Ƿ� �ڹٴܿ��� �н������ �н�����Ȯ���� ��ġ�ϴ� �� Ȯ���� �������� ��й�ȣ�� ������Ʈ*/
UPDATE emp
SET
emp_pw = "#�Է¹��� ������ �н�����"
WHERE emp_no = "#���� �������� ����� �����ȣ";

/***********************����********************************/

/* PAGE31 */
SELECT attendance_code, emp_no, attendance_start_work
  FROM attendance
WHERE emp_no = "#���� �������� ����� �����ȣ"
    AND attendance_start_work BETWEEN TRUNC(SYSDATE+1)-TO_CHAR(SYSDATE,'DD') AND TRUNC(LAST_DAY(SYSDATE))+0.99999421; /*ó�� ������ ���� ���� ����*/

SELECT attendance_code, emp_no, attendance_start_work
  FROM attendance
WHERE emp_no = "#���� �������� ����� �����ȣ"
    AND attendance_start_work BETWEEN TRUNC("#�Է¹��� ��¥�� ��" +1)-TO_CHAR("#�Է¹��� ��¥�� ��", 'DD') AND TRUNC(LAST_DAY("#�Է¹��� ��¥�� ��")) + 0.9999942;

/* PAGE32 */
    /*���� ���� ��ȸ */
SELECT schedule_code, emp_no, schedule_type, schedule_title, schedule_startdate, schedule_enddate, schedule_content
  FROM schedule
WHERE schedule_type = '����';

    /*�μ� ���� ��ȸ */
SELECT s.schedule_code, s.emp_no, s.schedule_type, s.schedule_title, 
                s.schedule_startdate, s.schedule_enddate, s.schedule_content d.dept_name
  FROM schedule s, emp e, dept d
WHERE s.emp_no = e.emp_no AND e.dept_no = d.dept_no AND schedule_type = '�μ�';

    /*��� ���� ��ȸ */
SELECT schedule_code, emp_no, schedule_type, schedule_title, 
                schedule_startdate, schedule_enddate, schedule_content
  FROM schedule
WHERE emp_no = emp_no AND emp_no = "#�������� ����� �����ȣ" AND schedule_type = '���';

/* PAGE33 */
INSERT INTO schedule (schedule_code, emp_no, schedule_type, schedule_title, schedule_startdate, schedule_enddate, schedule_content)
                        VALUES ("#������ �߰�����", "#���� �������� �����ȣ", "#�޺��ڽ��� ���õ� �����з�", "#������ ����", "#������", "#������", "#���� ����");

/* PAGE34 */
SELECT emp_no FROM schedule WHERE schedule_code = "������ ������ ������ȣ"; /*������ �ۼ��ڰ� �´��� Ȯ���ϱ� ���� �����ۼ��� ����� �����ȣ �ҷ����� */

UPDATE schedule
SET 
    emp_no = "#���� �������� ������",
    schedule_type = "#�޺��ڽ����� ���õ� �����з�",
    schedule_title = "#���� ����",
    schedule_startdate = "#������",
    schedule_enddate = "#������",
    schedule_content = "#���� ����"
WHERE  schedule_code = "#������ ������ȣ";

/* PAGE35 */
DELETE schedule WHERE schedule_code = "#������ ������ ������ȣ";




/**************************ȸ��********************************/




/***************************�λ�*******************************/

/* PAGE56 */
SELECT e.emp_no, e.emp_name, d.dept_name, r.rank_name, e.emp_status
  FROM emp e, dept d, rank r
WHERE e.dept_no = d.dept_no AND e.rank_no = r.rank_no  /* �� �������� ��� ���� �˻��� �߰� �� ��� where�� ���� �ʿ�*/
ORDER BY emp_no ASC;

/* PAGE57 */
INSERT INTO emp (emp_no, emp_name, emp_pw, emp_status, dept_no, rank_no, emp_job, emp_hiredate, emp_retiredate, emp_email, emp_tel, emp_auth, emp_picture_path)
                VALUES("������", "����̸�", "�����ȭ��ȣ ��4�ڸ�?", "����", "�޺��ڽ����� ���ε� �μ���ȣ", "�޺��ڽ����� ���ε� ������ȣ", "�����", NULL, "�̸���", "��ȭ��ȣ", "�ϴ� �ּұ���?", "����÷�ο��� �޾ƿ� ���");

/* PAGE59 */
INSERT INTO licence_emp (emp_no, licence_no) VALUES( "���� �������� ��������� �����ȣ", "ȭ�鿡�� ���õ� �ڰ�����ȣ");

/* PAGE 63 */
UPDATE emp
SET
    emp_name = "�������̸�"
    ,emp_status = "������ ������"
    ,dept_no = "������ �޺��ڽ��� ���� �Է¹��� ���ε� �μ���ȣ"
    ,rank_no = "������ �޺��ڽ��� ���� �Է¹��� ���ε� ������ȣ"
    /*,emp_job = "��å�� �ٲٴ� �κ��� ȭ�鿡 ����"*/
    ,emp_retiredate = "�����̳� �ذ��� ��� ������ ������"
    ,emp_email = "����� �̸���"
    ,emp_tel = "����� ��ȭ��ȣ"
    /*,emp_auth = "���Ѽ����� ���� �κ��� ����" */
    ,emp_picture_path = "���� ÷�ο��� �޾ƿ� ����� ���� ������ ���"
WHERE emp_no = "�ش� ���������� �����ȣ";


/**************************���ڰ���********************************/



/**************************������Ʈ ����***************************/






 /* emp_no, emp_name, emp_pw, emp_status, rank_no, dept_no, emp_job, emp_hiredate, emp_retiredate, emp_email, emp_tel, emp_auth, emp_picture_path*/
 
 /* sal_code, emo_no, sal_date, sal_base, sal_incentive, sal_position, sal_tech, sal_etc, sal_meal, sal_commu, sal_payment, sal_nation_pension, sal_health, sal_industrial_insurance, sal_employ_insurance, sal_income_tax, sal_local_tax, sal_deduction_etc, sal_deductions, sal_total */
 
 /* licence_no, licence_name, licence_type, licence_level, licence_date, licence_expire, licence_incentive */