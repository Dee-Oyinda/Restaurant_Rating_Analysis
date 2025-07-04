-- Restaurants with high ratings
CREATE VIEW 
top_rated_restuarants AS
SELECT 
	name, Cuisine
FROM restaurants AS rr
INNER JOIN
restaurant_cuisines AS rc
ON rr.Restaurant_ID = rc.Restaurant_ID
INNER JOIN 
ratings AS rt
ON rc.Restaurant_ID = rt.Restaurant_ID
WHERE Overall_Rating = 2 AND Food_Rating = 2 AND Service_Rating = 2;


SELECT *
FROM consumer_preferences;

SELECT Preferred_Cuisine, COUNT(preferred_cuisine) AS cnt
FROM ratings AS rr
INNER JOIN
consumer_preferences AS cp
ON rr.Consumer_ID = cp.Consumer_ID
WHERE Overall_Rating = 2 AND Food_Rating = 2 AND Service_Rating = 2
GROUP BY Preferred_Cuisine
ORDER BY cnt DESC;



-- QUESTION 2 Consumers Demographics
SELECT Age,
		COUNT(Age) AS age_count
FROM consumers
GROUP BY Age
ORDER BY age DESC;

SELECT Occupation,
		COUNT(Occupation) AS count
FROM consumers
GROUP BY Occupation
ORDER BY Occupation DESC;

SELECT Budget,
		COUNT(Budget) AS count
FROM consumers
GROUP BY Budget
ORDER BY Budget DESC;

SELECT * FROM consumers

SELECT 
    Age,
    Occupation,
    Marital_Status,
    Budget,
    COUNT(*) AS Total
FROM Consumers
GROUP BY Age, Occupation, Marital_Status, Budget;

--Question 3-- Are they any demand and supply?
CREATE VIEW Demand_Supply AS
SELECT 
    cp.Preferred_Cuisine,
    COUNT(DISTINCT cp.Consumer_ID) AS Demand,
    COUNT(DISTINCT rc.Restaurant_ID) AS Supply
FROM Consumer_Preferences cp
LEFT JOIN Restaurant_Cuisines rc ON cp.Preferred_Cuisine = rc.Cuisine
GROUP BY cp.Preferred_Cuisine;

--QUESTION 4 investment worthy restaurant
SELECT city, price,Cuisine, Parking, Alcohol_Service
FROM restaurants AS RR
INNER JOIN
restaurant_cuisines AS RC
ON RR.Restaurant_ID = RC.Restaurant_ID
INNER JOIN
ratings AS RT
ON
RC.Restaurant_ID = RT.restaurant_ID
WHERE Overall_Rating = 2 AND Food_Rating = 2 AND Service_Rating = 2 AND Price = 'medium'
ORDER BY city,price;



