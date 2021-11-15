use PracticaMIA

insert into RESIDENCIA
select distinct iso_code,continent,location from TEMPORAL where not (continent is null)

insert into TOTAL_CASOS
select convert(int,isnull(total_cases,0)),convert(int,isnull(total_deaths,0)),convert(float,REPLACE(isnull(total_cases_per_million,'0,0'), ',', '.')),convert(float,REPLACE(isnull(total_deaths_per_million,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into TOTAL_PRUEBA
select convert(int,isnull(total_tests,0)),convert(float,REPLACE(isnull(total_tests_per_thousand,'0,0'), ',', '.')),isnull(tests_units,'.') from TEMPORAL where not (continent is null)

insert into TOTAL_VACUNA
select convert(bigint,isnull(total_vaccinations,0)),convert(int,isnull(people_vaccinated,0)),convert(int,isnull(people_fully_vaccinated,0)),convert(float,REPLACE(isnull(total_vaccinations_per_hundred,'0,0'), ',', '.')),convert(float,REPLACE(isnull(people_vaccinated_per_hundred,'0,0'), ',', '.')),convert(float,REPLACE(isnull(people_fully_vaccinated_per_hundred,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into SOCIAL
select convert(float,REPLACE(isnull(gdp_per_capita,'0,0'), ',', '.')),convert(float,REPLACE(isnull(extreme_poverty,'0,0'), ',', '.')),convert(float,REPLACE(isnull(cardiovasc_death_rate,'0,0'), ',', '.')),convert(float,REPLACE(isnull(diabetes_prevalence,'0,0'), ',', '.')),convert(float,REPLACE(isnull(female_smokers,'0,0'), ',', '.')),convert(float,REPLACE(isnull(male_smokers,'0,0'), ',', '.')),convert(float,REPLACE(isnull(handwashing_facilities,'0,0'), ',', '.')),convert(float,REPLACE(isnull(hospital_beds_per_thousand,'0,0'), ',', '.')),convert(float,REPLACE(isnull(life_expectancy,'0,0'), ',', '.')),convert(float,REPLACE(isnull(human_development_index,'0,0'), ',', '.')),convert(float,REPLACE(isnull(excess_mortality,'0,0'), ',', '.')),convert(float,REPLACE(isnull(stringency_index,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into POBLACION
select convert(bigint,isnull(population,0)),convert(float,REPLACE(isnull(population_density,'0,0'), ',', '.')),convert(float,REPLACE(isnull(median_age,'0,0'), ',', '.')),convert(float,REPLACE(isnull(aged_65_older,'0,0'), ',', '.')),convert(float,REPLACE(isnull(aged_70_older,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into CASOS_DIA
select convert(int,isnull(new_cases,0)),convert(int,isnull(new_deaths,0)),convert(float,REPLACE(isnull(new_cases_per_million,'0,0'), ',', '.')),convert(float,REPLACE(isnull(new_deaths_per_million,'0,0'), ',', '.')),convert(float,REPLACE(isnull(reproduction_rate,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into PRUEBA_DIA
select convert(int,isnull(new_tests,0)),convert(float,REPLACE(isnull(new_tests_per_thousand,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into VACUNA_DIA
select convert(int,isnull(new_vaccinations,0)) from TEMPORAL where not (continent is null)

insert into HOSPITAL_DIA
select convert(int,isnull(icu_patients,0)),convert(float,REPLACE(isnull(icu_patients_per_million,'0,0'), ',', '.')),convert(int,isnull(hosp_patients,0)),convert(float,REPLACE(isnull(hosp_patients_per_million,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into CASOS_PROMEDIO
select convert(float,REPLACE(isnull(new_cases_smoothed,'0,0'), ',', '.')),convert(float,REPLACE(isnull(new_deaths_smoothed,'0,0'), ',', '.')),convert(float,REPLACE(isnull(new_cases_smoothed_per_million,'0,0'), ',', '.')),convert(float,REPLACE(isnull(new_deaths_smoothed_per_million,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into PRUEBA_PORMEDIO
select convert(float,REPLACE(isnull(new_tests_smoothed,'0,0'), ',', '.')),convert(float,REPLACE(isnull(new_tests_smoothed_per_thousand,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into VACUNA_PROMEDIO
select convert(float,REPLACE(isnull(new_vaccinations_smoothed,'0,0'), ',', '.')),convert(float,REPLACE(isnull(new_vaccinations_smoothed_per_million,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into HOSPITAL_PROMEDIO
select convert(float,REPLACE(isnull(weekly_icu_admissions,'0,0'), ',', '.')),convert(float,REPLACE(isnull(weekly_icu_admissions_per_million,'0,0'), ',', '.')),convert(float,REPLACE(isnull(weekly_hosp_admissions,'0,0'), ',', '.')),convert(float,REPLACE(isnull(weekly_hosp_admissions_per_million,'0,0'), ',', '.')),convert(float,REPLACE(isnull(positive_rate,'0,0'), ',', '.')),convert(float,REPLACE(isnull(tests_per_case,'0,0'), ',', '.')) from TEMPORAL where not (continent is null)

insert into REPORTE
select iso_code,CONVERT(date,date),ROW_NUMBER() OVER(order by (select 1)),ROW_NUMBER() OVER(order by (select 1)) ,ROW_NUMBER() OVER(order by (select 1)) ,
ROW_NUMBER() OVER(order by (select 1)) ,ROW_NUMBER() OVER(order by (select 1)) ,ROW_NUMBER() OVER(order by (select 1)) ,ROW_NUMBER() OVER(order by (select 1)) ,ROW_NUMBER() OVER(order by (select 1)),
ROW_NUMBER() OVER(order by (select 1)) ,ROW_NUMBER() OVER(order by (select 1)) ,ROW_NUMBER() OVER(order by (select 1)) ,ROW_NUMBER() OVER(order by (select 1)) ,ROW_NUMBER() OVER(order by (select 1)) 
from TEMPORAL where not (continent is null)
