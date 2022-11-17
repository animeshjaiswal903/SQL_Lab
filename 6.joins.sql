/*JOIns*/
use Padhai;
select * from Orders;
select * from Customers;
select * from Shippers;




SELECT Orders.OrderID,Customers.CustomerName,Shippers.ShipperName
from Orders
inner join Customers 
on Orders.CustomerID = Customers.CustomerID
inner join Shippers 
on Orders.ShipperID=Shippers.ShipperID


SELECT O.OrderID,C.CustomerName
from Orders O
full join Customers C --here use left/right/full/inner and see the results.
on O.CustomerID = C.CustomerID

select * from Orders,Customers,Shippers;