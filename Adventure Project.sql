
SELECT [CustomerID],[AccountNumber],[ModifiedDate]
FROM [Sales].[Customer]


SELECT [CurrencyCode],[Name],[ModifiedDate]
FROM[Sales].[Currency]


SELECT [CustomerID],[AccountNumber],[ModifiedDate]
FROM [Sales].[Customer]
WHERE [CustomerID] >= 20


SELECT[BusinessEntityID],[FirstName],[MiddleName],[LastName],[ModifiedDate]
FROM [Person].[Person] 
WHERE [ModifiedDate] > '12/29/2000'


SELECT [BusinessEntityID],[LoginID],[JobTitle]
FROM [HumanResources].[Employee]
WHERE [JobTitle] = 'Research and Development Engineer'


SELECT [BusinessEntityID],[LoginID],[JobTitle]
FROM [HumanResources].[Employee]
WHERE [JobTitle] != 'Research and Development Engineer'


SELECT[BusinessEntityID],[FirstName],[MiddleName],[LastName]
 FROM[Person].[Person]
WHERE[MiddleName] = 'J'


SELECT*
FROM [Production].[ProductCostHistory]
WHERE [ModifiedDate]= '05/29/2013'


SELECT [ProductID],[Name]
FROM [Production].[Product]
WHERE [Name] LIKE 'Chain%'


SELECT [ProductID],[Name]
FROM [Production].[Product]
WHERE [Name] LIKE '%helmet%'


SELECT [ProductID],[Name]
FROM [Production].[Product]
WHERE [Name] NOT LIKE '%helmet%'


SELECT[BusinessEntityID],[FirstName],[MiddleName],[LastName]
FROM[Person].[Person]
WHERE [MiddleName] LIKE '%[EB]%'


SELECT[SalesOrderID],[OrderDate],[TotalDue]
FROM[Sales].[SalesOrderHeader]
WHERE[OrderDate] BETWEEN '09/01/2011' AND '09/30/2011' AND 
[TotalDue] >1000


SELECT[SalesOrderID],[OrderDate],[TotalDue]
FROM[Sales].[SalesOrderHeader]
WHERE[OrderDate] BETWEEN '09/01/2011' AND '09/3/2011' AND 
[TotalDue] >1000


SELECT[SalesOrderID],[TotalDue],[SalesPersonID],[TerritoryID]
FROM[Sales].[SalesOrderHeader]
WHERE [TotalDue]>1000 AND ([SalesPersonID] =279 OR[TerritoryID] = 6)


SELECT[SalesOrderID],[TotalDue],[SalesPersonID],[TerritoryID]
FROM[Sales].[SalesOrderHeader]
WHERE [TotalDue]>1000 AND ([SalesPersonID] =279 OR [TerritoryID] IN (6,4))


SELECT[BusinessEntityID],[LastName],[FirstName],[MiddleName]
FROM [Person].[Person]
ORDER BY [LastName],[FirstName],[MiddleName]


SELECT[ProductID],[Name],[Color]
FROM [Production].[Product]
WHERE [Color] IS NULL


SELECT[ProductID],[Name],[Color]
FROM [Production].[Product]
WHERE [Color] IS NOT NULL


SELECT[ProductID],[Name],[Color]
FROM [Production].[Product]
WHERE [Color] IS NULL OR [Color] <> 'Blue'

SELECT[ProductID],[Name],[Color]
FROM [Production].[Product]
WHERE [Color] IS DISTINCT FROM 'Blue'


SELECT[ProductID],[Name],[Style],[Size],[Color]
FROM [Production].[Product]
WHERE [Style] IS NOT NULL OR [Size] IS NOT NULL OR [Color] IS NOT NULL


SELECT[ProductID],[Name],[Style],[Size],[Color]
FROM [Production].[Product]
WHERE [Style] IS NOT NULL AND [Size] IS NOT NULL AND [Color] IS NOT NULL


SELECT[ProductID],[Name], ISNULL(COLOR, 'No Color') AS Color
FROM [Production].[Product]


SELECT [MaxQty]-[MinQty] AS QTYDifference, [SpecialOfferID],[Description]
FROM[Sales].[SpecialOffer]


select isnull ([MaxQty],10)*[DiscountPct] as maxdis,[SpecialOfferID],[Description]
from[Sales].[SpecialOffer]


select sum([OrderQty]),[ProductID]
from[Sales].[SalesOrderDetail]
group by[ProductID]
order by [ProductID]


select count([LineTotal]),[SalesOrderID]
from[Sales].[SalesOrderDetail]
group by[SalesOrderID]


select COUNT([ProductID]),[ProductLine]
from[Production].[Product]
group by [ProductLine]


select count([SalesOrderID]) AS countoforders,[CustomerID],year([OrderDate]) as year
from[Sales].[SalesOrderHeader]
group by[CustomerID],year([OrderDate])
order by countoforders desc

select count([ProductID]) as countofproduct,[ProductModelID],[Color]
from[Production].[Product]
where color in ('blue','red')
group by[ProductModelID],[Color]
having count([ProductID])>1