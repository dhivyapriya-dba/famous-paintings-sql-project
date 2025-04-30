Problem Statements:=
====================================================================
 1. Fetch all the paintings which are not displayed on any museums?
use painting;

select WORK_ID from WORK
where not exists (select MUSEUM_ID from museum
where MUSEUM.MUSEUM_ID = WORK.MUSEUM_ID) 
---------------------------------------------------------------
2.Are there museums without any paintings?
  
select m.museum_id from museum m left join work w 
on m.museum_id=w.museum_id
where w.museum_id is null;

-------------------------------------------------------
3. How many paintings have an asking price of more than their regular price?

SELECT COUNT(WORK_ID) FROM PRODUCT_SIZE WHERE SALE_PRICE > REGULAR_PRICE ;

---------------------------------------------------------------------
4. Identify the paintings whose asking price is less than 50% of its regular price

SELECT WORK_ID FROM PRODUCT_SIZE WHERE SALE_PRICE <  REGULAR_PRICE*0.5 ;
-----------------------------------------------------------------
5.Which canva size costs the most?

select size_id from product_size where sale_price in (select max(sale_price) from product_size);
---------------------------------------------------------

6.Fetch the top 10 most famous painting subject
SELECT subject, COUNT(work_id) AS count
FROM work
GROUP BY subject
ORDER BY count DESC
LIMIT 10;
------------------------------------------
7.Identify the museums which are open on both Sunday and Monday. Display museum name, city

SELECT m.name, m.city
FROM museum m
JOIN museum_hours h ON m.museum_id = h.museum_id
WHERE h.day IN ('Sunday', 'Monday')
GROUP BY m.museum_id, m.name, m.city
HAVING COUNT(DISTINCT h.day) = 2;

------------------------------------------------
8.How many museums are open every single day?

SELECT museum_id
FROM museum_hours
GROUP BY museum_id
HAVING COUNT(DISTINCT day) = 7;
 
 --------------------------------------------
 9.Which are the top 5 most popular museum? (Popularity is defined based on most 
no of paintings in a museum)

select museum_id,count(work_id) from work 
group by museum_id
order by count(work_id) desc
limit 5;

----------------------------------------
10.Who are the top 5 most popular artist? (Popularity is defined based on most no of 
paintings done by an artist

select artist_id,count(work_id) from work
group by artist_id 
order by count(work_id) desc
limit 5;

----------------------------------------
11.-Which museum is open for the longest during a day. Dispay museum name, state 
and hours open and which day?


select m.name,m.state,h.day,
 TIMESTAMPDIFF(HOUR, 
 STR_TO_DATE (h.open,'%h:%i:%p'), 
 STR_TO_DATE (h.close,'%h:%i:%p')) as duration
from museum_hours h join museum m
on m.museum_id=h.museum_id
order by duration desc
limit 1;
-----------------------------------------------------
12. Which museum has the most no of most popular painting style?
use painting;
select m.museum_id ,count(distinct w.style)from museum m join work w
on m.museum_id=w.museum_id
group by m.museum_id
order by count(distinct w.style) desc
limit 1;
---------------------------------------------------------
13.Identify the artists whose paintings are displayed in multiple countries

SELECT w.artist_id, COUNT(DISTINCT m.country) AS country_count
FROM museum m
JOIN work w ON m.museum_id = w.museum_id
GROUP BY w.artist_id
HAVING country_count > 1;
--------------------------------------------------------------
14. How many paintings are displayed in a  museum_id 35? (we alreay created stored procedure)
CALL getTotalPaintings(35);
select * from work;
----------------
15.check the audit_log table by adding one records in work

INSERT INTO work (work_id, name, artist_id, style, museum_id) 
VALUES (5625,'Still Life with Fruit and post', 751,  'Renaissance', 43);
To check:select * from painting_audit_log;

