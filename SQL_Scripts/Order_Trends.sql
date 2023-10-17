
-- Daily trend for total order
Select DATENAME(DW,order_date) as order_day, Count(Distinct order_id) as total_order
from pizza_sales
Group by DATENAME(DW,order_date)
Order by DATENAME(DW,order_date) 

-- Monthly trend for total order
Select DATENAME(Month,order_date) as order_month , Count(Distinct order_id) as total_order
from pizza_sales
Group by DATENAME(M,order_date)

-- Percentage of Sales by Pizza Category
Select pizza_category , Cast(Sum(total_price) as decimal(10,2)) as total_revenue, Cast(100* Sum(total_price) / (Select Sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
Group by pizza_category
Order by pizza_category
 
 -- Percentage of Sales by Pizza Size
 Select pizza_size , Cast(Sum(total_price) as decimal(10,2)) as total_revenue, Cast(100* Sum(total_price) / (Select Sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
Group by pizza_size
Order by pizza_size

-- Total Pizza Sold by Category
Select pizza_category, Sum(quantity) as total_pizza
from pizza_sales
group by pizza_category

-- Top 5 Best Sellers by Revenue
Select Top 5 pizza_name, Sum(total_price) as total_pizza_revenue
from pizza_sales
group by pizza_name
order by total_pizza_revenue DESC

-- Top 5 Best Sellers by Quantity
Select Top 5 pizza_name, Sum(quantity) as total_pizza_quantity
from pizza_sales
group by pizza_name
order by total_pizza_quantity DESC

-- Top 5 Best Sellers by Total Orders
Select Top 5 pizza_name, Count(Distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders DESC



-- Top 5 worst Sellers by Revenue
Select Top 5 pizza_name, Sum(total_price) as total_pizza_revenue
from pizza_sales
group by pizza_name
order by total_pizza_revenue ASC

-- Top 5 Worst Sellers by Quantity
Select Top 5 pizza_name, Sum(quantity) as total_pizza_quantity
from pizza_sales
group by pizza_name
order by total_pizza_quantity ASC

-- Top 5 Worst Sellers by Total Orders
Select Top 5 pizza_name, Count(Distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders ASC