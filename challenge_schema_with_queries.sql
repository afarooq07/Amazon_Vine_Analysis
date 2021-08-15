CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

select count(*)
from review_id_table;
--total count = 380604


-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

select count(*)
from products_table;
-- total count = 77023

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

select count(*)
from customers_table;
--- total count = 210029


-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

select count(*)
from vine_table;
--Total count = 380604



--------------------- Query Analysis ------------------------
select *
from vine_table
where total_votes >=20
-- and helpful_votes/total_votes*100 >= 50
;

select * --count(*) -- t.*
from vine_table t
where  vine = 'Y'

select * --count(*)
from
(		
select count(*) -- t.*
from vine_table t
where total_votes >=20
AND CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT)*100 >= 50
and vine = 'N'
	--and star_rating = 5
;	
) t
where 
