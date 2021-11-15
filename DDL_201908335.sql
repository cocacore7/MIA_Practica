create database PracticaMIA
use PracticaMIA

create table TEMPORAL(
	iso_code VARCHAR(100),
	continent VARCHAR(100),
	location VARCHAR(100),
	date VARCHAR(100),
	total_cases VARCHAR(100),
	new_cases VARCHAR(100),
	new_cases_smoothed VARCHAR(100),
	total_deaths VARCHAR(100),
	new_deaths VARCHAR(100),
	new_deaths_smoothed VARCHAR(100),
	total_cases_per_million VARCHAR(100),
	new_cases_per_million VARCHAR(100),
	new_cases_smoothed_per_million VARCHAR(100),
	total_deaths_per_million VARCHAR(100),
	new_deaths_per_million VARCHAR(100),
	new_deaths_smoothed_per_million VARCHAR(100),
	reproduction_rate VARCHAR(100),
	icu_patients VARCHAR(100),
	icu_patients_per_million VARCHAR(100),
	hosp_patients VARCHAR(100),
	hosp_patients_per_million VARCHAR(100),
	weekly_icu_admissions VARCHAR(100),
	weekly_icu_admissions_per_million VARCHAR(100),
	weekly_hosp_admissions VARCHAR(100),
	weekly_hosp_admissions_per_million VARCHAR(100),
	new_tests VARCHAR(100),

	total_tests VARCHAR(100),
	total_tests_per_thousand VARCHAR(100),
	new_tests_per_thousand VARCHAR(100),
	new_tests_smoothed VARCHAR(100),
	new_tests_smoothed_per_thousand VARCHAR(100),
	positive_rate VARCHAR(100),
	tests_per_case VARCHAR(100),
	tests_units VARCHAR(100),
	total_vaccinations VARCHAR(100),
	people_vaccinated VARCHAR(100),
	people_fully_vaccinated VARCHAR(100),
	new_vaccinations VARCHAR(100),
	new_vaccinations_smoothed VARCHAR(100),
	total_vaccinations_per_hundred VARCHAR(100),
	people_vaccinated_per_hundred VARCHAR(100),
	people_fully_vaccinated_per_hundred VARCHAR(100),
	new_vaccinations_smoothed_per_million VARCHAR(100),
	stringency_index VARCHAR(100),
	population VARCHAR(100),
	population_density VARCHAR(100),
	median_age VARCHAR(100),
	aged_65_older VARCHAR(100),
	aged_70_older VARCHAR(100),
	gdp_per_capita VARCHAR(100),
	extreme_poverty VARCHAR(100),
	cardiovasc_death_rate VARCHAR(100),

	diabetes_prevalence VARCHAR(100),
	female_smokers VARCHAR(100),
	male_smokers VARCHAR(100),
	handwashing_facilities VARCHAR(100),
	hospital_beds_per_thousand VARCHAR(100),
	life_expectancy VARCHAR(100),
	human_development_index VARCHAR(100),
	excess_mortality VARCHAR(100)
);

create table RESIDENCIA(
	iso_code CHAR(100) not null,
	continent varchar(100) not null,
	location varchar(100) not null,
	primary key(iso_code)
);

create table TOTAL_CASOS(
	id_total_casos int primary key identity not null,
	total_cases int not null,
	total_deaths int not null,
	total_cases_per_millon float not null,
	total_deaths_per_millon float not null
);

create table TOTAL_PRUEBA(
	id_total_prueba int primary key identity not null,
	total_test int not null,
	total_test_per_thousand float not null,
	test_units varchar(100) not null
);

create table TOTAL_VACUNA(
	id_total_vacuna int primary key identity not null,
	total_vaccinations bigint not null,
	people_vaccinated int not null,
	people_fully_vaccinated int not null,
	total_vaccinations_per_hundred float not null,
	people_vaccinated_per_hundred float not null,
	people_fully_vacinated_per_hundred float not null
);

create table SOCIAL(
	id_social int primary key identity not null,
	gdp_per_capita float not null,
	extreme_poverty float not null,
	cardiovasc_death_rate float not null,
	diabetes_prevalence float not null,
	female_smokers float not null,
	male_smokers float not null,
	handwashing_facilities float not null,
	hospital_beds_per_thousand float not null,
	life_expectancy float not null,
	human_development_index float not null,
	excess_mortality float not null,
	stringency_index float not null
);

create table POBLACION(
	id_poblacion int primary key identity not null,
	population bigint not null,
	population_density float not null,
	median_age float not null,
	aged_65_older float not null,
	aged_70_older float not null
);

create table CASOS_DIA(
	id_casos_dia int primary key identity not null,
	new_cases int not null,
	new_deaths int not null,
	new_cases_per_million float not null,
	new_deaths_per_million float not null,
	reproduction_rate float not null
);

create table PRUEBA_DIA(
	id_prueba_dia int primary key identity not null,
	new_tests int not null,
	new_tests_per_thousand float not null
);

create table VACUNA_DIA(
	id_vacuna_dia int primary key identity not null,
	new_vaccinations int not null
);

create table HOSPITAL_DIA(
	id_hospital_dia int primary key identity not null,
	icu_patients int not null,
	icu_patients_per_million float not null,
	hosp_patients int not null,
	hosp_patients_per_million float not null
);

create table CASOS_PROMEDIO(
	id_casos_promedio int primary key identity not null,
	new_cases_smoothed float not null,
	new_deaths_smoothed float not null,
	new_cases_smoothed_per_million float not null,
	new_deaths_smoothed_per_million float not null
);

create table PRUEBA_PORMEDIO(
	id_prueba_promedio int primary key identity not null,
	new_tests_smoothed float not null,
	new_tests_smoothed_per_thousand float not null
);

create table VACUNA_PROMEDIO(
	id_vacuna_promedio int primary key identity not null,
	new_vaccinations_smoothed float not null,
	new_vaccinations_smoothed_per_million float not null
);

create table HOSPITAL_PROMEDIO(
	id_hospital_promedio int primary key identity not null,
	weekly_icu_admissions float not null,
	weekly_icu_admissions_per_million float not null,
	weekly_hosp_admissions float not null,
	weekly_hosp_admissions_per_million float not null,
	positive_rate float not null,
	test_per_case float not null
);

create table REPORTE(
	id_reporte int primary key identity not null,
	iso_code CHAR(100) not null,
	fecha date not null,
	id_total_casos int not null,
	id_total_prueba int not null,
	id_total_vacuna int not null,
	id_social int not null,
	id_poblacion int not null,
	id_casos_dia int not null,
	id_prueba_dia int not null,
	id_vacuna_dia int not null,
	id_hospital_dia int not null,
	id_casos_promedio int not null,
	id_prueba_promedio int not null,
	id_vacuna_promedio int not null,
	id_hospital_promedio int not null,
	foreign key (iso_code) references RESIDENCIA(iso_code) on update cascade on delete cascade,
	foreign key (id_total_casos) references TOTAL_CASOS(id_total_casos) on update cascade on delete cascade,
	foreign key (id_total_prueba) references TOTAL_PRUEBA(id_total_prueba) on update cascade on delete cascade,
	foreign key (id_total_vacuna) references TOTAL_VACUNA(id_total_vacuna) on update cascade on delete cascade,
	foreign key (id_social) references SOCIAL(id_social) on update cascade on delete cascade,
	foreign key (id_poblacion) references POBLACION(id_poblacion) on update cascade on delete cascade,
	foreign key (id_casos_dia) references CASOS_DIA(id_casos_dia) on update cascade on delete cascade,
	foreign key (id_prueba_dia) references PRUEBA_DIA(id_prueba_dia) on update cascade on delete cascade,
	foreign key (id_vacuna_dia) references VACUNA_DIA(id_vacuna_dia) on update cascade on delete cascade,
	foreign key (id_hospital_dia) references HOSPITAL_DIA(id_hospital_dia) on update cascade on delete cascade,
	foreign key (id_casos_promedio) references CASOS_PROMEDIO(id_casos_promedio) on update cascade on delete cascade,
	foreign key (id_prueba_promedio) references PRUEBA_PORMEDIO(id_prueba_promedio) on update cascade on delete cascade,
	foreign key (id_vacuna_promedio) references VACUNA_PROMEDIO(id_vacuna_promedio) on update cascade on delete cascade,
	foreign key (id_hospital_promedio) references HOSPITAL_PROMEDIO(id_hospital_promedio) on update cascade on delete cascade,
);