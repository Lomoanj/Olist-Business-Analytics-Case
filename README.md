# 🛍️ Olist Store Analysis

A comprehensive data analytics project using **SQL**, **Excel**, **Power BI**, and **Tableau** to analyze e-commerce performance metrics for **Olist**, a Brazilian online marketplace. The project delivers deep insights into sales trends, profit margins, customer behavior, delivery performance, and category-level performance through interactive dashboards and data-driven exploration.

---

## 📂 Project Overview

This project aims to perform end-to-end analysis of Olist's e-commerce dataset using **MySQL**, **Excel**, **Power BI**, and **Tableau**. The objective is to extract actionable business insights by cleaning, transforming, and visualizing data across platforms. The analysis covers:

- Sales and profit trends across time, category, and geography  
- Customer behavior and order review patterns  
- Delivery performance and fulfillment timelines  
- Identification of high-performing products and regions  
- Recommendations to improve efficiency and customer satisfaction

---

## 🧰 Tools Used

- **Power BI**  
- **MySQL**  
- **Excel**  
- **Tableau**
  
[Raw Data Link](https://github.com/Lomoanj/Olist-Business-Analytics-Case/tree/main/Data_Set)

---

## 🖼️ Power BI Preview

![PowerBI Report View](https://github.com/user-attachments/assets/8d36c302-dde8-4461-854c-9976fda33266)  
![PowerBI Model](https://github.com/user-attachments/assets/1501bf04-b791-440e-ba63-9f9055187e27)  
[PowerBI File Link](https://github.com/Lomoanj/Olist-Business-Analytics-Case/blob/main/PowerBI_Dashboard.pbix)

---

## 🖼️ Tableau Preview

![Tableau Dashboard](https://github.com/user-attachments/assets/1cae14f8-3320-45a4-8064-3b0eba79b8d7)    
![Tableau Model](https://github.com/user-attachments/assets/b4319728-0645-4ec6-947b-44747e221ea0)  
[Tableau File Link](https://github.com/Lomoanj/Olist-Business-Analytics-Case/blob/main/Tableau_Dashboard.twbx)

---

## 🖼️ Excel Preview

![Excel dashboard](https://github.com/user-attachments/assets/388292db-f6aa-4482-9701-4032af9b52dd)  
[Excel File Link](https://github.com/Lomoanj/Olist-Business-Analytics-Case/blob/main/Excel_Dashboard.xlsx)

---

## 🧾 Sample SQL Queries  

#### 📌 Average Delivery Days by Review Score

```sql
select review_score, avg(if(a.order_delivered_customer_date is not null, 
datediff(a.order_delivered_customer_date,a.order_purchase_timestamp), null)) delivery_days 
from orders a join reviews b on a.order_id=b.order_id group by 1 order by 1;
```

#### 📌 Top 5 Cateogries with Density (g/cm3)

```sql
select b.product_category_name_english, avg(product_weight_g/(product_length_cm*product_height_cm*product_width_cm)) from 
products a join translation b on a.product_category_name=b.product_category_name_english group by 1 order by 2;
```

#### 📌  Avg number of delivery days taken by Pet_store)

```sql
select avg(if(a.order_purchase_timestamp is not null and a.order_delivered_customer_date is not null, 
datediff(a.order_delivered_customer_date,a.order_purchase_timestamp), null)) delivery_days from orders a join
order_items b on a.order_id=b.order_id join products c on c.product_id=b.product_id join translation d on d.ï»¿product_category_name=c.product_category_name
where ï»¿product_category_name='pet_shop';
```
[SQL Queries Link](https://github.com/Lomoanj/Olist-Business-Analytics-Case/blob/main/SQL%20Queries.sql)  

---

## 🔍 Insights

- **Sales Growth**: 2018 accounted for **~65%** of total profit.  
- **High-Performing Categories**: *Health & Beauty*, *Watches & Gifts*, *Bed & Bath* lead in sales.  
- **Delivery Performance**: Most deliveries with review score '5' took **21 days**, while '1' scores took just **11 days** — indicating potential customer dissatisfaction despite faster delivery.  
- **Top Locations**: Sao Paulo (SP) leads with **10.2M** in sales.  
- **Review-Based Insights**: 43.98K credit card orders received a perfect review score of 5.

---

## ✅ Recommendations

1. **Improve delivery experience** for high-rated review customers by aligning speed and service.  
2. **Focus marketing on top categories and states** to boost ROI further.  
3. **Analyze low-density categories** to explore bundling or warehouse strategies.  
4. **Optimize weekend performance**, which is significantly lower than weekdays.  
5. **Shorten average delivery time for Pet_Shop category** to enhance satisfaction.

---

## 👤 Author

**Lomoanj P J**  
Data Analyst | Passionate about turning raw data into business value

---

## 📬 Contact

- **Email**: [lomoanj@gmail.com](mailto:lomoanj@gmail.com)    
- **LinkedIn**: [linkedin.com/in/lomoanj](https://www.linkedin.com/in/lomoanj/)
