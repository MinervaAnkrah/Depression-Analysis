-- getting the number of depressed males and females
Select 
	if(sex = 1, 'Male', 'Female') as gender, 
    round(avg(age), 0) as average_age, 
    Count(survey_id) as number_of_patients,
    min(age),
    max(age)
From depression_excel
Where depressed=1
Group by depressed, sex;

-- living expenses for depressed patients
Select 
	if(sex=1,'Male','Female') as sex, sum(living_expenses) as living_expenses,
    if(depressed=1,'Depressed', 'Not depressed') as depression_status
From depression_excel de
join depression_excel_assets da
	on de.survey_id = da. survey_id
group by depressed, sex;

-- finding the ages and number of people depressed
Select 
	DISTINCT(age), IF(sex=1, 'Male','Female') AS gender,
    count(survey_id) as number_depressed, 
    if(depressed=0,'Not depressed', 'depressed') as depression_status
From depression_excel de
where depressed = 1 
group by age, sex;

-- finding the number of males depressed for different ages
Select 
	DISTINCT(age), IF(sex=1, 'Male','Female') AS gender,
    count(survey_id) as number_depressed, 
    if(depressed=0,'Not depressed', 'depressed') as depression_status
From depression_excel de
where depressed = 1 && sex=1
group by age, sex;

-- finding the number of females depressed for different ages
Select 
	DISTINCT(age), IF(sex=1, 'Male','Female') AS gender,
    count(survey_id) as number_depressed, 
    if(depressed=0,'Not depressed', 'depressed') as depression_status
From depression_excel de
where depressed = 1 && sex=0
group by age, sex;
