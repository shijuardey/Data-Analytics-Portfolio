-- Project: [Donor and Donation Data Analysis using SQL]
-- Author: [Sijuade Enikansakin]
-- Date: [2026-06-14]
-- Database: [PostgreSQL 18]
-- Description:[This report presents a comprehensive SQL-based analysis of donor and donation data.]



--Preview of Donation data
	select * from donation_data;


--Preview of Donor data
	select * from donor_data;


--Number of rows in Donation data
	select count(*) from donation_data;


--Number of rows in Donor data
	select count(*) from donor_data;


--Check for Null values in University and Second_language
	select count(*) as total_rows,
	count(*)-count(university) as uni_null_count,
	round(100 * (count(*)-count(university))/count(*),2)
	as uni_null_rate,
	count(*)-count(second_language) as lang_null_count,
	round(100 * (count(*)-count(second_language))/count(*),2)
	as lang_null_rate
	from donor_data;


--Top Donating states
	select state, max(donation) as max_donation
	from donation_data
	group by state
	order by max(donation) desc;


--Analysis on donation_frequency
	select donation_frequency, count(*) as donation_count
	from donor_data
	group by donation_frequency
	order by count(*) desc;


--Sum, Average, Minimum and Maximum donations
	create view donation_aggregates as
	select sum(donation) as total_donated,
	round(avg(donation),2) as avg_donated,
	min(donation) as min_donated,
	max(donation) as max_donated
	from donation_data;



--Checking if both tables id match from donation_data
	select d.id
	from donation_data as d
	left join donor_data as dd on d.id=dd.id
	where dd.id is null;


--Checking if both tables id match from donor data
	select dd.id
	from donor_data as dd
	left join donation_data as d on dd.id=d.id
	where d.id is null;


--Check for duplicate IDs
	select id, count(*) as duplicate_count
	from donation_data
	group by id
	having count(*)>1;


/* Data Cleaning and Transformation */
--Donation aggregates by donation Frequency
	create view frequency_aggregates as
	select donation_frequency,
	sum(donation) as total_donated,
	count(donation) as donor_count,
	round(avg(donation),2) as avg_donated,
	max(donation) as max_donated,
	min(donation) as min_donated
	from donation_data as d
	inner join donor_data as dd
	on d.id=dd.id
	group by donation_frequency
	order by sum(donation) desc;


--Donation aggregates by states
	create view state_donation as
	select state,
	sum(donation) as total_donated,
	count(donation) as donor_count,
	round(avg(donation),2) as avg_donated,
	max(donation) as max_donated,
	min(donation) as min_donated
	from donation_data
	group by state
	order by sum(donation) desc;


--Donation aggregates by gender
	create view gender_donation as
	select gender,
	sum(donation) as total_donated,
	count(donation) as donor_count,
	round(avg(donation),2) as avg_donated,
	max(donation) as max_donated,
	min(donation) as min_donated
	from donation_data
	group by gender
	order by sum(donation) desc;


--Donation aggregates by job_field
	create view job_field_aggregates as
	select job_field,
	sum(donation) as total_donated,
	count(donation) as donor_count,
	round(avg(donation),2) as avg_donated,
	max(donation) as max_donated,
	min(donation) as min_donated
	from donation_data
	group by job_field
	order by sum(donation) desc;


--Donation aggregates by donor car
	create view car_aggregates as
	select car,
	sum(donation) as total_donated,
	count(donation) as donor_count,
	round(avg(donation),2) as avg_donated,
	max(donation) as max_donated,
	min(donation) as min_donated
	from donation_data as d
	inner join donor_data as dd
	on d.id=dd.id
	group by car
	order by sum(donation) desc;


--Donors by full name
	create view name as
	select id,concat(first_name,' ',last_name) as full_name
	from donation_data;


--Table of null donors by university
	create view null_uni_donor as
	select d.id,full_name,university, 
	donation, gender,
	job_field, state,
	donation_frequency, car
	from donation_data as d
	inner join donor_data as dd on d.id=dd.id
	inner join name as n on dd.id=n.id
	where university is null
	group by d.id, university,full_name,donation_frequency,car;
drop view null_language_donor;


--Table of null donors by second_language
	create view null_language_donor as
	select d.id,full_name, second_language, 
	donation, gender,
	job_field, state,
	donation_frequency, car
	from donation_data as d
	inner join donor_data as dd on d.id=dd.id
	inner join name as n on dd.id=n.id
	where second_language is null
	group by d.id, second_language,full_name,donation_frequency,car;

--Donors by full name
	create view name as
	select id,concat(first_name,' ',last_name) as full_name
	from donation_data;



/* BUSINESS QUESTIONS & ANALYSIS */

--Who are the top 10 donors by donation amount?
	select n.id,full_name as donor,max(donation) as donation
	from name as n
	join donation_data as d on n.id=d.id
	group by n.id,full_name
	order by max(donation) desc
	limit 10;


--What is the total and average amount donated?
	select total_donated,avg_donated
	from donation_aggregates;


--Top 5 states with highest donation amount?
select state,total_donated
from state_donation
limit 5;


--Top 5 states with highest number of donors?
	select state, donor_count
	from state_donation
	order by donor_count desc
	limit 5;


--6. How do donations vary by gender?
	select gender,
	donor_count,
	round(100 * donor_count/(select count(*) from donation_data),2) as donor_percentage,
	total_donated,
	round(100 * total_donated/(select sum(donation) from donation_data),2) as donation_percentage
	from gender_donation;


--Top 5 job field with the highest total donations?
	select job_field, total_donated
	from job_field_aggregates
	limit 5;


--Top 5 donation frequency with the highest average donation?
	select donation_frequency, avg_donated
	from frequency_aggregates;


--Are there donors with missing second_language information but high donation amounts?
	select full_name,second_language,donation
	from null_language_donor
	where donation > (
	select avg(donation) from donation_data); 


--Are there donors with missing university information but high donation amounts?
	select full_name,university,donation
	from null_uni_donor
	where donation > (
	select avg(donation) from donation_data);


--What are the most common donation frequencies among donors?
	select donation_frequency, donor_count
	from frequency_aggregates
	order by donor_count desc;





