/*ProductName & CustomerName*/
select s.*, 
p.EnglishProductName as ProductName ,
concat(c.firstname, " " ,c.middlename," " ,c.lastname) As CustomerFullName 
from sales as s join product as p
 on s.ProductKey = p.ProductKey 
 join customer as c 
 on s.CustomerKey=c.CustomerKey;
  
  
 
/*A.Year*/
select year(orderdate) as year,concat(truncate(sum(SalesAmount)/1000,1), "K")   as sales from sales 
group by year
order by year;

/*B.Monthno*/
select month(orderdate) as MonthNumber , concat(truncate(sum(SalesAmount)/1000,1), "K")   as sales from sales
group by MonthNumber
order by monthnumber;

/*C.Monthfullname*/
select monthname(orderdate) as MonthName,concat(truncate(sum(SalesAmount)/1000,1), "K")   as sales from sales
group by MonthName
order by MonthName;

/*D.Quarter(Q1,Q2,Q3,Q4)*/
select quarter(orderdate) as quarter, concat(truncate(sum(SalesAmount)/1000,1), "K") as sales  from sales
group by quarter
order by quarter;

/*E. YearMonth ( YYYY-MMM)*/
select concat( year(orderdate), " " ,monthname(orderdate) ) as YearMonth, concat(truncate(sum(SalesAmount)/1000,1), "K")  as sales from sales
group by YearMonth
order by YearMonth;

/*F. Weekdayno*/
select weekday(orderdate) as WeekdayNo,concat(truncate(sum(SalesAmount)/1000,1), "K") as sales from sales
group by WeekdayNo
order by weekdayNo;

/*G.Weekdayname*/
select dayname(orderdate) as WeekName, concat(truncate(sum(SalesAmount)/1000,1), "K") as sales from sales
group by WeekName
order by WeekName;

/*H.FinancialMOnth*/
select if(month(orderdate) >= 4, month(orderdate) - 3, month(orderdate) + 9) as FinancialMonth ,concat(truncate(sum(SalesAmount)/1000,1), "K") as sales
   from sales
   group by FinancialMonth
   order by FinancialMonth;

/*I. Financial Quarter */
select if(month(orderdate) BETWEEN 4 AND 6, 'Quarter1',
	if(month(orderdate) BETWEEN 7 AND 9, 'Quarter2',
	if(month(orderdate) BETWEEN 10 AND 12, 'Quarter3', 'Quarter4')
     )
  ) as FinancialQuarter,concat(truncate(sum(SalesAmount)/1000,1), "K") as sales
from sales 
group by FinancialQuarter
order by FinancialQuarter;

/*ProductionCost*/
select  p.EnglishProductName as productname,(s.ProductStandardCost*s.OrderQuantity) As ProductionCost from sales s join product as p 
on s.ProductKey=p.ProductKey
order by salesamount;


/*Profit*/
select year(orderdate) as year ,sum(SalesAmount - (ProductStandardCost * OrderQuantity)) as Profit  from sales
group by year
order by year;



/*------------------------------------------------------------------------------------------------*/





