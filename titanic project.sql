create database titanic_project;

use titanic_project;

-- import data from csv files

show tables;

select * from titanic;

-- 1. Show the first 5 rows of the dataset.
select * from titanic limit 5;
select * from titanic
order by passengerid asc
limit 5;

-- 2. Find the number of passengers who survived.
select count(survived) as survived_passenger 
from titanic 
where survived=1;

-- 3. Find the average age of all passengers.
select avg(age) 
from titanic;

-- 4. Find the number of passengers in each class.
select pclass,count(*) as passenger_class 
from titanic 
group by pclass;

-- 5. Find the first 10 rows of the dataset sorted by passenger class in descending order.
select pclass from titanic
order by pclass desc
limit 10;

-- 6. Find the number of passengers in each class sorted by class in ascending order.
select pclass, count(*) as number_of_passenger
from titanic 
group by pclass 
order by pclass asc;

-- 7. Find the average fare paid by passengers in each class.
select pclass, avg(fare) as avg_fare_paid
from titanic 
group by pclass 
order by pclass;

-- 8. Find the name of the passenger with the highest fare.
select max(fare) as highest_fare 
from titanic
where fare = (select max(fare) from titanic);

-- 9. Find the name of the passenger who had the highest age among the survivors.
select name, age
from titanic
where age = (select max(age) from titanic where survived =1);

-- 10. Find the number of passengers who paid more than the average fare.
select count(passengerId) as num_of_passenger
from titanic 
where fare > (select avg(fare) from titanic);

-- 11. Find the name of the passenger who had the most parents or children on board.
select name
from titanic 
where parch = (select max(parch) from titanic);

-- 12. Find the number of male and female passengers who survived and order the results by sex in ascending order:
select sex, count(*) as survived_person
from titanic 
where survived = 1 
group by sex 
order by sex asc;

-- 13. Find the name, age, and fare of the oldest passenger who survived.
select name,age,fare 
from titanic 
where age = (select max(age) from titanic where survived = 1);

-- 14. Find the name and age of the youngest female passenger who survived in third class.
select name, age,pclass
from titanic 
where sex = ('female' and pclass = 3 and survived = 1) 
and age = (select min(Age) 
from titanic
where Sex = "female" and Pclass = 3 and Survived = 1);

-- 15. Find Number of male and female passengers.
select 
sum(case when sex = "male" then 1 end ) as num_male, 
sum(case when sex = "female" then 1 end) as num_female 
from titanic;

-- 16. Select all passengers who traveled in a cabin that was not shared by other passengers.
select cabin
from titanic  
group by cabin 
having count(*)>1;

select * from titanic 
where cabin not in 
(select Cabin from titanic group by cabin having count(*) > 1);