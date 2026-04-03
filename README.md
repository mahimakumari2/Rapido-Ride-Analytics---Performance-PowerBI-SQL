# 🧾 # Rapido Ride Analytics &  Performance – Power BI, SQL

_Analyzing ride-hailing efficiency, cancellations, revenue patterns, and customer experience to support operational decision-making using SQL and Power BI._

---

## 📌 Table of Contents
- <a href="#overview">Overview</a>
- <a href="#business-problem">Business Problem</a>
- <a href="#dataset">Dataset</a>
- <a href="#tools--technologies">Tools & Technologies</a>
- <a href="#project-structure">Project Structure</a>
- <a href="#data-cleaning--preparation">Data Cleaning & Preparation</a>
- <a href="#sql-analysis">SQL Analysis</a>
- <a href="#dashboard">Dashboard</a>
- <a href="#dax-measures">DAX Measures</a>
- <a href="#research-questions--key-findings">Research Questions & Key Findings</a>
- <a href="#how-to-run-this-project">How to Run This Project</a>
- <a href="#final-recommendations">Final Recommendations</a>
- <a href="#author--contact">Author & Contact</a>

---

<h2><a class="anchor" id="overview"></a>Overview</h2>

This project evaluates ride-hailing operations to generate insights into booking trends, cancellations, revenue distribution, and service quality. A complete analytical workflow was built using SQL for data processing and Power BI for visualization.  

The dashboard provides a comprehensive view of ride performance, helping stakeholders monitor key metrics and identify operational inefficiencies.

---

<h2><a class="anchor" id="business-problem"></a>Business Problem</h2>

Efficient ride management is critical for customer satisfaction and revenue optimization. This project aims to:

- Identify major causes of ride cancellations  
- Analyze revenue distribution across locations and vehicle types  
- Evaluate driver and customer behavior  
- Monitor service quality using ratings  
- Improve operational efficiency and decision-making  

---

<h2><a class="anchor" id="dataset"></a>Dataset</h2>

- Ride booking dataset (~1.03 lakh records)  
- Includes booking details, vehicle type, location, payment method, and ratings  

---

<h2><a class="anchor" id="tools--technologies"></a>Tools & Technologies</h2>

- SQL (Data extraction and transformation)  
- Power BI (Dashboard and visualization)  
- DAX (Measures and KPIs)  
- Excel/CSV (Data source)  
- GitHub  

---

<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

---bash

Rapido Ride Analytics &  Performance
│
├── README.md
├── data/
│ └── bookings.csv
│
├── sql/
│ └── rapido.sql
│
├── dashboard/
│ └── rapido_dashboard.pbix
│
├── Images/
│ └──image1.png 
│ └──image2.png 
│ └──image3.png 
│ └──image4.png 
│
└── Rapido Ride Analytics & Operational Performance.pdf

---


---

<h2><a class="anchor" id="data-cleaning--preparation"></a>Data Cleaning & Preparation</h2>

- Removed duplicate and inconsistent records  
- Handled missing values  
- Standardized data formats  
- Created derived metrics (revenue, ride count, ratings)  
- Prepared dataset for analysis  

---

<h2><a class="anchor" id="sql-analysis"></a>SQL Analysis</h2>

Key SQL queries used for analysis:

```sql
-- Successful Bookings
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';

-- Top 5 Customers
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

-- Total Revenue
SELECT SUM(Booking_Value) AS total_revenue
FROM bookings
WHERE Booking_Status = 'Success';

---

<h2><a class="anchor" id="dashboard"></a>Dashboard</h2>

Power BI dashboard provides:

- Ride performance (total, completed, cancelled rides)
- Revenue analysis
- Vehicle performance
- Cancellation trends
- Ratings analysis

![Rapido Ride Analytics & Operational Performance](Images/image1.png)

---

<h2><a class="anchor" id="dax-measures"></a>DAX Measures</h2>

Key DAX measures:

-- Total Rides
Total Rides = COUNT(Bookings[Booking_ID])

-- Total Revenue
Total Revenue = SUM(Bookings[Booking_Value])

-- Cancelled Rides
Total Cancelled Rides =
CALCULATE(
    COUNT(Bookings[Booking_ID]),
    Bookings[Booking_Status] <> "Success"
)

-- Driver Cancellation %
Driver Cancel % =
DIVIDE(
    CALCULATE(COUNT(Bookings[Booking_ID]), Bookings[Booking_Status] = "Canceled by Driver"),
    [Total Rides]
)

---
<h2><a class="anchor" id="research-questions--key-findings"></a>Research Questions & Key Findings</h2>
- Cancellation Trends: Driver cancellations are higher than customer cancellations
- Revenue Analysis: Revenue is concentrated in key locations
- Vehicle Performance: Premium and Bike segments perform strongly
- Payment Trends: Cash dominates but digital payments are increasing
- Service Quality: Ratings (~4.0) indicate good customer satisfaction

---

<h2><a class="anchor" id="how-to-run-this-project"></a>How to Run This Project</h2>
1. Clone the repository:
git clone https://github.com/mahimakumari2/Rapido-Ride-Analytics---Performance-PowerBI-SQL.git
2. Open Power BI Dashboard:
  -  dashboard/rapido_dashboard.pbix
3. Load dataset if required
  -  Explore dashboard using filters

---

<h2><a class="anchor" id="final-recommendations"></a>Final Recommendations</h2>
- Reduce driver cancellations through incentives
- Improve vehicle availability in high-demand areas
- Promote digital payment methods
- Optimize pricing strategies
- Improve service quality

---

<h2><a class="anchor" id="author--contact"></a>Author & Contact</h2>

Mahima
Data Analyst

📧 Email: mahima.kumari0223@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/mahimakumari/)  
🔗 [Portfolio](https://mahimakumari.netlify.app/)