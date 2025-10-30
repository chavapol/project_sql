# 👋🏻 About the Author
Hello everyone 👋, My name is **Harris Tosuk**, I'm a college student who studying in business with a background in IT. I'm excited to share my first Data Analysis project. I've always believed that having both technical skills is a powerful combination. And i hope this project may inspires some of you who are looking to try something new or want to blend your skills in a similar way.✨

## 📚 Introduction
Welcome to my SQL project, where I delve into the data job market with a focus on data analyst and related roles, aiming to the key insights into top-paying jobs, the most in-demand skills, and the optimal skill sets for maximizing career value based in 2023.

**Check out all of my queries and detailed analysis here :** [project_sql folder](/project_sql)
## 🧾 Background
The motivation behind this project stems from my personal desire to understand SQL and gain a deeper insight into the data analyst job market. I aimed to discover which skills are the highest paid and most in-demand, thereby making my research more effective and valuable.

The questions I wanted to answer through my SQL queries were:
1. Where are the top 10 paying remote data analyst jobs on LinkedIn ?
2. What are the most in-demand skills for Data analysts and Data Scientist?
3. What are the top skills based on salary?
4. What are the most optimal skills to learn in high demand and a high-paying skill?

## 🧰 Tools I used 
For my deep dive into the data analyst job market, I managed to use several key tools to perform my analysis and manage the project:

| Tool / Library  | Purpose |
| --------------- | -------- |
| **PostgreSQL**  | Stores and manages all project data securely |
| **Visual Studio Code** | Main workspace for writing and organizing SQL scripts |
| **Git & GitHub** | Tracks changes and supports collaboration throughout the project |
| **CTEs, Joins, Aggregations** | SQL techniques for relational data analysis |
| **Markdown** | Used to design a clear documentation |

## 📊 Queries & Analysis 
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:
### 1. Top Paying Remote Data Analyst Jobs
To identify the highest-paying remote roles, I filtered data analyst positions by average salary (yearly) via LinkedIn, focusing on remote jobs and available.


```sql
-- Question: What are the top_paying data analyst jobs on LinkedIn?

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
```

## 📋 Result Table
| Company | Title | Date Posted | Remote | Yearly Salary ($) |
| -------- | ------ | ------------ | :------: | ----------------: |
| Meta | Data Analyst | 2023-08-23 | true | 336,500 |
| Motional | Data Analyst | 2023-01-05 | true | 189,000 |
| Kelly Science, Engineering, Technology & Telecom | Data Analyst | 2023-01-23 | true | 170,000 |
| Plexus Resource Solutions | Data Analyst | 2023-12-08 | true | 165,000 |
| Realtime Recruitment | Data Analyst | 2023-02-02 | true | 160,000 |
| Robert Half | Data Analyst | 2023-01-30 | true | 160,000 |
| Edward Jones | Data Analyst | 2023-05-09 | true | 148,239 |
| Hire With Jarvis | Data Analyst | 2023-04-18 | true | 145,000 |
| Edward Jones | Data Analyst | 2023-01-28 | true | 144,482 |
| Insight Global | Data Analyst | 2023-07-31 | true | 140,500 |


### 💡 Here's the breakdown:
* **Wide Range Salary:** The top remote **data analyst** salaries range from **$140,500 to $336,500**, showing strong earning opportunities for experienced analysts.
* **Top hiring companies:** Top employers include **Meta, Motional, and Edward Jones**, reflecting demand across tech and finance.
* **Role Consistency:** All positions are **Data Analyst** roles, with pay varying by industry and seniority.




































### 2. In-Demand Skills for Data Analyst 
To identify the skills most frequently requested in job postings, directing focus to areas with high demand.

``` sql 
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
```
# What I Learned
# Conclusions



# Tools i used 
