-- Total Revenue
Select Sum(total_price) as total_revenue 
from pizza_sales

-- Average Order Value
Select Sum(total_price) / Count(Distinct order_id) as Average_Order_Value
from pizza_sales

-- Total Pizzas Sold
Select Sum(quantity) As Total_Pizzas_Sales
from pizza_sales

-- Total Orders
Select Count(Distinct Order_id) as Total_Order
from pizza_sales

-- Average Pizza Per Order
Select Cast(Cast(Sum(quantity) As Decimal(10,2)) / Count(Distinct Order_id) As Decimal(10,2)) as Average_Pizza_Per_Order
from pizza_sales