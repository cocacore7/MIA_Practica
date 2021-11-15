use PracticaMIA

select * from TEMPORAL
select * from RESIDENCIA
select * from TOTAL_CASOS
select * from TOTAL_PRUEBA
select * from TOTAL_VACUNA
select * from SOCIAL
select * from POBLACION
select * from CASOS_DIA
select * from PRUEBA_DIA
select * from VACUNA_DIA
select * from HOSPITAL_DIA
select * from CASOS_PROMEDIO
select * from PRUEBA_PORMEDIO
select * from VACUNA_PROMEDIO
select * from HOSPITAL_PROMEDIO
select * from REPORTE

/*REPORTE 1, TOTAL DE CONTAGIOS POR PAIS*/
select t3.iso_code as PAIS, sum(t1.new_cases) as CANTIDAD_CONTAGIOS from CASOS_DIA t1 
inner join REPORTE t2 on t1.id_casos_dia = t2.id_casos_dia
inner join RESIDENCIA t3 on t2.iso_code = t3.iso_code
group by t3.iso_code
order by CANTIDAD_CONTAGIOS desc

/*REPORTE 2, CANTIDAD DE CONTAGIOS, MUERTES, VACUNADOS PARA GUATEMALA*/
select DATENAME (MONTH, DATEADD(MONTH, MONTH(t2.fecha) - 1, '1900-01-01')) as MES, SUM(t1.new_cases) as TOTAL_CASOS, SUM(t1.new_deaths) as TOTAL_MUERTES, Max(t4.people_vaccinated) as TOTAL_VACUNADOS from CASOS_DIA t1
inner join REPORTE t2 on t1.id_casos_dia = t2.id_casos_dia
inner join VACUNA_DIA t3 on t3.id_vacuna_dia = t2.id_vacuna_dia
inner join TOTAL_VACUNA t4 on t4.id_total_vacuna = t2.id_total_vacuna
where t2.iso_code = 'GTM' and YEAR(t2.fecha) = '2021'
group by month(t2.fecha)

/*REPORTE 3, CANTIDAD DE CONTAGIOS POR CONTINENTE*/
select t3.continent as CONTINENTE, sum(t1.new_cases) as TOTAL_CASOS from CASOS_DIA t1 
inner join REPORTE t2 on t1.id_casos_dia = t2.id_casos_dia
inner join RESIDENCIA t3 on t2.iso_code = t3.iso_code
group by t3.continent
order by TOTAL_CASOS desc

/*REPORTE 4, PROMEDIO CONTAGIOS POR PAIS POR MES*/
select DATENAME (MONTH, DATEADD(MONTH, MONTH(t2.fecha) - 1, '1900-01-01')) as MES, t2.iso_code as PAIS, avg(t1.new_cases) as PROMEDIO_CONTAGIOS from CASOS_DIA t1 
inner join REPORTE t2 on t1.id_casos_dia = t2.id_casos_dia
where YEAR(t2.fecha) = '2021'
group by month(t2.fecha),t2.iso_code
order by t2.iso_code,month(t2.fecha)

/*REPORTE 5, TOP 10 PAISES QUE HAN REALIZADO MAS PRUEBAS*/
select top 10 t3.iso_code as PAIS, SUM(t1.new_tests) as PRUEBAS_DIARIAS from PRUEBA_DIA t1 
inner join REPORTE t2 on t1.id_prueba_dia = t2.id_prueba_dia
inner join RESIDENCIA t3 on t2.iso_code = t3.iso_code
group by t3.iso_code
order by PRUEBAS_DIARIAS DESC

/*REPORTE 6, TOP 10 PAISES QUE HAN TENIDO LA MAYOR CANTIDAD DE PERSONAS VACUNADAS*/
select top 10 t3.iso_code as PAIS, max(t1.people_vaccinated) as PERSONAS_VACUNADAS from TOTAL_VACUNA t1 
inner join REPORTE t2 on t1.id_total_vacuna = t2.id_total_vacuna
inner join RESIDENCIA t3 on t2.iso_code = t3.iso_code
group by t3.iso_code
order by PERSONAS_VACUNADAS DESC

/*REPORTE 7, TOP 10 PAISES CON MAYOR CANTIDAD DE CONTAGIOS*/
select top 10 t3.iso_code as PAIS, sum(t1.new_cases) as CONTAGIOS from CASOS_DIA t1 
inner join REPORTE t2 on t1.id_casos_dia = t2.id_casos_dia
inner join RESIDENCIA t3 on t2.iso_code = t3.iso_code
group by t3.iso_code
order by CONTAGIOS DESC

/*REPORTE 8, PROCEDURE ENTRE N Y M CANTIDAD DE CONTAGIOS*/
create procedure dbo.cantContagios
@n int, @m int
as 
begin
	select t2.iso_code as PAIS, max(t1.total_cases) as CANTIDAD_CONTAGIOS from TOTAL_CASOS t1 
	inner join REPORTE t2 on t1.id_total_casos = t2.id_total_casos
	where total_cases between @n AND @m
	group by t2.iso_code
	order by CANTIDAD_CONTAGIOS desc
end

exec dbo.cantContagios 0,1000000


/*REPORTE 9, NUEVOS CASOS, TOTAL CASOS, NUEVAS PRUEBAS, TOTAL PRUEBAS, NUEVAS MUERTES, TOTAL MUERTES EN GUATEMALA*/
select t2.iso_code as PAIS, SUM(t1.new_cases) as NUEVOS_CASOS, max(t3.total_cases) as TOTAL_CASOS, SUM(t4.new_tests) as NUEVAS_PRUEBAS, max(t5.total_test) as TOTAL_PRUEBAS, SUM(t1.new_deaths) as NUEVAS_MUERTES, max(t3.total_deaths) as TOTAL_MUERTES 
from CASOS_DIA t1 
inner join REPORTE t2 on t1.id_casos_dia = t2.id_casos_dia
inner join TOTAL_CASOS t3 on t3.id_total_casos = t2.id_total_casos
inner join PRUEBA_DIA t4 on t4.id_prueba_dia = t2.id_total_casos
inner join TOTAL_PRUEBA t5 on t5.id_total_prueba = t2.id_total_casos
where t2.iso_code = 'GTM' and t2.fecha BETWEEN '20210101' AND '20211206'
group by t2.iso_code

/*REPORTE 10, PAISES ORDENADOS DE MAS A MENOS CANTIDAD DE CONTAGIOS*/
select t2.iso_code as PAIS, SUM(t1.new_cases) as CANTIDA_CONTAGIOS
from CASOS_DIA t1 
inner join REPORTE t2 on t1.id_casos_dia = t2.id_casos_dia
inner join RESIDENCIA t3 on t3.iso_code = t2.iso_code
and (t2.iso_code = 'ARG'
or t2.iso_code = 'BOL'
or t2.iso_code = 'BRA'
or t2.iso_code = 'CHL'
or t2.iso_code = 'COL'
or t2.iso_code = 'CRI'
or t2.iso_code = 'CUB'
or t2.iso_code = 'ECU'
or t2.iso_code = 'SLV'
or t2.iso_code = 'GRD'
or t2.iso_code = 'GTM'
or t2.iso_code = 'GUY'
or t2.iso_code = 'HTI'
or t2.iso_code = 'HND'
or t2.iso_code = 'JAM'
or t2.iso_code = 'MEX'
or t2.iso_code = 'NIC'
or t2.iso_code = 'PRY'
or t2.iso_code = 'PAN'
or t2.iso_code = 'PER'
or t2.iso_code = 'PRI'/*Este No Esta*/
or t2.iso_code = 'DOM'
or t2.iso_code = 'SUR'
or t2.iso_code = 'URY'
or t2.iso_code = 'VEN')
where (t3.continent = 'North America')  
or (t3.continent = 'South America') 
and (t2.fecha BETWEEN '20210101' AND '20211206') 
group by t2.iso_code
order by CANTIDA_CONTAGIOS desc
