WITH user_profile AS (
  SELECT 
    userid,
    CASE 
      WHEN province = 'none' THEN 'uncategorised'
      WHEN province IS NULL THEN 'uncategorised'
      WHEN province = ' ' THEN 'uncategorised'
      WHEN province = 'None' THEN 'uncategorised'
      ELSE province
     END AS Region,
     Age,
    CASE
      WHEN age = 0 THEN 'infant'
      WHEN age BETWEEN 1 AND 12 THEN 'child'
      WHEN age BETWEEN 13 AND 19 THEN 'teenager'
      WHEN age BETWEEN 20 AND 35 THEN 'youth'
      WHEN age BETWEEN 36 AND 50 THEN 'adult'
      WHEN age BETWEEN 51 AND 60 THEN 'elder'
      WHEN age > 60 THEN 'pensioner'
      ELSE 'unknown'
    END AS Age_Group,
    CASE 
      WHEN (email IS NOT NULL) AND (email <> '') AND (email NOT IN ('none','other')) THEN 1
      ELSE 0
    END AS Email_flag,
    CASE 
      WHEN (`Social Media Handle` IS NOT NULL) AND (`Social Media Handle` <> '') AND (`Social Media Handle` NOT IN ('none','other')) THEN 1
      ELSE 0
    END AS Social_Media_flag,
    CASE  
      WHEN gender = 'none' THEN 'unknown'
      WHEN gender IS NULL THEN 'unknown'
      WHEN gender = ' ' THEN 'unknown'
      WHEN gender = 'None' THEN 'unknown'
      ELSE gender
    END AS Gender,
    CASE 
      WHEN race = 'none' THEN 'unknown'
      WHEN race IS NULL THEN 'unknown'
      WHEN race = ' ' THEN 'unknown'
      WHEN race = 'None' THEN 'unknown'
      ELSE race
    END AS Race
  FROM catbrighttv.catbrighschema.user_profiles
),
viewership AS (
  SELECT 
    COALESCE(userid0, userid4) AS userid,
    DATE_FORMAT(RecordDate2, 'yyyy-MM-dd') AS month_id,
    TO_DATE(RecordDate2) AS watch_date,
    DATE_FORMAT(RecordDate2, 'HH:mm:ss') AS watch_time,
    DATE_FORMAT(RecordDate2, 'yyyy-MM') AS month,
    DAYNAME(TO_DATE(RecordDate2)) AS day_name,
    CASE
      WHEN DAYNAME(TO_DATE(RecordDate2)) IN ('Saturday', 'Sunday') THEN 'weekend'
      ELSE 'weekday'
    END AS day_type,
    MONTHNAME(TO_DATE(RecordDate2)) AS month_Name,
    CASE
      WHEN Channel2 IN ('suppersport', 'live events', 'live on suppersport') THEN 'live event'
      WHEN Channel2 IN ('sawseed', 'sawsee') THEN 'sawsee'
      WHEN Channel2 ='suppersport live events' THEN 'suppersport live events'
      WHEN Channel2 ='sawseed' THEN 'sawsee'     
     ELSE Channel2
    END AS Tv_Channel,
    CASE
      WHEN DATE_FORMAT(RecordDate2, 'HH:mm:ss') BETWEEN '00:00:00' AND '05:59:59' THEN '01 midnight'
      WHEN DATE_FORMAT(RecordDate2, 'HH:mm:ss') BETWEEN '06:00:00' AND '11:59:59' THEN '02 morning'
      WHEN DATE_FORMAT(RecordDate2, 'HH:mm:ss') BETWEEN '12:00:00' AND '17:59:59' THEN '03 afternoon'
      WHEN DATE_FORMAT(RecordDate2, 'HH:mm:ss') BETWEEN '18:00:00' AND '23:59:59' THEN '04 evening'
    END AS Time_of_day,
    DATE_FORMAT(`Duration 2`, 'HH:mm:ss') AS Duration,
    (
      HOUR(TO_TIMESTAMP(`Duration 2`, 'HH:mm:ss'))
      + MINUTE(TO_TIMESTAMP(`Duration 2`, 'HH:mm:ss'))/60.0
      + SECOND(TO_TIMESTAMP(`Duration 2`, 'HH:mm:ss'))/3600.0
    ) AS Duration_hours,
    CASE
      WHEN `Duration 2` BETWEEN '00:05:00' AND '00:30:00' THEN '01 light usage:<30 mins'
      WHEN `Duration 2` BETWEEN '00:30:01' AND '00:59:59' THEN '02 medium usage:30 mins-1 hr'
      WHEN `Duration 2` BETWEEN '01:00:00' AND '01:30:00' THEN '03 heavy usage:1 hr-1 hr 30 mins'
      WHEN `Duration 2` BETWEEN '01:30:01' AND '02:00:00' THEN '04 very heavy usage:1 hr 30 mins-2 hrs'
      ELSE '05 extreme usage:>2 hrs'
    END AS screen_time_bucket,
    HOUR(RecordDate2) AS hour_of_day
  FROM catbrighttv.catbrighschema.viewerships
)
SELECT
  COALESCE(A.userid, B.userid) AS SUBID,
  month_id,
  watch_date,
  day_name,
  day_type,
  month_Name,
  Tv_Channel,
  Time_of_day,
  Duration,
  Duration_hours,
  screen_time_bucket,
  hour_of_day,
  Region,
  Age_Group,
  Email_flag,
  Social_Media_flag,
  Gender,
  Race
FROM viewership AS A
LEFT JOIN user_profile AS B
ON A.userid = B.userid
