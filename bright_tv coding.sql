-- Databricks notebook source
-- user profiles table
SELECT *
FROM catbrighttv.catbrighschema.user_profiles;

SELECT *
FROM catbrighttv.catbrighschema.viewerships;



-- gender checks
SELECT DISTINCT gender
FROM catbrighttv.catbrighschema.user_profiles;

SELECT DISTINCT 
CASE
 WHEN gender = 'None' THEN 'unknown'
 WHEN gender = ' ' THEN 'unknown'
 WHEN gender IS NULL THEN 'unknown'
 ELSE gender
END AS cleaned_gender
FROM catbrighttv.catbrighschema.user_profiles;

-- Race checks
SELECT DISTINCT race
FROM catbrighttv.catbrighschema.user_profiles;

SELECT DISTINCT 
CASE
 WHEN race='other' THEN 'unknown'
 WHEN race = 'None' THEN 'unknown'
 WHEN race = ' ' THEN 'unknown'
 WHEN race IS NULL THEN 'unknown'
 ELSE race
END AS cleaned_race
FROM catbrighttv.catbrighschema.user_profiles;

-- province checks
SELECT DISTINCT province
FROM catbrighttv.catbrighschema.user_profiles;

SELECT DISTINCT
   CASE
 WHEN province = 'None' THEN 'unknown'
 WHEN province = ' ' THEN 'unknown'
 WHEN province IS NULL THEN 'unknown'
 ELSE province
END AS cleaned_province
FROM catbrighttv.catbrighschema.user_profiles;

-- age checks
SELECT MIN(age) AS min_age, MAX(age) AS max_age,
AVG(age) AS avg_age
FROM catbrighttv.catbrighschema.user_profiles;

SELECT 
  CASE WHEN age = 0 THEN 'infant'
       WHEN age BETWEEN 1 AND 12 THEN 'kids'
       WHEN age BETWEEN 13 AND 17 THEN 'yourth'
        WHEN age BETWEEN 18 AND 35 THEN 'young_adult'
       WHEN age BETWEEN 36 AND 50 THEN 'adult'
       WHEN age >50 AND AGE<=60 THEN 'elder'
       WHEN age >60 THEN 'pensioner'
       ELSE 'unknown'
       END AS age_group
FROM catbrighttv.catbrighschema.user_profiles;
-- social media checks
SELECT DISTINCT `Social Media Handle`
FROM catbrighttv.catbrighschema.user_profiles;

SELECT DISTINCT
CASE
 WHEN `Social Media Handle` = 'None' THEN 'unknown'
 WHEN `Social Media Handle` = ' ' THEN 'unknown'
 WHEN `Social Media Handle` IS NULL THEN 'unknown'
 ELSE `Social Media Handle`
END AS cleaned_social_media_handle
FROM catbrighttv.catbrighschema.user_profiles;


CREATE OR REPLACE TEMP VIEW user_profiles_cleaned AS
SELECT 
  UserID,
  Name,
  Surname,
  Email,
  Gender,
  Race,
  Age,
  Province,
  `Social Media Handle`,
  CASE
   WHEN gender = 'None' THEN 'unknown'
   WHEN gender = ' ' THEN 'unknown'
   WHEN gender IS NULL THEN 'unknown'
   ELSE gender
  END AS cleaned_gender,
  CASE
   WHEN race='other' THEN 'unknown'
   WHEN race = 'None' THEN 'unknown'
   WHEN race = ' ' THEN 'unknown'
   WHEN race IS NULL THEN 'unknown'
   ELSE race
  END AS cleaned_race,
  CASE
   WHEN province = 'None' THEN 'unknown'
   WHEN province = ' ' THEN 'unknown'
   WHEN province IS NULL THEN 'unknown'
   ELSE province
  END AS cleaned_province,
  CASE
   WHEN age = 0 THEN 'infant'
   WHEN age BETWEEN 1 AND 12 THEN 'kids'
   WHEN age BETWEEN 13 AND 17 THEN 'yourth'
   WHEN age BETWEEN 18 AND 35 THEN 'young_adult'
   WHEN age BETWEEN 36 AND 50 THEN 'adult'
   WHEN age >50 AND age<=60 THEN 'elder'
   WHEN age >60 THEN 'pensioner'
   ELSE 'unknown'
  END AS age_group
FROM catbrighttv.catbrighschema.user_profiles;
