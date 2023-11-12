---1*
select *
from [dbo].[Customer$],[dbo].[Order$],[dbo].[Product$],[dbo].[Region$]


---2
select *
from[dbo].[Customer$]

---3
select *
from[dbo].[Product$]

---4
select[Category], [Product Name]
from[dbo].[Product$]
where [Category]='furniture'

---5
select [Product ID],[Product Name]
from[dbo].[Product$]
where [Product Name] like 'Boston%'

---6
select [Product ID],[Product Name]
from[dbo].[Product$]
where [Product Name] like '%Collection%'

---7
select*
from[dbo].[Order$]
where [Order Date]between '03/01/2014' and '03/31/2014'


---8
select *
from [dbo].[Order$]
where [Order Date]  not between '03/01/2014' and '03/31/2014' and 
[Ship Date] between '03/05/2014' and '03/30/2014'

select *
from [dbo].[Order$]
where [Ship Date] >= '03/05/2014' and [Ship Date] <='03/30/2014' and (YEAR([Order Date])=2014 
and MONTH( [Order Date])!=3)

---9
select*
from [dbo].[Order$] as O
inner join[dbo].[Customer$]  as C on O.[Customer ID]=C.[Customer ID]




---10
select o.[Order ID],c.[Customer ID],p.[Product Name],r.Region
from [dbo].[Order$] as O
inner join [dbo].[Customer$] as C on o.[Customer ID]=c.[Customer ID]
inner join [dbo].[Product$] as P on o.[Product ID]=p.[Product ID]
inner join [dbo].[Region$] as R on o.[Postal Code]=r.[Postal Code]


select *
from [dbo].[Order$] as O
left join [dbo].[Customer$] as C on o.[Customer ID]=c.[Customer ID]
left join [dbo].[Product$] as P on o.[Product ID]=p.[Product ID]
left join [dbo].[Region$] as R on o.[Postal Code]=r.[Postal Code]