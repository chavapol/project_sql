/*
Question: Where are the top 10 paying remote data analyst jobs on LinkedIn ?
- Identify the top 10 highest-paying Data Analyst roles and related that are available remotely
- Focuses on job postings with specified salaries (remove nulls) and specific site (LinkedIn)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT	
    job_title AS Title,
    company_dim.name AS Company_Name,
    job_posted_date::DATE,
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

/*
Here's the breakdown of the top remote data analyst jobs in 2023:
Wide Salary Range: Top 10 remote data analyst roles on LinkedIn span from $140,500 to $336,500, indicating significant salary potential in the field, especially in senior positions.
Diverse Industries: Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
Career Progression: There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

RESULTS
=======
[
  {
    "title": "Director of Analytics",
    "company_name": "Meta",
    "job_posted_date": "2023-08-23",
    "salary_yearly": "336500"
  },
  {
    "title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_posted_date": "2023-01-05",
    "salary_yearly": "189000"
  },
  {
    "title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_posted_date": "2023-01-23",
    "salary_yearly": "170000"
  },
  {
    "title": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "job_posted_date": "2023-12-08",
    "salary_yearly": "165000"
  },
  {
    "title": "Principal Data Analyst",
    "company_name": "Realtime Recruitment",
    "job_posted_date": "2023-02-02",
    "salary_yearly": "160000"
  },
  {
    "title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "company_name": "Robert Half",
    "job_posted_date": "2023-01-30",
    "salary_yearly": "160000"
  },
  {
    "title": "Lead Data Analyst - Retirement Product Management",
    "company_name": "Edward Jones",
    "job_posted_date": "2023-05-09",
    "salary_yearly": "148239"
  },
  {
    "title": "Data Analyst - up to 160K+",
    "company_name": "Hire With Jarvis",
    "job_posted_date": "2023-04-18",
    "salary_yearly": "145000"
  },
  {
    "title": "Lead Data Analyst",
    "company_name": "Edward Jones",
    "job_posted_date": "2023-01-28",
    "salary_yearly": "144482"
  },
  {
    "title": "People Data Analyst",
    "company_name": "Insight Global",
    "job_posted_date": "2023-07-31",
    "salary_yearly": "140500"
  }
]
*/