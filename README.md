# E-commerce-Return-Rate-Reduction-Analysis
Data analysis project on e-commerce product return rates using Python, SQL, and Power BI. Includes dashboard, machine learning prediction, and project report.

# Objective
The aim of this project is to identify the reasons why customers return products and analyze how return rate vary by product category, geography, and marketing channel.
The project also builds a prediction model to calculate the propability of return and creates a powerbi dashboard with drill-through filters and risk scores.

## Tools & Technologies
** Python : Data cleaning,logistic regression
** SQL : Database queries ('Ecommerce.sql')
** Power BI : Interaction dashboard and visualization

##  Repository Structure
- `dashboard/` → Power BI dashboard (`.pbix`)
- `notebooks/` → Jupyter Notebook (`Project E-commerce.ipynb`)
- `sql/` → SQL scripts (`Ecommerce.sql`)
- `data/` → Cleaned dataset (if allowed)
- `outputs/` → High-risk products CSV, charts, exports
- `report/` → Project report (PDF/DOCX)
  
  ## Methodology
  ** Data cleaning & preparation
   - Remove missing values,duplicates,and standardize formats.
  ** Exploratory Data Analysis (EDA)
   - Return % by product category,supplier,geography and marketing channel.
  ** Predictive Modeling
   - Logistic regression in Python to predict probability of return.
  ** Dashboard Design
   - Power BI dashboard with return risk score and drill-through filters.

 ## Deliverables
- Power BI interactive dashboard
- Python logistic regression model
- SQL queries for data analysis
- CSV of high-risk products
- Project report (see `report/` folder)

 ## How to Use
- Run the SQL file (`sql/Ecommerce.sql`) to set up the database.  
- Open the Jupyter notebook (`notebooks/Project E-commerce.ipynb`) for model training.  
- Open the Power BI file (`dashboard/Ecommerce Return Rate Analysis dashboard.pbix`) to explore the dashboard.  
- Read the project report in the `report/` folder.  
