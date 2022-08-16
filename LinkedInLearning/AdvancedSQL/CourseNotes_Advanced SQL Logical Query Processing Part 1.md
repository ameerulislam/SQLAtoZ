Course Title: Advanced SQL: Logical Query Processing, Part 1

Description: SQL has been the dominant data processing language for the past five decades. This course takes you beyond the syntax fundamentals, and into a new world of understanding how relational database management systems process SQL queries, and how that impacts your coding practices. Learn about logical query processing, and avoid most common pitfalls and processing limitations. Discover advanced JOIN techniques and how to deal with missing data. Understand the subtleties of ternary logic, SELECT expression evaluation, grouping logic, and how to implement efficient paging and ordering. By the end of the course, you’ll be able to take advantage of the nuances of logical query processing to easily troubleshoot and solve daunting SQL challenges elegantly and efficiently.  This course was created by Ami Levin. We are pleased to offer this training in our library.


***********************************************
Chapter: Introduction
***********************************************


-----------------------------------------------
Video: Introducing the demo database
-----------------------------------------------
Note Time:         Note Text:                     

0:00:59            The author approves using natural, intelligent keys instead of surrogate keys (auto incremental ids for example) 

0:01:27            surrogate keys can be useful but not one-size-fits-all solution 


-----------------------------------------------
Video: Using the code files
-----------------------------------------------
Note Time:         Note Text:                     

0:01:12            SQL query logical processing order. 
From > Where > Group By > Having > Select > Order By > Offset Fetch 

0:02:10            From (Source Data) > Where (Row Filter) > Group By (Grouping) > Having (Group Filter) > Select (Return Expressions) > Order By (Presentation Order) > Offset Fetch (Paging) 


***********************************************
Chapter: 1. Constructing Query Source Data Sets
***********************************************


-----------------------------------------------
Video: Single data source queries
-----------------------------------------------
Note Time:         Note Text:                     

0:00:12            Interestingly FROM is the first thing that is evaluated. 

0:00:21            From clause is a single virtual / actual table that can be constructed from one or more sources. 

0:02:18            each set is uniquely aliased (column name)
each column is uniquely aliased
sets are ordered 

0:02:49            we can use 
Table
Function
Sub Query 
to derive table 

0:03:51            SELECT * , 'SQL IS FUN' AS FACT
FROM Staff;
this part 'SQL IS FUN' AS FACT creates a new column FACT column and repeats that value as many lines that the table has 


-----------------------------------------------
Video: Dual source query processing
-----------------------------------------------
Note Time:         Note Text:                     

0:00:17            Every join always starts with cartesian product. 

0:00:29            cross join is all that it does.. that is cartesian product. and then passes the result to the next step 

0:00:37            other than cross join processing continues to the next step "Qualification" 

0:00:45            Qualification predicate is specified using on KeyWord 

0:00:52            evaluates each row using the predicate 

0:00:57            which ever the lines evaluates to true will live to see another clause 

0:01:12            Inner join 
step 1. cartesian product
step 2. What ever row evaluated to true according to the predicate On, example A.value = B.value 

0:01:26            Outer Join
1. cartesian product step 
2. What ever row evaluated to true according to the predicate On, example A.value = B.value
3. Reservation, ie one or both source sets will be reserved and preserved as they are even they didn't pass the qualification step. 

0:02:11            Left outer join : reserves the left table and what ever didn't match on the right according to the predicate is represented as NULL
Right outer join: is the opposite of the left
Full outer join: reserves both tables, matches what ever matches and the rest is added as NULL in both sides 

0:02:51            Instead of: 
A INNER JOIN B ON A.X = B.X; 
A INNER JOIN B USING (X); 

0:03:29            use natural join less          


-----------------------------------------------
Video: Joining multiple source data sets
-----------------------------------------------
Note Time:         Note Text:                     

0:00:16            we can join multiple tables
select foo, bar
from A inner join B
on A.X = B.X
Inner join C 
on C.y = B.y
inner join D
on D.z = C.z 

0:04:40            table expression inside the parentheses evaluated first 

0:04:52            Select *
from Animals as A
LEFT OUTER JOIN
( Adoption as AD
INNER JOIN
Person AS P
ON P.Email = AD.Adopter_Email
)
ON AD.Name = A.Name AND AD.Species = A.Species; 

0:05:08            we can also remove the parenthesis if the order is correct
it's called Chiastic Order 

