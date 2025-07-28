/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short in ('Data Analyst','Data Scientist') AND 
        job_location in ('Thailand','Ireland') AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
Here's the breakdown of the most demanded skills for data analysts and data scientist in 2023, based on job postings in Thailand and Ireland:
SQL is leading with a bold count of 7.
Python follows closely with a bold count of 6.
R is also highly sought after, with a bold count of 4.
Other skills like Tableau, Hadoop, AWS, and Redshift show varying degrees of demand.

[
  {
    "job_id": 800765,
    "job_title": "Data Science Manager (Bangkok based, relocation provided)",
    "salary_year_avg": "192000.0",
    "company_name": "Agoda",
    "skills": "sql"
  },
  {
    "job_id": 800765,
    "job_title": "Data Science Manager (Bangkok based, relocation provided)",
    "salary_year_avg": "192000.0",
    "company_name": "Agoda",
    "skills": "python"
  },
  {
    "job_id": 800765,
    "job_title": "Data Science Manager (Bangkok based, relocation provided)",
    "salary_year_avg": "192000.0",
    "company_name": "Agoda",
    "skills": "r"
  },
  {
    "job_id": 800765,
    "job_title": "Data Science Manager (Bangkok based, relocation provided)",
    "salary_year_avg": "192000.0",
    "company_name": "Agoda",
    "skills": "tableau"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "sql"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "python"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "scala"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "golang"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "redshift"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "snowflake"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "gcp"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "spark"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "hadoop"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "kafka"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "tableau"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "power bi"
  },
  {
    "job_id": 325262,
    "job_title": "Data Architect (Bangkok based, relocation provided)",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda",
    "skills": "git"
  },
  {
    "job_id": 631334,
    "job_title": "Data Analyst - Operations",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "sql"
  },
  {
    "job_id": 631334,
    "job_title": "Data Analyst - Operations",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "python"
  },
  {
    "job_id": 631334,
    "job_title": "Data Analyst - Operations",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "scala"
  },
  {
    "job_id": 631334,
    "job_title": "Data Analyst - Operations",
    "salary_year_avg": "111175.0",
    "company_name": "Stripe",
    "skills": "r"
  },
  {
    "job_id": 738589,
    "job_title": "Data Analytics Specialist",
    "salary_year_avg": "89100.0",
    "company_name": "Zynga",
    "skills": "sql"
  },
  {
    "job_id": 738589,
    "job_title": "Data Analytics Specialist",
    "salary_year_avg": "89100.0",
    "company_name": "Zynga",
    "skills": "python"
  },
  {
    "job_id": 738589,
    "job_title": "Data Analytics Specialist",
    "salary_year_avg": "89100.0",
    "company_name": "Zynga",
    "skills": "oracle"
  },
  {
    "job_id": 738589,
    "job_title": "Data Analytics Specialist",
    "salary_year_avg": "89100.0",
    "company_name": "Zynga",
    "skills": "tableau"
  },
  {
    "job_id": 51221,
    "job_title": "Senior Business Development and Data Analytic",
    "salary_year_avg": "79200.0",
    "company_name": "Bosch Group",
    "skills": "powerpoint"
  },
  {
    "job_id": 953794,
    "job_title": "Scientist 4, Data Science",
    "salary_year_avg": "79200.0",
    "company_name": "Western Digital",
    "skills": "sql"
  },
  {
    "job_id": 953794,
    "job_title": "Scientist 4, Data Science",
    "salary_year_avg": "79200.0",
    "company_name": "Western Digital",
    "skills": "python"
  },
  {
    "job_id": 953794,
    "job_title": "Scientist 4, Data Science",
    "salary_year_avg": "79200.0",
    "company_name": "Western Digital",
    "skills": "java"
  },
  {
    "job_id": 953794,
    "job_title": "Scientist 4, Data Science",
    "salary_year_avg": "79200.0",
    "company_name": "Western Digital",
    "skills": "r"
  },
  {
    "job_id": 953794,
    "job_title": "Scientist 4, Data Science",
    "salary_year_avg": "79200.0",
    "company_name": "Western Digital",
    "skills": "aws"
  },
  {
    "job_id": 953794,
    "job_title": "Scientist 4, Data Science",
    "salary_year_avg": "79200.0",
    "company_name": "Western Digital",
    "skills": "spark"
  },
  {
    "job_id": 953794,
    "job_title": "Scientist 4, Data Science",
    "salary_year_avg": "79200.0",
    "company_name": "Western Digital",
    "skills": "hadoop"
  },
  {
    "job_id": 431618,
    "job_title": "Data Scientist (New Graduated Welcome)",
    "salary_year_avg": "70000.0",
    "company_name": "Western Digital",
    "skills": "sas"
  },
  {
    "job_id": 431618,
    "job_title": "Data Scientist (New Graduated Welcome)",
    "salary_year_avg": "70000.0",
    "company_name": "Western Digital",
    "skills": "javascript"
  },
  {
    "job_id": 431618,
    "job_title": "Data Scientist (New Graduated Welcome)",
    "salary_year_avg": "70000.0",
    "company_name": "Western Digital",
    "skills": "aws"
  },
  {
    "job_id": 431618,
    "job_title": "Data Scientist (New Graduated Welcome)",
    "salary_year_avg": "70000.0",
    "company_name": "Western Digital",
    "skills": "redshift"
  },
  {
    "job_id": 431618,
    "job_title": "Data Scientist (New Graduated Welcome)",
    "salary_year_avg": "70000.0",
    "company_name": "Western Digital",
    "skills": "tensorflow"
  },
  {
    "job_id": 431618,
    "job_title": "Data Scientist (New Graduated Welcome)",
    "salary_year_avg": "70000.0",
    "company_name": "Western Digital",
    "skills": "angular"
  },
  {
    "job_id": 431618,
    "job_title": "Data Scientist (New Graduated Welcome)",
    "salary_year_avg": "70000.0",
    "company_name": "Western Digital",
    "skills": "jquery"
  },
  {
    "job_id": 431618,
    "job_title": "Data Scientist (New Graduated Welcome)",
    "salary_year_avg": "70000.0",
    "company_name": "Western Digital",
    "skills": "sas"
  },
  {
    "job_id": 431618,
    "job_title": "Data Scientist (New Graduated Welcome)",
    "salary_year_avg": "70000.0",
    "company_name": "Western Digital",
    "skills": "spss"
  },
  {
    "job_id": 734123,
    "job_title": "Data Science in Product Design Engineering",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "sql"
  },
  {
    "job_id": 734123,
    "job_title": "Data Science in Product Design Engineering",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "javascript"
  },
  {
    "job_id": 734123,
    "job_title": "Data Science in Product Design Engineering",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "sql server"
  },
  {
    "job_id": 278,
    "job_title": "Scientist 1, Data Science",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "sql"
  },
  {
    "job_id": 278,
    "job_title": "Scientist 1, Data Science",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "python"
  },
  {
    "job_id": 278,
    "job_title": "Scientist 1, Data Science",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "java"
  },
  {
    "job_id": 278,
    "job_title": "Scientist 1, Data Science",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "r"
  },
  {
    "job_id": 278,
    "job_title": "Scientist 1, Data Science",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "matlab"
  },
  {
    "job_id": 278,
    "job_title": "Scientist 1, Data Science",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "aws"
  },
  {
    "job_id": 278,
    "job_title": "Scientist 1, Data Science",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "hadoop"
  },
  {
    "job_id": 278,
    "job_title": "Scientist 1, Data Science",
    "salary_year_avg": "50400.0",
    "company_name": "Western Digital",
    "skills": "github"
  }
]