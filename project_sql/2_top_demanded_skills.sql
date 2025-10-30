/*
Question: What are the most in-demand skills for Data analysts and Data Scientist?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short in ('Data Analyst','Data Scientist')
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Here's the breakdown of the most demanded skills for data analysts and data scientist in 2023
SQL is widely used for retrieving and managing data from databases, while Python is crucial for data processing, analysis, and automation. Strong command of these foundational languages is key to success in most data roles.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

[
  {
    "skills": "sql",
    "demand_count": "14779"
  },
  {
    "skills": "python",
    "demand_count": "14720"
  },
  {
    "skills": "r",
    "demand_count": "6816"
  },
  {
    "skills": "tableau",
    "demand_count": "6203"
  },
  {
    "skills": "excel",
    "demand_count": "5875"
  }
]