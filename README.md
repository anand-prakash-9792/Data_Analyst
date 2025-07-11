# 📊 Introduction  
Step into the world of data careers with this deep dive into the **Data Analyst job market**.  
This project explores **top-paying roles**, identifies **in-demand skills**, and highlights where **high demand meets high salary** — all tailored for aspiring or transitioning Data Analysts.

👉 Curious about the SQL behind the scenes? Check it out here: [Project_sql](/project_sql/)

---

# 🧠 Background  
Motivated by the need to navigate the **Data Analyst job market** more strategically, this project aims to uncover the intersection of **high-paying opportunities** and **essential skills**.  

The goal? To simplify the job hunt for Data Analysts by spotlighting what truly matters.

The dataset, sourced from my [SQL Course](), includes valuable insights on job titles, salaries, locations, and required skills — all analyzed using SQL.

---

### 🔍 Key Questions Explored

1. 💼 What are the top-paying Data Analyst jobs?  
2. 🛠️ What skills are required for these high-paying roles?  
3. 📊 What are the most in-demand skills for Data Analysts?  
4. 💰 What skills are most strongly associated with higher salaries?  
5. 🎯 What are the most **optimal** skills to focus on learning?

---

# 🛠️ Tools & Technologies Used  

To perform a data-driven analysis of the Data Analyst job market, I leveraged the following tools:

- **SQL** – Core to querying and extracting meaningful insights from the database.  
- **PostgreSQL** – A robust relational database system for managing job data.  
- **Visual Studio Code** – My primary workspace for executing and managing SQL queries.  
- **Git & GitHub** – Used for version control and sharing my work, enabling easy tracking and collaboration.

---

# 📈 The Analysis  

Each SQL query in this project was carefully designed to answer a specific, real-world question about the Data Analyst job landscape.  
From identifying top salaries to determining which skills truly matter — the analysis combines logic, data, and career relevance.

---
### 💼 01. Top-Paying Data Analyst Jobs  

To identify the **highest-paying Data Analyst roles**, I queried positions with non-null average yearly salaries and filtered for **remote jobs** (`job_location = 'Anywhere'`). This helped surface the most lucrative opportunities available across companies in 2023.

---

#### 🧾 SQL Query:
```sql
SELECT
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM    
    job_postings_fact 
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
## 📊 Key Insights:
- **💰 Salary Range:** The top 10 remote roles offer annual salaries between $184,000 and $650,000, demonstrating the high earning potential for skilled analysts.

- **🏢 Diverse Roles & Titles:** Job titles range from Data Analyst to Director of Analytics, reflecting varied levels of specialization and advancement within the analytics field.

---

![Check](project_sql/assets/For%20project.png)
*This graph highlights the top 10 highest-paying Data Analyst jobs in 2023, showcasing salary trends across remote opportunities in the data industry.*

---

### 💼 02. Skills Required for Top-Paying Data Analyst Jobs

To uncover which **technical skills** are most valued in **high-paying remote Data Analyst roles**, I analyzed the top 10 positions (by salary) and extracted their required skill sets. This helps identify what tools and technologies are prioritized by top employers.

---

#### 🧾 SQL Query:
```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM    
        job_postings_fact 
    LEFT JOIN company_dim 
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'  
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim 
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
**📊 Key Insights :** 
- SQL is the most frequently listed skill, appearing in 8 out of 10 top-paying roles.
- Python follows closely, highlighting the demand for scripting, automation, and data wrangling.
- Tableau and Excel remain essential tools for data visualization and reporting.
- Cloud and BI tools like AWS, Power BI, and Snowflake are increasingly common in high-paying roles.
- Specialized tools such as Looker, Google Analytics, and R appear in niche but well-compensated positions..

![Link_Here](![Skill Frequency Table](project_sql/assets/Skill%20Frequency%20Table.png))
*Bar Chart: Skill Frequency in Top 10 Highest-Paying Jobs.*

---

### 📌 03. In-Demand Skills for Data Analysts

This analysis highlights the skills most frequently requested in Data Analyst job postings, helping to pinpoint the areas with the highest market demand.

#### 🧾 SQL Query:
```sql
SELECT
    skills,
    COUNT(skills_job_dim.skill_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_country = 'India'
GROUP BY
    skills
ORDER BY 
    demand_count DESC;

```

## 🔍 Key Insights:
SQL and Excel remain foundational, underscoring their importance for data querying and manipulation.

Programming and Data Visualization tools like Python, Tableau, and Power BI are essential, reflecting the growing demand for technical proficiency in analytics and data storytelling.
## 📊 Skill Demand Table

| Skills   | Demand Count |
|----------|--------------|
| SQL      | 7291         |
| Excel    | 4611         |
| Python   | 4330         |
| Tableau  | 3745         |
| Power BI | 2609         |
*Table of the demand for the top 5 skills in Data Analyst job popstings*

---

### 💸 04. Skills Based on Salary

Exploring the average salaries associated with different skills revealed which skills are the most financially rewarding for Data Analysts.

#### 🧾 SQL Query:
```sql
-- What are the Top Skills based on Salary

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY 
    average_salary DESC
LIMIT 20;

```

## 📌 Key Insights:
💡 High Demand for Big Data & ML Skills
Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy). This reflects the industry's strong emphasis on data processing and predictive modeling capabilities.

💻 Software Development & Deployment Proficiency
Expertise in development and deployment tools like GitLab, Kubernetes, and Airflow indicates a lucrative crossover between data analytics and engineering. These skills enable automation and efficient data pipeline management, making them highly valuable.

☁️ Cloud Computing Expertise
Familiarity with cloud platforms and data engineering tools such as Elasticsearch, Databricks, and Google Cloud Platform (GCP) is increasingly essential. Cloud proficiency significantly boosts earning potential in modern data analytics roles.
## 💼 Top 10 Highest Paying Skills for Data Analysts

Below is a table showing the average salary for the top 10 highest-paying skills in data analytics:

| Skills       | Average Salary ($) |
|--------------|---------------------|
| PySpark      | 208,172             |
| Bitbucket    | 189,155             |
| Couchbase    | 160,515             |
| Watson       | 160,515             |
| DataRobot    | 155,486             |
| GitLab       | 154,500             |
| Swift        | 153,750             |
| Jupyter      | 152,777             |
| Pandas       | 151,821             |
| Elasticsearch| 145,000             |

---

### 🎯 05. Most Optimal Skills to Learn

Combining insights from both **demand** and **salary** data, this query aims to identify the most **strategic skills** for aspiring Data Analysts — those that are **highly sought-after** and also **well-compensated**.

#### 🧾 SQL Query:
```sql
WITH skills_demands AS (
    SELECT
        skills_dim.skill_id,
        skills,
        COUNT(skills_job_dim.skill_id) AS demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT  
        skills_dim.skill_id,
        skills,
        ROUND(AVG(salary_year_avg), 2) AS average_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
)

SELECT 
    skills_demands.skill_id,
    skills_demands.skills,
    demand_count,
    average_salary
FROM
    skills_demands
INNER JOIN average_salary 
    ON skills_demands.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    demand_count DESC,
    average_salary DESC
LIMIT 25;

```

## 🧠 Most Optimal Skills for Data Analysts (by Salary)

The table below highlights the most optimal skills for Data Analysts, based on both **demand count** and **average salary**. These are the technologies and tools that offer the best **balance between demand and pay**, making them highly strategic for career growth.

| Skill ID | Skills      | Demand Count | Average Salary ($) |
|----------|-------------|---------------|---------------------|
| 8        | Go          | 27            | 115,320             |
| 234      | Confluence  | 11            | 114,210             |
| 97       | Hadoop      | 22            | 113,193             |
| 80       | Snowflake   | 37            | 112,948             |
| 74       | Azure       | 34            | 111,225             |
| 77       | BigQuery    | 13            | 109,654             |
| 76       | AWS         | 32            | 108,317             |
| 4        | Java        | 17            | 106,906             |
| 194      | SSIS        | 12            | 106,683             |
| 233      | Jira        | 20            | 104,918             |

*Table: Top 10 most optimal skills for Data Analysts based on demand and salary (2023)*

---

### 🔍 Key Insights:

**💻 High-Demand Programming Languages**  
Languages like **Python** and **R** are among the most in-demand skills, with demand counts of 236 and 148, respectively.  
Despite being widely used, their average salaries — **$101,397 for Python** and **$100,499 for R** — suggest that while these skills are essential, they are also highly accessible in the job market.

**☁️ Cloud Tools & Technologies**  
Skills in modern cloud-based tools like **Snowflake**, **Azure**, **AWS**, and **BigQuery** not only command high salaries but are also increasingly in demand. This trend underscores the importance of cloud computing and big data platforms in today's analytics workflows.

**📊 Business Intelligence & Visualization Tools**  
Tools like **Tableau** (230 demand count, ~$99,288 salary) and **Looker** (49 demand count, ~$103,795 salary) emphasize the vital role of data visualization and BI in transforming raw data into actionable business insights.

**🗄️ Database Technologies**  
Proficiency in traditional and NoSQL databases (e.g., **Oracle**, **SQL Server**, **MongoDB**) continues to be valuable.  
With average salaries ranging from **$97,786 to $104,534**, database expertise remains foundational in the analytics ecosystem.

---

These insights highlight the most strategic skillsets for Data Analysts in 2023 — those that offer strong compensation while staying aligned with current industry demands.

# 🧠 What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **Complex Query Crafting**  
  Mastered the art of advanced SQL — joining multiple tables, using subqueries, and leveraging `WITH` clauses for powerful temporary table creation.

- **Data Aggregation**  
  Became fluent in `GROUP BY` and aggregate functions like `COUNT()` and `AVG()`, turning raw data into meaningful summaries.

- **Analytical Wizardry**  
  Sharpened my real-world problem-solving skills, transforming business questions into actionable, insightful SQL queries.

---

# ✅ Conclusions

### 🔍 Key Insights:

1. **Top-Paying Data Analyst Jobs**  
   The highest-paying jobs for data analysts (especially remote roles) offer a wide salary range — with the top hitting **$650,000**!

2. **Skills for Top-Paying Jobs**  
   High-paying data analyst roles consistently require strong **SQL** skills, confirming it as a foundational and financially rewarding tool.

3. **Most In-Demand Skills**  
   **SQL** is also the most frequently requested skill in job listings — essential for standing out in a competitive job market.

4. **Skills with Higher Salaries**  
   Niche and technical skills like **SVN** and **Solidity** are associated with higher average salaries, showing the value of specialized expertise.

5. **Optimal Skills for Job Market Value**  
   **SQL** leads both in demand and salary potential, making it one of the **most optimal skills** for aspiring data analysts to learn and master.

---

### 💬 Closing Thoughts

This project not only strengthened my SQL abilities but also delivered **real-world insights** into the evolving Data Analyst job market.  

By examining trends in **salary**, **skills**, and **demand**, I gained a clearer picture of how to strategically navigate a career in data analytics.

For anyone entering or transitioning into this field, focusing on **high-demand** and **high-value** skills is key to success.  
This exploration underscores the importance of **continuous learning**, **adaptability**, and staying updated with the latest industry tools and trends.

---

📌 *Thank you for exploring this project — feel free to check out the SQL files and insights in the repository!*
