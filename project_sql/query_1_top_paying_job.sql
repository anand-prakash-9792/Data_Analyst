/*
What are the top-paying Data Analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are availble remotely.
- Fucuses on Job postings with specified salaries (Remove Nulls).
- Why Highlight the top-paying oppertunities for Data Analyst, offering insights into employment 
*/


-- In this query We are going to check that what are the top job Paying Jobs for Data Analyst

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
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'  AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT Null
ORDER BY
    salary_year_avg DESC
LIMIT 10; 