## 📺 BrightTV Customer Value Management (CVM) Analysis

📊 Project Overview

BrightTV is a subscription-based television service that wants to grow its customer subscription base and increase viewer engagement.

This case study analyzes customer profiles and viewing transactions to identify:

👥 Who BrightTV's customers are

📺 How customers consume content

📅 Viewing trends over time

⏰ When customers watch the most

👨‍👩‍👧‍👦 Which customer groups are most engaged

📉 Which groups have low consumption

💡 Opportunities to increase customer engagement

🚀 Strategies that can help BrightTV grow its subscriber base

The analysis uses data analytics techniques to transform raw customer and viewership data into actionable business insights for Customer Value Management (CVM).

🎯 Business Problem

BrightTV's CEO wants to grow the subscription base and improve customer engagement.

The key business questions addressed in this project are:

1. 👥 Customer Profile

Who are BrightTV's customers?

What are the main age groups?

What is the gender distribution?

Which customer segments have the most subscribers?

2. 📺 Viewing Behaviour

How frequently do customers watch BrightTV?

Which channels are watched the most?

Which content attracts the highest viewership?

What are the viewing patterns across different customer groups?

3. 📅 Usage Trends

Which days have the highest and lowest consumption?

What times of day have the highest viewership?

Are there specific days or periods with unusually low engagement?

4. 📉 Low-Consumption Customers

Which customer segments have low viewing activity?

What factors may contribute to lower consumption?

How can BrightTV increase engagement among these customers?

5. 🚀 Growth Opportunities

What initiatives could increase customer engagement?

What content should BrightTV promote?

How can BrightTV use customer insights to attract and retain subscribers?

🗂️ Dataset

The project uses two main datasets:

👤 User Profile Dataset

Contains information about BrightTV customers.

Typical fields include:

Field

Description

User ID

Unique customer identifier

Age

Customer age

Gender

Customer gender

Subscription Status

Customer subscription information

Other demographic fields

Additional customer characteristics

📺 Viewership Dataset

Contains information about customer viewing activity.

Typical fields include:

Field

Description

User ID

Unique customer identifier

Watch Date

Date the content was watched

Watch Time

Time the content was watched

TV Channel

Channel watched

Content / Programme

Programme or content watched

Viewing Duration

Length of viewing activity

The two datasets were cleaned and combined using User ID to create an analysis-ready dataset.

🛠️ Tools & Technologies

The following tools were used in the analysis:

🧱 Databricks – Data cleaning, SQL analysis and data processing

🗄️ SQL – Data exploration, transformation and analysis

📊 Power BI / Dashboarding tools – Data visualization and KPI reporting

📑 Excel – Exploratory analysis and pivot tables

🐙 GitHub – Project documentation and portfolio management

🔄 Data Analytics Process

The project followed a structured data analytics workflow:

Raw Data
   ↓
Data Exploration
   ↓
Data Cleaning
   ↓
Data Transformation
   ↓
Data Integration
   ↓
Exploratory Data Analysis
   ↓
KPI Development
   ↓
Data Visualization
   ↓
Business Insights
   ↓
Recommendations

🧹 Data Cleaning

Several data-quality checks were performed before analysis.

Data cleaning activities included:

Checking for duplicate records

Identifying missing values

Checking unique customer IDs

Standardizing column names

Correcting data types

Cleaning date fields

Cleaning time fields

Checking channel values

Validating subscription status

Removing or handling invalid records

Preparing datasets for joining

🔗 Data Integration

The User Profile and Viewership datasets were joined using the customer identifier.

Example SQL:

SELECT
    u.user_id,
    u.age,
    u.gender,
    u.subscription_status,
    v.watch_date,
    v.watch_time,
    v.tv_channel,
    v.viewing_duration
FROM user_profile u
INNER JOIN viewership v
    ON u.user_id = v.user_id;

The resulting dataset provided a combined view of:

Customer Profile + Viewing Behaviour

This allowed customer demographics to be compared with their actual viewing activity.

📊 Key KPIs

The dashboard focuses on business-focused KPIs such as:

KPI

Purpose

👥 Total Subscribers

Measures the size of the customer base

📺 Total Viewing Sessions

Measures overall engagement

⏱️ Total Viewing Duration

Measures time spent watching

👤 Active Viewers

Measures customers who actively consume content

📊 Average Viewing Duration

Measures average engagement

📅 Daily Viewership

Identifies usage trends

📺 Top Channels

Identifies popular channels

👥 Subscribers by Age Group

Identifies valuable customer segments

🚻 Subscribers by Gender

Understands customer composition

📉 Low-Consumption Users

Identifies customers requiring engagement strategies

📈 Dashboard Visualizations

The BrightTV dashboard can include the following visualizations:

👥 Customer Demographics

Charts:

Subscribers by Age Group

Subscribers by Gender

Subscription Status Distribution

📺 Content Consumption

Charts:

Viewership by TV Channel

Top 10 Channels

Viewing Duration by Channel

Viewing Sessions by Content

📅 Viewing Trends

Charts:

Daily Viewership Trend

Weekly Viewership

Viewership by Day of Week

Viewership by Hour

🎯 Customer Engagement

Charts:

Viewing Sessions by Age Group

Viewing Duration by Age Group

Engagement by Gender

High vs Low Consumption Customers

🔍 Example Analysis Questions

The analysis answers questions such as:

Who are BrightTV's most active customers?

Which age group has the highest number of subscribers?

Which gender represents the largest customer segment?

Which TV channels receive the highest viewership?

What days have the highest viewing activity?

What days have the lowest viewing activity?

What time of day has the highest consumption?

Which customers have low viewing activity?

What content could BrightTV promote to increase engagement?

💡 Business Insights

The analysis can help BrightTV identify:

1. 👥 Valuable Customer Segments

Identifying age groups and demographic segments with high subscription and viewing activity allows BrightTV to better understand its most valuable customers.

2. 📺 Popular Channels

The most-watched channels provide insights into the types of content customers prefer.

BrightTV can use this information when designing content recommendations and promotional campaigns.

3. ⏰ Peak Viewing Periods

Understanding when customers watch the most allows BrightTV to optimize:

Content scheduling

Advertising

Promotions

Programme launches

4. 📉 Low-Consumption Periods

Periods with low viewership represent opportunities for targeted engagement campaigns.

BrightTV could introduce:

Special programmes

Weekend campaigns

Personalized recommendations

New content releases

Customer promotions

5. 🎯 Customer Segmentation

Customers can be divided into groups based on their viewing behaviour.

For example:

High Engagement
      ↓
Frequent viewers
Long viewing duration
      ↓
Retention strategies

Medium Engagement
      ↓
Moderate viewers
      ↓
Personalized recommendations

Low Engagement
      ↓
Infrequent viewers
      ↓
Re-engagement campaigns

🚀 Recommendations

Based on the analysis, BrightTV can consider the following strategies:

📺 1. Personalized Content Recommendations

Recommend programmes based on each customer's viewing history.

🎯 2. Target Low-Consumption Customers

Identify customers with low viewing activity and send targeted recommendations or promotional offers.

⭐ 3. Promote Popular Content

Increase promotion of channels and programmes with strong viewing performance.

📅 4. Improve Low-Consumption Days

Introduce special programmes, exclusive content or campaigns during days with low viewing activity.

👥 5. Segment Customers

Create customer segments based on:

Age

Gender

Viewing frequency

Viewing duration

Channel preferences

🔄 6. Retention Campaigns

Monitor declining viewing activity and engage customers before they become inactive.

📊 Dashboard Preview

Add your dashboard screenshot here:

![BrightTV Dashboard](images/dashboard.png)

🎤 Presentation

The final presentation focuses on:

Business Problem

Dataset Overview

Data Cleaning

Customer Demographics

Viewing Behaviour

Usage Trends

Low-Consumption Segments

Key Insights

Business Recommendations

📌 Conclusion

The BrightTV case study demonstrates how data analytics can support Customer Value Management.

By combining customer profiles with viewing behaviour, BrightTV can better understand its customers, identify high-value and low-engagement segments, discover content preferences, and identify opportunities to increase consumption.

The analysis provides a foundation for data-driven customer engagement, retention and subscription growth strategies.

👩‍💻 About the Project

Project: BrightTV Customer Value Management Analysis
Role: Junior Data Analyst
Focus: Customer Analytics | Viewership Analytics | CVM | Data Visualization
Tools: Databricks | SQL | Excel | Power BI | GitHub

⭐ Skills Demonstrated

SQL

Data Cleaning

Data Transformation

Data Integration

Exploratory Data Analysis

Customer Segmentation

KPI Development

Data Visualization

Dashboard Design

Business Intelligence

Business Recommendations

GitHub Documentation

☕ Thank you for viewing my BrightTV Data Analytics Project!

Turning customer data into actionable business insights. 📊📺
