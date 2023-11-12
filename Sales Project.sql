select *
from [dbo].[Customer]


select *
from [dbo].[Order]

select *
from [dbo].[OrderItem]

select *
from [dbo].[Product]

select *
from [dbo].[Supplier]


----1
select *
from [dbo].[Supplier]
where [Country]='Uk'

---2
select CONCAT([FirstName], ' , ',[LastName]) as 'Full Name',[City]
from[dbo].[Customer]

---3
select *
from [dbo].[Customer]
where [Country]='sweden'

--4
select *
from [dbo].[Supplier]
order by [CompanyName]

----5
select[OrderDate],[OrderNumber],o.[CustomerId],[TotalAmount],[FirstName],[LastName],[City],[Country],[Phone]
from[dbo].[Order] as o
inner join [dbo].[Customer] as c on o.[CustomerId]=c.[Id]

----6

select [OrderNumber],[ProductName],[Quantity],OI.UnitPrice 
from [dbo].[OrderItem] as OI
left join [dbo].[Order] as O on OI.OrderId=O.Id
left join [dbo].[Product] as P on OI.ProductId=p.Id

---7
select *,
(case 
when [IsDiscontinued] =0 then  'Not Availabe'
else 'Available' end) as 'Availability of Product'
from [dbo].[Product]


---8
select [ProductName],[Package]
from[dbo].[Product]
where [Package] like '%bottles'

---9
select [ProductName],[UnitPrice],[Package]
from [dbo].[Product]
where [ProductName] like 'G%'

---10
select count ([ProductName]) as 'Number of Product',[SupplierId]
from [dbo].[Product]
group by [SupplierId]
order by [Number of Product] desc


---11
select count([Id]) as 'Number of Customer',[Country]
from [dbo].[Customer]
group by [Country]
order by [Number of Customer]

--12
select sum([TotalAmount]) as 'Total Order Amount',[CustomerId]
from [dbo].[Order]
group by [CustomerId]
order by [Total Order Amount] desc

---13
select count ([CompanyName]) as 'Number of Supplier',[Country]
from [dbo].[Supplier]
group by [Country]
having count ([CompanyName]) >3


---14
select count ([Id]) as 'Number of Customer',[Country]
from [dbo].[Customer]
group by [Country]
having count ([Id]) >7

---15
select count ([Id]) as 'Number of Customer',[Country]
from [dbo].[Customer]
where [Country]<> 'Germany'
group by [Country]
having count ([Id]) =9 or count ([Id]) >9 
order by [Number of Customer] desc

---16
select avg([TotalAmount]) as 'Average Orders',[CustomerId]
from [dbo].[Order]
group by [CustomerId]
having  avg([TotalAmount]) between '1000' and '1200'

---17
select count([Id])  as 'Number of Orders', sum([TotalAmount]) as 'Total Amount Sold'
from [dbo].[Order]
where [OrderDate] between '01/01/2013' and '12/31/2013'
