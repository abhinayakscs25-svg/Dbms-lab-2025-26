 use abhi;
 SELECT e.ename AS Manager_Name
FROM emp e
JOIN emp m ON e.empno = m.mgr_no
GROUP BY e.empno, e.ename
HAVING COUNT(m.empno) = (
    SELECT MAX(emp_count)
    FROM (
        SELECT COUNT(*) AS emp_count
        FROM emp
        WHERE mgr_no IS NOT NULL
        GROUP BY mgr_no
    ) AS subq
);
SELECT e.ename AS Manager_Name, e.sal AS Manager_Salary
FROM emp e
JOIN emp m ON e.empno = m.mgr_no
GROUP BY e.empno, e.ename, e.sal
HAVING e.sal > AVG(m.sal);
SELECT DISTINCT e.ename AS Second_Level_Manager, d.dname AS Department
FROM emp e
JOIN emp m ON e.mgr_no = m.empno
JOIN dept d ON e.deptno = d.deptno
WHERE m.mgr_no IS NULL;
SELECT e.empno, e.ename, i.incentive_amount
FROM emp e
JOIN incentives i ON e.empno = i.empno
WHERE MONTH(i.incentive_date) = 2
  AND YEAR(i.incentive_date) = 2019
ORDER BY i.incentive_amount DESC
LIMIT 1 OFFSET 1;
SELECT e.empno, e.ename, e.deptno
FROM emp e
JOIN emp m ON e.mgr_no = m.empno where e.deptno = m.deptno;