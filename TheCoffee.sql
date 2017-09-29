create database TheCoffee
go
use TheCoffee
go
create table ProductType
(
	IDType varchar(10) primary key,
	TypeName nvarchar(50),
	Size nvarchar(10)
)
go
create table Product
(
	IDProduct varchar(20) primary key,
	ProductName nvarchar(100),
	IDType varchar(10) FOREIGN KEY REFERENCES ProductType(IDType),
	Price int
)
go
create table Administrator(
	Username varchar(50) Primary key,
	[Password] varchar(20)
)
go
create table Employee(
	UsernameEmp varchar(50) Primary key,
	[Password] varchar(20),
	NameEmp nvarchar(50),
	Gender nvarchar(10),
	Birthday varchar(20),
	Phone varchar(20),
	Email varchar(50),
	[Address] nvarchar(Max),
	Hinh varchar(50)
)
go
Create Table Revenue(
	IDRevenue int Identity(1,1) Primary key,
	[Date] varchar(20),
	[Money] varchar(20)
)
go
create table Customer(
	IDCus int Identity(100000,1) Primary key,
	IdentityCard varchar(20) not null UNIQUE,
	CusName nvarchar(50),
	[DateAdd] varchar(20),
	Phone varchar(20),
	Email varchar(50),
	Quantity int,
	Discount int
)
go
create table Promotions(
	IDPromo int Identity(1,1) Primary key,
	NamePromo nvarchar(50) not null UNIQUE,
	DiscountPromo int,
	StartPromo varchar(20),
	EndPromo varchar(20),
	[Description] nvarchar(Max)
)
go
Create Table [Order](
	IDOrder varchar(20) Primary key,
	DateOrder varchar(20),
	TimeOrder varchar(20),
	UsernameEmp varchar(50) foreign key REFERENCES Employee(UsernameEmp)
)
go
Create Table OrderDetails(
	IDOrder varchar(20) foreign key REFERENCES [Order](IDOrder),
	IDProduct varchar(20) foreign key REFERENCES Product(IDProduct),
	CusName nvarchar(50),
	Quantity int,
	NamePromo nvarchar(50),
	Constraint PK_OrderDetails Primary key (IDOrder,IDProduct)
)
go
--Insert 1 Administrators
Insert into Administrator values('admin','admin')

--Insert 4 Employees information
Insert into Employee values('vutung','123456',N'Vũ Văn Tùng',N'Nam','01/01/1996','0124566789','tung@gmail.com',N'Dĩ an','2.jpg')
Insert into Employee values('thanhtung','123456',N'Nguyễn Huỳnh Thanh Tùng',N'Nam','02/03/1994','0124221177','thanhtung@gmail.com',N'Tphcm','5.jpg')
Insert into Employee values('nguyenhue','123456',N'Nguyễn Huệ',N'Nữ','22/08/1995','0932212333','hue@gmail.com',N'15 Gò Vấp','4.jpg')
Insert into Employee values('nguyenngan','123456',N'Nguyễn Ngân',N'Nữ','15/02/1996','01227971919','ngan@gmail.com',N'9 Lê Lợi','3.jpg')
Insert into Employee values('tuongvy','123456',N'Tường Vy',N'Nữ','01/05/1995','0909123456','vy@gmail.com',N'12 Lê Hồng Phong','1.jpg')

--Inser 7 ProductTypes
Insert into ProductType values('T01',N'Cà phê',N'Nhỏ')
Insert into ProductType values('T02',N'Cà phê',N'Vừa')
Insert into ProductType values('T03',N'Cà phê',N'Lớn')
Insert into ProductType values('T04',N'Nước trái cây',N'Nhỏ')
Insert into ProductType values('T05',N'Nước trái cây',N'Vừa')
Insert into ProductType values('T06',N'Nước trái cây',N'Lớn')

--Insert 20 Products
Insert into Product values('CF01', N'Cà phê đá', 'T01', 20000)
Insert into Product values('CF02', N'Cà phê đá', 'T02', 25000)
Insert into Product values('CF03', N'Cà phê đá', 'T03', 30000)
Insert into Product values('CF04', N'Cà phê sữa đá', 'T01', 25000)
Insert into Product values('CF05', N'Cà phê sữa đá', 'T02', 30000)
Insert into Product values('CF06', N'Cà phê sữa đá', 'T03', 35000)
Insert into Product values('ES01', N'ESPRESSO MILK', 'T01', 30000)
Insert into Product values('ES02', N'ESPRESSO MILK', 'T02', 40000)
Insert into Product values('ES03', N'ESPRESSO MILK', 'T03', 50000)
Insert into Product values('CA01', N'CAPPUCCINO', 'T01', 42000)
Insert into Product values('CA02', N'CAPPUCCINO', 'T02', 52000)
Insert into Product values('CA03', N'CAPPUCCINO', 'T03', 62000)
Insert into Product values('TD01', N'Trà đào', 'T04', 40000)
Insert into Product values('TD02', N'Trà đào', 'T05', 50000)
Insert into Product values('TD03', N'Trà đào', 'T06', 60000)
Insert into Product values('CE01', N'Cam ép', 'T04', 35000)
Insert into Product values('CE02', N'Cam ép', 'T05', 40000)
Insert into Product values('ST01', N'Sinh tố thập cẩm', 'T04', 50000)
Insert into Product values('ST02', N'Sinh tố thập cẩm', 'T05', 60000)

--Insert 9 Revenues
Insert into Revenue values('10/04/2017','179000')
Insert into Revenue values('13/03/2017','50000')
Insert into Revenue values('15/12/2016','206000')
Insert into Revenue values('26/02/2016','240000')
Insert into Revenue values('02/04/2017','126000')
Insert into Revenue values('05/05/2016','52000')
Insert into Revenue values('01/09/2016','45000')
Insert into Revenue values('15/08/2016','45000')
Insert into Revenue values('23/11/2016','110000')

--Insert 4 Customers
Insert into Customer values('122261551',N'Vũ Văn Tùng','17/04/2017','01212692802','tung@gmail.com',20,10)
Insert into Customer values('122261552',N'Nguyễn Huỳnh Thanh Tùng','23/04/2017','01212692802','thanhtung@gmail.com',25,10)
Insert into Customer values('122261553',N'Nguyễn Ngân','20/04/2017','01212692802','nguyenngan@gmail.com',19,5)
Insert into Customer values('122261554',N'Nguyễn Văn Trí','11/04/2017','01212692802','tri@gmail.com',10,5)

--Insert 2 Promotions
Insert into Promotions values(N'Thẻ sinh viên',10,'2017/01/01','2017/12/30',N'Có thẻ sinh viên')

--Insert 6 Order
Insert into [Order] values('HD0001','11/04/2017','19:49:50','vutung')
Insert into [Order] values('HD0002','20/12/2016','22:43:50','vutung')
Insert into [Order] values('HD0003','23/08/2016','11:12:50','thanhtung')
Insert into [Order] values('HD0004','17/01/2017','15:47:50','thanhtung')
Insert into [Order] values('HD0005','18/03/2017','09:23:50','nguyenngan')
Insert into [Order] values('HD0006','26/02/2017','11:59:50','nguyenngan')
--Insert 10 OrderDetails
Insert into OrderDetails values('HD0006','CF05',N'100000',1,N'Khách hàng VIP')
Insert into OrderDetails values('HD0006','CF01',N'100001',2,N'Khách hàng VIP')
Insert into OrderDetails values('HD0002','ST01',N'Khách vãng lai',1,N'Thẻ sinh viên')
Insert into OrderDetails values('HD0002','ES01',N'Khách vãng lai',2,N'Thẻ sinh viên')
Insert into OrderDetails values('HD0003','ES02',N'Khách vãng lai',1,N'Không có')
Insert into OrderDetails values('HD0005','CE01',N'Khách vãng lai',2,N'Không có')
Insert into OrderDetails values('HD0004','CA01',N'Khách vãng lai',1,N'Thẻ sinh viên')
Insert into OrderDetails values('HD0004','TD02',N'Khách vãng lai',3,N'Thẻ sinh viên')
Insert into OrderDetails values('HD0003','TD01',N'Khách vãng lai',1,N'Không có')
Insert into OrderDetails values('HD0001','CF02',N'100003',4,N'Khách hàng VIP')