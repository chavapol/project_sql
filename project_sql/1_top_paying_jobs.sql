/*
Question: Where are the top 10 paying remote data analyst jobs on LinkedIn ?
- Identify the top 10 highest-paying Data Analyst roles and related that are available remotely
- Focuses on job postings with specified salaries (remove nulls) and specific site (LinkedIn)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT	
    company_dim.name AS Company_Name,
    job_title_short AS Title,
    job_posted_date::DATE,
    job_work_from_home AS Remote, 
    ROUND(salary_year_avg, 0) AS Salary_yearly
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_work_from_home = true and 
    job_via = 'via LinkedIn' and
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC,
    job_id
LIMIT 10;