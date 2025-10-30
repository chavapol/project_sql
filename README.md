# 👋🏻 About the Author
My name is **Harris Tosuk**, I'm a college student who studying in business with a background in IT. I'm excited to share my first Data Analysis project. I've always believed that having both technical skills is a powerful combination. And i hope this project may inspires some of you who are looking to try something new or want to blend your skills in a similar way.✨

## 📚 Introduction
Welcome to my SQL project, where I delve into the data job market with a focus on data analyst and related roles, aiming to the key insights into top-paying jobs, the most in-demand skills, and the optimal skill sets for maximizing career value based in 2023.

**Check out all of my queries and detailed analysis here :** [project_sql folder](/project_sql)
## 🧾 Background
The motivation behind this project stems from my personal desire to understand SQL and gain a deeper insight into the data analyst job market. I aimed to discover which skills are the highest paid and most in-demand, thereby making my research more effective and valuable.

The questions I wanted to answer through my SQL queries were:
1. Where are the top 10 paying remote data analyst jobs on LinkedIn ?
2. What are the most in-demand skills for Data analysts
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
## 1. Top Paying Remote Data Analyst Jobs
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


## 💡 Here's the breakdown:
* **Wide Range Salary:** The top remote **data analyst** salaries range from **$140,500 to $336,500**, showing strong earning opportunities for experienced analysts.
* **Top hiring companies:** Top employers include **Meta, Motional, and Edward Jones**, reflecting demand across tech and finance.
* **Role Consistency:** All positions are **Data Analyst** roles, with pay varying by industry and seniority.

## 2. In-Demand Skills for Data Analyst 
To identify the skills most frequently requested in job postings, directing focus to areas with high demand.

``` sql 
-- Question: What are the most in-demand skills for Data analysts
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short in ('Data Analyst')
    AND job_work_from_home = True
    AND job_location ='Anywhere'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10;
```
## 📋 Result Table

|Rank | Skill | Demand Count |
|-----| ------ | ------------: |
| 1 |SQL | 7,291 |
| 2 |Excel | 4,611 |
| 3 |Python | 4,330 |
| 4 |Tableau | 3,745 |
| 5 |Power BI | 2,609 |
| 6 |R | 2,142 |
| 7 |SAS | 1,866 |
| 8 |Looker | 868 |
| 9 |Azure | 821 |
| 10 |PowerPoint | 819 |

## 💡 Here's the breakdown:
* **Top Demand Skills:** **SQL**, **Excel** and **Python** dominate the top in-demand skills.
* **Visualisation Tools:** **Tableau** and **Power bi** remain key for transforming data into clear business insights.
* **Supporting Tools:**  Skills such as **Looker**, **Azure** and **PowerPoint** highlight the need for both cloud integration and presentation abilities.

## 3. Top-Paying Skills for Data Analyst Roles 
This analysis identifies which technical skills are most associated with high-paying remote Data Analyst positions.  
By averaging the yearly salaries for job postings that list each skill, we can see which capabilities bring the greatest salary advantage.

``` sql
-- Question: What are the top skills based on salary?
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_schedule_type = 'Full-time'
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 10;
```
## 📋 Result Table
|Rank| Skill | Average Salary ($) |
|-----| ------ | -----------------: |
|1| PySpark | 208,172 |
|2| Bitbucket | 189,155 |
|3| Couchbase | 160,515 |
|4| Watson | 160,515 |
|5| DataRobot | 155,486 |
|6| GitLab | 154,500 |
|7| Swift | 153,750 |
|8| Jupyter | 152,777 |
|9| Pandas | 151,821 |
|10| Elasticsearch | 145,000 |
## 💡 Here's the breakdown:
* **High-Value Tools:** **PySpark** leads with the highest average salary, showing strong demand for big data and distributed computing expertise.
* **Engineering Focus:** Tools like **Bitbucket**, **GitLab** and **Swift** indicate that development and version-control skills can boost analyst pay.
* **AI & Automation:** Platforms such as **Watson** and **DataRobot** highlight the growing importance of machine learning and AI tools in analyst roles.


## 4. Most optimal skills to learn in high demand and a high-paying skill?
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
-- Question: What are the most optimal skills to learn in high demand and a high-paying skill?
-- Identifies skills in high demand for Data Analyst roles
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY
        skills_dim.skill_id
), 
-- Skills with high average salaries for Data Analyst roles
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
        AND job_location = 'Anywhere'  
    GROUP BY
        skills_job_dim.skill_id
)
-- Return high demand and high salaries for 5 skills 
SELECT
    skills_demand.skill_id,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 5;

-- rewriting this same query more concisely
SELECT 
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
    AND job_location = 'Anywhere'
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 5;
```
## 📋 Result Table
| Skill | Demand Count | Average Salary ($) |
| ------ | -------------: | -----------------: |
| Go | 27 | 115,320 |
| Confluence | 11 | 114,210 |
| Hadoop | 22 | 113,193 |
| Snowflake | 37 | 112,948 |
| Azure | 34 | 111,225 |

## 💡 Here's the breakdown:
* **High-Paying Tech Skills:** **Go**, **Confluence**, and **Hadoop** show strong salary potential, each averaging above $113K, highlighting their value in **data engineering** and **workflow management**.

* **Cloud & Data Platforms:** **Snowflake** and **Azure** appear as both high-demand and high-paying skills, emphasizing the growing importance of cloud-based data solutions.

* **Balanced Value:** These skills combine market relevance and strong compensation, making them strategic choices for analysts aiming to boost **career growth and competitiveness**.

# 📖 What I Learned
Through this project, I strengthened my SQL and analytical skills. I learned how to:
* **Advanced Query Development:** Mastered complex SQL operations including multi-table joins and Common Table Expressions (CTEs) for sophisticated data manipulation and temporary result sets.
* **Data Aggregation & Analysis:** Developed strong skills in using GROUP BY clauses and aggregate functions (COUNT, AVG) to transform raw data into meaningful, summarized insights. 
* **Analytical Problem-Solving:** Strengthened my ability to translate real-world business questions into structured SQL queries that deliver actionable insights and data-driven recommendations.
# 🎯 Conclusions
The analysis revealed several critical patterns in the 2023 data analyst job market:

**Highest-Paying Remote Data Analyst Roles:** Remote Data Analyst salaries vary widely, with top positions reaching over **$330,000**. Senior and specialized roles, especially in major tech and finance companies, offer the highest pay for experienced analysts.

**Most In-Demand Skills for Data Analysts:** **SQL** and ****Python** lead the way as the most sought-after skills for data analysts, followed by visualization tools like **Tableau** and **Power BI**. These core skills form the foundation of most analyst roles today. 

**Highest-Paying Skills for Data Analysts:** Advanced tools like **PySpark**, **Bitbucket**, and **DataRobot** command the highest salaries, reflecting the growing value of big data, automation, and engineering-focused skills in analytics.

**Best Skills to Learn (High Demand & High Pay):**
Skills such as **Go**, **Snowflake**, and **Azure** strike the best balance between demand and high salary potential, making them smart choices for analysts aiming to grow their career and income.

# 🧩 Self-Reflection

This project helped me see how powerful data can be when used to answer real questions. I learned how to use SQL to explore and analyze job market data, finding patterns in skills, salaries, and demand. It also taught me the importance of keeping my code clean, my results organized, and my documentation clear.  

Overall, this project made me more confident in using data to tell meaningful stories and understand what drives opportunities in the data career.