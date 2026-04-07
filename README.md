# 🍕 Pizza Store Sales Analysis 

## Overview
I recently completed a deep-dive analysis of a Pizza Store's sales data. I didn't just count boxes—I focused on answering real-life situational questions that store managers and stakeholders face every day. Using SQL, I transformed raw transactional data into actionable business strategies. 

This project showcases my ability to write complex SQL queries, manage relational databases, and extract meaningful business intelligence from everyday retail data.

## 🗂️ Project Structure

The repository is organized as follows:

- **`/data`**: Contains the raw CSV datasets used for the analysis (`order_details.csv`, `orders.csv`, `pizza_types.csv`, `pizzas.csv`).
- **`/queries`**: Contains 13 `.sql` files, each dedicated to solving a specific business problem.
- **`pizza_sales_report_2026.pdf`**: A comprehensive presentation of the findings, including visualizations and an action plan based on the data.
- **`Questions.txt`**: The original list of business questions tackled in this project.

## 🛠️ Tools & Technologies
- **Language:** SQL (MySQL)
- **Key Techniques Used:** `JOIN` operations, Aggregate Functions (`SUM`, `AVG`, `COUNT`), Window Functions (`RANK()`, `OVER()`, `PARTITION BY`), Subqueries, and Date/Time Functions.
- **Focus Area:** Exploratory Data Analysis (EDA), Revenue Tracking, Business Intelligence.

## 📊 Business Questions Answered

The analysis is broken down into three tiers of complexity:

### Basic
* **01.sql:** Retrieve the total number of orders placed.
* **02.sql:** Calculate the total revenue generated from pizza sales.
* **03.sql:** Identify the highest-priced pizza.
* **04.sql:** Identify the most common pizza size ordered.
* **05.sql:** List the top 5 most ordered pizza types along with their quantities.

### Intermediate
* **06.sql:** Join the necessary tables to find the total quantity of each pizza category ordered.
* **07.sql:** Determine the distribution of orders by hour of the day.
* **08.sql:** Join relevant tables to find the category-wise distribution of pizzas.
* **09.sql:** Group the orders by date and calculate the average number of pizzas ordered per day.
* **10.sql:** Determine the top 3 most ordered pizza types based on revenue.

### Advanced
* **11.sql:** Calculate the percentage contribution of each pizza type to total revenue.
* **12.sql:** Analyze the cumulative revenue generated over time.
* **13.sql:** Determine the top 3 most ordered pizza types based on revenue for each pizza category.

## 💡 Key Insights & Action Plan
For a detailed breakdown of the findings, charts, and the recommended action plan for the store, please view the [`pizza_sales_report_2026.pdf`](pizza_sales_report_2026.pdf) included in this repository.

## 🚀 How to Use This Repository
1. Clone the repository to your local machine.
2. Set up a local SQL database (e.g., MySQL Workbench) and import the CSV files from the `/data` folder.
3. Run the scripts in the `/queries` folder sequentially or based on the specific business question you want to explore.

---
*If you found this project interesting, feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/animeshsanghi-da) or check out my other repositories!*