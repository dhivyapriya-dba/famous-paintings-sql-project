# 🎨 Famous Paintings SQL Project

This project focuses on performing SQL-based data analysis on a dataset about famous paintings and museums. The primary objective is to answer key business questions using SQL queries, Stored Procedures, and Triggers while improving data handling and database management skills.

## 📂 Dataset

The dataset contains information about:

- Paintings (works)
- Museums
- Artists
- Product sizes (sale & regular price)
- Museum opening hours

> **Note:** The dataset can be downloaded from Kaggle —  
👉 [Famous Paintings Dataset on Kaggle](https://www.kaggle.com/datasets/mexwell/famous-paintings)

## 🛠️ Concepts Used

- SQL Joins (INNER JOIN, LEFT JOIN)
- Aggregate Functions (`COUNT`, `MAX`, etc.)
- Group By & Having Clauses
- Subqueries
- Stored Procedures
- Triggers
- Filtering with `WHERE` and `IN`
- Sorting with `ORDER BY`

## 💡 Problem Statements Solved

- Fetch all the paintings which are not displayed in any museums.
- Find museums without any paintings.
- Calculate how many paintings have a higher asking price than their regular price.
- Identify paintings with an asking price less than 50% of the regular price.
- Find the canvas size that costs the most.
- Retrieve the top 10 most famous painting subjects.
- Identify museums open on both Sunday and Monday.
- Find how many museums are open every single day.
- Determine the top 5 most popular museums (based on painting count).
- Determine the top 5 most popular artists.
- Identify which museum is open for the longest time during a day.
- Find the museum with the most diverse painting styles.
- Identify artists whose paintings are displayed in multiple countries.

## ⚙️ Features

- **Stored Procedure:** To get the total number of paintings in a specific museum.
- **Trigger (Optional Future Work):** Automate tasks such as logging insertions into the `work` table.

## 🚀 How to Use

1. Download and import the dataset into **MySQL**.
2. Run the provided SQL scripts to answer the problem statements.


