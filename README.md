# 🚖 NYC Yellow Taxi Data Analysis (January 2025)

## 📌 Project Overview

This project analyzes real-world taxi trip data from New York City for **January 2025**. 
The goal is to uncover insights about trip demand, pricing patterns, and geographic trends using a complete data analytics pipeline.

The project demonstrates:

* Data cleaning and preprocessing
* SQL-based data analysis
* Interactive dashboard creation

---

## 📂 Dataset

* Source: NYC Taxi Trip Records
* Data Type: Yellow Taxi Trips
* Time Period: January 2025
* Format: Parquet (converted and processed)

The dataset includes:

* Trip distance and duration
* Pickup & drop-off locations
* Fare and tip details
* Passenger count
* Timestamps

A lookup table was used to map `LocationID` to actual zones and boroughs.

---

## 🛠️ Tools & Technologies

* **Python (Pandas, NumPy)** → Data cleaning & feature engineering
* **MySQL** → Data storage & querying
* **Power BI** → Dashboard & visualization

---

## 🔄 Project Workflow

### 1. Data Collection

* Downloaded January 2025 taxi trip data
* Loaded dataset using Python
* Imported taxi zone lookup table

---

### 2. Data Cleaning (Python)

Key steps:

* Converted datetime columns
* Removed invalid records (zero/negative distance & fare)
* Handled missing values
* Removed outliers (extreme distances and fares)
* Created new features:

  * `pickup_hour`
  * `day_of_week`
  * `trip_duration`

---

### 3. Data Enrichment

* Merged dataset with zone lookup table
* Added:

  * Pickup Zone
  * Borough

---

### 4. Data Storage (MySQL)

* Cleaned dataset exported to MySQL
* Structured table created for efficient querying

---

### 5. Data Analysis (SQL)

Performed analysis to answer key business questions:

* Peak demand hours
* Busiest days of the week
* Most popular pickup locations
* Relationship between distance and fare
* Tip behavior patterns

---

### 6. Data Visualization (Power BI)

Created **3 interactive dashboards**:

#### 📊 1. Trip Analysis Dashboard

* Trips by hour
* Trips by day
* Peak demand periods

#### 💰 2. Revenue Analysis Dashboard

* Average fare trends
* Distance vs fare relationship
* Pickup zone wise distribution of revenue

#### 📍 3. Tip Analysis Dashboard

* Pickup zones wise average tip
* Average tip by distance of trip
* Pickup hour wise average tip

---

## 📈 Key Insights

* Peak demand observed during **rush hours (morning & evening)**
* Higher fares during high-demand periods
* Strong correlation between **trip distance and fare amount**
* Certain zones dominate pickup activity (business districts, airports)
* Tip patterns vary based on time and trip characteristics

---

## 📁 Project Structure

```
NYC_Taxi_Project/
│
├── data/
│   ├── raw/
│   ├── cleaned/
│
├── notebooks/
├── sql/
├── powerbi/
├── README.md
```

---

## 🚀 How to Run the Project

1. Load raw dataset in Python
2. Run data cleaning scripts
3. Export cleaned data
4. Import into MySQL
5. Execute SQL queries
6. Connect Power BI to MySQL
7. Build dashboards

---

## 🎯 Skills Demonstrated

* Data Cleaning & Preprocessing
* Feature Engineering
* SQL Querying & Optimization
* Data Visualization
* Business Insight Generation

---

## 🙌 Conclusion

This project showcases an end-to-end data analytics workflow using real-world data. 
It highlights the importance of data cleaning, structured querying, and visualization in extracting meaningful business insights.

---
