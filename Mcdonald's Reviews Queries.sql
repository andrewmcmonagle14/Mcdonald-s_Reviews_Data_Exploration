/*

Data Exploration: McDonald's Reviews Dataset

*/


-- Total Count of reviews by store and category

SELECT store_name, category, COUNT(*) as review_count
FROM McDonald_s_Reviews$
GROUP BY store_name, category;



--All store locations with a rating of 4 stars or higher

Select store_address, COUNT(reviewer_id) as great_scores
from McDonald_s_Reviews$
Where rating >= '4 stars'
Group By store_address
Order by great_scores DESC;


-- Store Locations with Bad Scores -> 2 stars and lower

Select store_address, COUNT(reviewer_id) as bad_scores
from McDonald_s_Reviews$
Where rating >= '2 stars'
Group By store_address
Order by bad_scores DESC;



--Overall AVG score of all Store locations

SELECT store_name, AVG(CAST(SUBSTRING(rating, 1, CHARINDEX(' ', rating) - 1) AS decimal)) as avg_rating
FROM McDonald_s_Reviews$
GROUP BY store_name;




--AVG Score per store location

SELECT
    store_name,
    AVG(CAST(SUBSTRING(rating, 1, CHARINDEX(' ', rating) - 1) AS INT)) as avg_rating, store_address
FROM
    McDonald_s_Reviews$
GROUP BY
    store_name, store_address
Order by avg_rating Desc;



-- Geographic distribution of ratings

SELECT store_name, latitude, longitude, AVG(CAST(SUBSTRING(rating, 1, CHARINDEX(' ', rating) - 1) AS INT)) as avg_rating
FROM McDonald_s_Reviews$
GROUP BY store_name, latitude, longitude
Order by avg_rating Desc;



--Underperforming Regions

SELECT
    store_name,
    store_address,
    AVG(CAST(SUBSTRING(rating, 1, CHARINDEX(' ', rating) - 1) AS decimal)) as avg_rating
FROM
    McDonald_s_Reviews$
GROUP BY
    store_name, store_address
HAVING
    AVG(CAST(SUBSTRING(rating, 1, CHARINDEX(' ', rating) - 1) AS decimal)) < 3.126282
ORDER BY avg_rating DESC;













--







