# Pizza Store Sales Analysis

Pizza Store Sales Analysis is a **SQL-based exploratory data analysis and revenue intelligence project** that transforms raw transactional retail data from a pizza store into actionable business strategies and executive decision-making frameworks.

The project uses MySQL relational database management alongside advanced SQL querying techniques—including window functions, CTEs, multi-table `JOIN`s, and date/time aggregations—to model transactional datasets, extract key performance indicators, and build an executive sales presentation.

![SQL (MySQL)](https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white) ![MySQL Workbench](https://img.shields.io/badge/MySQL-Workbench-4479A1?style=for-the-badge&logo=mysql&logoColor=white) ![Multi-Table JOIN Operations](https://img.shields.io/badge/SQL-Multi--Table_JOINs-0288D1?style=for-the-badge) ![Aggregate Functions](https://img.shields.io/badge/SQL-Aggregate_Functions-00796B?style=for-the-badge) ![Window Functions](https://img.shields.io/badge/SQL-Window_Functions-388E3C?style=for-the-badge) ![Subqueries & CTEs](https://img.shields.io/badge/SQL-Subqueries_%26_CTEs-E65100?style=for-the-badge) ![Date & Time Functions](https://img.shields.io/badge/SQL-Date_%26_Time_Functions-7B1FA2?style=for-the-badge) ![EDA](https://img.shields.io/badge/Analytics-EDA-C2185B?style=for-the-badge) ![Business Intelligence](https://img.shields.io/badge/BI-Revenue_Tracking-512DA8?style=for-the-badge)

## Project Features

- Relational database schema design and data modeling across four core sales tables
- Automated revenue tracking and transactional volume analysis across sales history
- Identification of high-priced menu items, order pricing distribution, and size preferences
- Hourly order distribution analysis to identify peak demand windows for staffing and store operations
- Category-wise sales volume breakdown and pizza menu item performance profiling
- Daily average order calculations and cumulative revenue growth tracking over time
- Advanced windowing (`RANK()`, `PARTITION BY`) for top-revenue pizza ranking within categories
- Comprehensive PDF report generation with data visualizations and strategic store action plans

## Transaction & Master Types

The project handles the following core relational data schemas:

1. **Orders Data (`orders.csv`):** Captures order-level transactional metadata including `order_id`, `date`, and `time`
2. **Order Details (`order_details.csv`):** Tracks line-item granular sales with `order_details_id`, `order_id`, `pizza_id`, and `quantity`
3. **Pizzas Inventory (`pizzas.csv`):** Defines pizza menu SKUs with `pizza_id`, `pizza_type_id`, `size`, and `price`
4. **Pizza Catalog (`pizza_types.csv`):** Contains pizza category definitions including `pizza_type_id`, `name`, `category`, and `ingredients`

## Technologies Used

- SQL (MySQL)
- MySQL Workbench
- Multi-Table `JOIN` Operations
- Aggregate Functions (`SUM`, `AVG`, `COUNT`)
- Window Functions (`RANK()`, `OVER()`, `PARTITION BY`)
- Subqueries & Common Table Expressions (CTEs)
- Date & Time Functions
- Exploratory Data Analysis (EDA)
- Business Intelligence (BI) & Revenue Tracking

## Project Structure

```text
pizza-store-sales-analysis/
├── data/
│   ├── order_details.csv
│   ├── orders.csv
│   ├── pizza_types.csv
│   └── pizzas.csv
├── queries/
│   ├── 01.sql
│   ├── 02.sql
│   ├── 03.sql
│   ├── 04.sql
│   ├── 05.sql
│   ├── 06.sql
│   ├── 07.sql
│   ├── 08.sql
│   ├── 09.sql
│   ├── 10.sql
│   ├── 11.sql
│   ├── 12.sql
│   └── 13.sql
├── pizza_sales_report_2026.pdf
├── Questions.txt
└── README.md
```

## File Information

| File / Folder | Purpose |
| --- | --- |
| `data/` | Folder containing raw transactional CSV datasets (`order_details.csv`, `orders.csv`, `pizza_types.csv`, `pizzas.csv`) |
| `queries/` | Folder containing 13 modular `.sql` scripts categorised into Basic, Intermediate, and Advanced analytical queries |
| `01.sql` – `05.sql` | Basic SQL queries covering total orders, sales revenue, highest price, most common size, and top 5 quantities |
| `06.sql` – `10.sql` | Intermediate queries covering category quantities, hourly distribution, category spread, daily averages, and top 3 revenue pizzas |
| `11.sql` – `13.sql` | Advanced queries analyzing percentage revenue contributions, cumulative revenue over time, and top 3 pizzas per category |
| `pizza_sales_report_2026.pdf` | Comprehensive presentation report detailing findings, visual charts, and actionable store management strategies |
| `Questions.txt` | Original document listing the situational business questions solved in this project |
| `README.md` | Master project documentation explaining setup, query architecture, and business metrics |

## Installation

### 1. Clone the Repository

```text
git clone [https://github.com/animeshsanghi-da/pizza-store-sales-analysis.git](https://github.com/animeshsanghi-da/pizza-store-sales-analysis.git)
```

### 2. Open the Project Directory

```text
cd pizza-store-sales-analysis
```

### 3. Database Setup

Launch **MySQL Workbench** (or your preferred SQL database client) and create a database schema:

```sql
CREATE DATABASE pizza_sales_db;
USE pizza_sales_db;
```

### 4. Import Datasets

Import the four raw CSV files from the `/data` directory into your SQL database in the following order:
1. `orders.csv`
2. `pizza_types.csv`
3. `pizzas.csv`
4. `order_details.csv`

## How to Run

### 1. Execute Baseline & Basic Queries

Run queries `01.sql` through `05.sql` to calculate baseline sales KPIs and inventory metrics:

```sql
-- Retrieve total revenue generated from pizza sales (02.sql)
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_sales
FROM 
    order_details 
JOIN 
    pizzas ON order_details.pizza_id = pizzas.pizza_id;
```

### 2. Execute Intermediate Operational Queries

Run queries `06.sql` through `10.sql` to examine store operational patterns, peak order hours, and category breakdowns.

### 3. Execute Advanced Intelligence Queries

Run scripts `11.sql` through `13.sql` to compute percentage contribution, cumulative revenue, and category-level rankings:

```sql
-- Determine top 3 most ordered pizza types based on revenue for each pizza category (13.sql)
SELECT category, name, revenue, rank_no
FROM (
    SELECT category, name, revenue,
           RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS rank_no
    FROM (
        SELECT pizza_types.category, pizza_types.name,
               SUM(order_details.quantity * pizzas.price) AS revenue
        FROM order_details
        JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        GROUP BY pizza_types.category, pizza_types.name
    ) AS category_sales
) AS ranked_sales
WHERE rank_no <= 3;
```

## System Workflow

```text
Import Raw CSV Datasets (/data)
           ↓
MySQL Schema Setup & Database Modeling
           ↓
Table Relationships & Primary/Foreign Key Mapping
           ↓
Sequential Query Execution (/queries 01.sql to 13.sql)
           ↓
Data Aggregation, Grouping & Window Functions
           ↓
KPI Extraction & Business Analysis
           ↓
Executive Presentation & Action Plan (pizza_sales_report_2026.pdf)
```

## Business Metrics Analyzed

| Business Metric / Question | Query File | Complexity | Analysis Scope |
| --- | --- | --- | --- |
| **Total Orders Placed** | `01.sql` | Basic | Calculates the overall total count of customer orders |
| **Total Sales Revenue** | `02.sql` | Basic | Aggregates sales revenue generated across all pizza transactions |
| **Highest-Priced Pizza** | `03.sql` | Basic | Identifies the highest price point pizza item on the store menu |
| **Most Common Pizza Size** | `04.sql` | Basic | Finds the most frequently ordered pizza size (e.g., S, M, L) |
| **Top 5 Ordered Pizza Types** | `05.sql` | Basic | Lists top 5 pizza types ranked by aggregate order quantities |
| **Category-Wise Quantities** | `06.sql` | Intermediate | Multi-table join calculating total pizza quantities sold per category |
| **Hourly Order Distribution** | `07.sql` | Intermediate | Analyzes order distribution across hours of the day for staffing optimization |
| **Category Pizza Count** | `08.sql` | Intermediate | Evaluates the variety and distribution of pizza offerings per category |
| **Daily Average Order Volume** | `09.sql` | Intermediate | Groups orders by date to calculate average pizzas sold per day |
| **Top 3 Revenue Pizza Types** | `10.sql` | Intermediate | Identifies top 3 highest revenue-generating pizza types overall |
| **Percentage Revenue Share** | `11.sql` | Advanced | Computes percentage contribution of each pizza type to total sales |
| **Cumulative Revenue Over Time** | `12.sql` | Advanced | Analyzes running cumulative store revenue chronologically |
| **Top 3 Pizzas Per Category** | `13.sql` | Advanced | Uses `RANK() OVER (PARTITION BY category)` for top 3 revenue pizzas per category |

## Important Note

Ensure that data types and foreign key references are configured correctly when importing CSV datasets into MySQL Workbench so that table `JOIN` operations execute smoothly across `orders`, `order_details`, `pizzas`, and `pizza_types`.

For full visual charts, detailed statistical breakdowns, and strategic business action plans, refer to [`pizza_sales_report_2026.pdf`](pizza_sales_report_2026.pdf).

## Useful Links

- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL Workbench Guide](https://www.mysql.com/products/workbench/)
- [SQL Window Functions Reference](https://dev.mysql.com/doc/refman/8.0/en/window-functions.html)

## Created By

**Name:** Animesh Sanghi  
**Profession:** Google Certified Data Analyst  
**LinkedIn:** [linkedin.com/animeshsanghi-da](https://www.linkedin.com/in/animeshsanghi-da/)  
**GitHub:** [github.com/animeshsanghi-da](https://github.com/animeshsanghi-da)  
**Email:** animeshsanghi.da@gmail.com

## Project Status

```text
SQL & Data Analytics Project
```

## License

This project is open-source and free to use.
