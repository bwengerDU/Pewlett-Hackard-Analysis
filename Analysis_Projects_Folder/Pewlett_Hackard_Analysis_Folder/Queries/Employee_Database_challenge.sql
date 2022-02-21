--Deliverable 1 Instructions 1-5
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '2052-01-01' AND '2055-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows. Instructions 8-13.
SELECT DISTINCT ON (emp_no) emp_no, 
	first_name, 
    last_name, 
    title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- retrieve the number of employees by their most recent job title  who are about to retire. Instructions 16-19.
SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;