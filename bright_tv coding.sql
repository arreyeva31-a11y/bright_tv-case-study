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
FROM catbrighttv.catbrighschema.user_profiles


