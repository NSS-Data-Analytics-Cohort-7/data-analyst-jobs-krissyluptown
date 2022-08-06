/*Question 1:
How many rows are in the data_analyst_jobs table*/
select count (*) from data_analyst_jobs;
--Answer: 1,793
/*Question 2:
Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?*/
select * from data_analyst_jobs
fetch first 10 row only;
--Answer: ExxonMobil
/*Question 3:
How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?*/
Select count (*) from data_analyst_jobs where location = 'KY';
--Answer: 21 in TN. 6 in KY, 27 in KY and TN
/*Question 4: How many postings in Tennessee have a star rating above 4?*/
Select count (*) from data_analyst_jobs where location = 'TN' AND star_rating >4;
--Answer: 3
/*Question 5: How many postings in the dataset have a review count between 500 and 1000?*/
Select count (*) from data_analyst_jobs where review_count >500 AND review_count <1000;
--Answer: 150
/*Question 6: Show the average star rating for companies in each state. 
The output should show the state as state and the average rating for the state as avg_rating. 
Which state shows the highest average rating?*/
Select AVG(star_rating) AS avg_rating, location as state from data_analyst_jobs
group by location;
--Answer: NE
/*Question 7: Select unique job titles from the data_analyst_jobs table.
How many are there?*/
Select Distinct title from data_analyst_jobs;
--Answer: 881
/*Question 8: How many unique job titles are there for California companies?*/
Select Distinct title, location from data_analyst_jobs
where location = 'CA';
--Answer: 230
/*Question 9:Find the name of each company and its average star rating for all
companies that have more than 5000 reviews across all locations. How many companies
are there with more that 5000 reviews across all locations?*/
select company, AVG(star_rating) from data_analyst_jobs
where review_count is not null and review_count > 5000
Group by company, star_rating
Order by star_rating DESC;
--Answer: 40
/*Question 10:Add the code to order the query in #9 from highest to lowest 
average star rating. Which company with more than 5000 reviews across all 
locations in the dataset has the highest star rating? What is that rating?*/
--Answer: American Express 4.1
/*Question 11: Find all the job titles that contain the word ‘Analyst’. 
How many different job titles are there?*/
Select distinct (title) 
from data_analyst_jobs
where UPPER(title) like '%ANALYST%';
--Answer: 774
/*Question 12:How many different job titles do not contain either the word 
‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?*/
Select distinct title
from data_analyst_jobs
Where UPPER(title) not like '%ANALYST%' AND UPPER(title) not like '%ANALYTICS%';
--ANSWER: 4, Tableau
--BONUS
SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%' AND days_since_posting > 21 AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title)DESC;
/*Answer: Internet and Software (62), Banks and Financial Services (61),
Consulting and Business Services(57), Health Care(52).


