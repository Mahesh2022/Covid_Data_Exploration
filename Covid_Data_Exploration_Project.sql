use Portfolioprojectby_MB
-- Covid 19 Data Exploration 

SELECT * 
FROM Portfolioprojectby_MB..CovidDeaths

SELECT * 
FROM Portfolioprojectby_MB..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4


--SELECT * 
--FROM Portfolioprojectby_MB..CovidVaccinations
--ORDER BY 3,4	


-- Select Data that we are going to starting 

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1,2
		
--Looking at Total cases VS Total Deaths 

SELECT location, date,  CAST(total_cases as numeric) as total_cases, total_deaths,
(total_deaths/CAST(total_cases as numeric))*100 as Death_Percentage
FROM CovidDeaths
ORDER BY 1,2

--Looking at Total cases Vs Total Deaths in India 

SELECT location, date, CAST(total_cases as numeric) as total_cases, total_deaths,
(total_deaths/CAST(total_cases as numeric))*100 as Deaths_Percentage
FROM CovidDeaths
WHERE location like 'India'
Order By 1,2

--Looking as Total cases Vs Population
--Shows what percentage of population got covid 

SELECT location, date,  population, total_cases,
(total_cases/population)*100 as Percentage_population
FROM CovidDeaths
WHERE location like	'India'
Order By 1,2 


--Lookng at countries with highest infection rate compared to population

Select location, population, MAX(total_cases) as Highest_Infection,
MAX(total_cases/population)*100 as Population_Percentage_Infected
FROM CovidDeaths
--WHERE location like 'India'
Group by location,population
Order By Population_Percentage_Infected DESC

--Showing Countries with Highest Death Count per Population 

Select location, MAX(CAST(Total_deaths as int)) as TotalDeathCount
FROM CovidDeaths
--WHERE location like 'India'
Group by location
Order By TotalDeathCount DESC

