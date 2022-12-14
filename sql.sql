/*DECLARE @DatabaseName nvarchar(50)
SET @DatabaseName = N'Assignment_301_008'

DECLARE @SQL varchar(max)

SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
FROM MASTER..SysProcesses
WHERE DBId = DB_ID(@DatabaseName) AND SPId <> @@SPId

--SELECT @SQL 
EXEC(@SQL)
go
drop database Assignment_301_008
go
*/

create database Assignment_301_008
go
USE [Assignment_301_008]
GO
/****** Object:  Table [dbo].[AdminManager]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminManager](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](20) NOT NULL,
	[AdminPass] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BRAND]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRAND](
	[BRANDID] [int] IDENTITY(1,1) NOT NULL,
	[BRANDNAME] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BRANDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CART]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[CARTID] [int] IDENTITY(1,1) NOT NULL,
	[USERID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CARTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[USERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COLOR]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COLOR](
	[COLORID] [int] IDENTITY(1,1) NOT NULL,
	[COLORNAME] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COLORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [varchar](20) NOT NULL,
	[PASSWORD] [varchar](20) NOT NULL,
	[NAME] [nvarchar](30) NOT NULL,
	[SEX] [nvarchar](10) NOT NULL,
	[EMAIL] [varchar](30) NULL,
	[PHONE] [varchar](30) NULL,
	[ADDRESS] [nvarchar](100) NULL,
	[REGTIME] [smalldatetime] NULL,
	[CASH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[USERNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PHONE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ITEMLIST]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEMLIST](
	[ITEMLISTNUMBER] [int] IDENTITY(1,1) NOT NULL,
	[ITEMPIID] [int] NULL,
	[ITEMQUANTITY] [int] NOT NULL,
	[PRICEITEM] [int] NOT NULL,
	[ORDERID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ITEMLISTNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logsomething]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logsomething](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COLUMN1] [varchar](255) NULL,
	[COLUMN2] [varchar](255) NULL,
	[COLUMN3] [varchar](255) NULL,
	[COLUMN4] [varchar](255) NULL,
	[COLUMN5] [varchar](255) NULL,
	[COLUMN6] [varchar](255) NULL,
	[COLUMN7] [varchar](255) NULL,
	[COLUMN8] [varchar](255) NULL,
	[COLUMN9] [varchar](255) NULL,
	[COLUMN10] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERPRODUCT]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERPRODUCT](
	[ORDERID] [int] IDENTITY(1,1) NOT NULL,
	[USERID] [int] NOT NULL,
	[ORDERDATE] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAYMENT]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT](
	[PAYMENTID] [int] IDENTITY(1,1) NOT NULL,
	[PAYMENTMETHOD] [varchar](20) NOT NULL,
	[TOTALAMOUNT] [int] NOT NULL,
	[ORDERID] [int] NOT NULL,
	[PAYMENTSTATUS] [varchar](20) NOT NULL,
	[PAYMENTDATE] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PAYMENTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[PID] [varchar](20) NOT NULL,
	[NAME] [varchar](20) NOT NULL,
	[BRANDID] [int] NOT NULL,
	[PRICE] [int] NOT NULL,
	[REVIEW] [nvarchar](200) NOT NULL,
	[IMAGE_LINK] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTINVENTORY]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTINVENTORY](
	[PIID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [varchar](20) NOT NULL,
	[SIZE] [int] NOT NULL,
	[COLORID] [int] NOT NULL,
	[AMOUNT] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [productinventoryNotDup] UNIQUE NONCLUSTERED 
(
	[PID] ASC,
	[SIZE] ASC,
	[COLORID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHIP]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHIP](
	[SHIPID] [int] IDENTITY(1,1) NOT NULL,
	[DELIVERYSTARTDATE] [smalldatetime] NULL,
	[ORDERID] [int] NOT NULL,
	[SHIPSTATUS] [varchar](20) NOT NULL,
	[SHIPADDRESS] [varchar](200) NOT NULL,
	[SHIPPHONE] [varchar](10) NOT NULL,
	[SHIPNAME] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SHIPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERCARTPRODUCT]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERCARTPRODUCT](
	[CARTNUMBER] [int] IDENTITY(1,1) NOT NULL,
	[PIID] [int] NOT NULL,
	[QUANTITY] [int] NOT NULL,
	[CARTID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CARTNUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CUSTOMER] ADD  DEFAULT (getdate()) FOR [REGTIME]
GO
ALTER TABLE [dbo].[logsomething] ADD  DEFAULT (getdate()) FOR [COLUMN10]
GO
ALTER TABLE [dbo].[ORDERPRODUCT] ADD  DEFAULT (getdate()) FOR [ORDERDATE]
GO
ALTER TABLE [dbo].[PAYMENT] ADD  DEFAULT (getdate()) FOR [PAYMENTDATE]
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD FOREIGN KEY([USERID])
REFERENCES [dbo].[CUSTOMER] ([ID])
GO
ALTER TABLE [dbo].[ITEMLIST]  WITH CHECK ADD FOREIGN KEY([ITEMPIID])
REFERENCES [dbo].[PRODUCTINVENTORY] ([PIID])
GO
ALTER TABLE [dbo].[ITEMLIST]  WITH CHECK ADD FOREIGN KEY([ORDERID])
REFERENCES [dbo].[ORDERPRODUCT] ([ORDERID])
GO
ALTER TABLE [dbo].[ORDERPRODUCT]  WITH CHECK ADD FOREIGN KEY([USERID])
REFERENCES [dbo].[CUSTOMER] ([ID])
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD FOREIGN KEY([ORDERID])
REFERENCES [dbo].[ORDERPRODUCT] ([ORDERID])
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([BRANDID])
REFERENCES [dbo].[BRAND] ([BRANDID])
GO
ALTER TABLE [dbo].[PRODUCTINVENTORY]  WITH CHECK ADD FOREIGN KEY([COLORID])
REFERENCES [dbo].[COLOR] ([COLORID])
GO
ALTER TABLE [dbo].[PRODUCTINVENTORY]  WITH CHECK ADD FOREIGN KEY([PID])
REFERENCES [dbo].[PRODUCT] ([PID])
GO
ALTER TABLE [dbo].[SHIP]  WITH CHECK ADD FOREIGN KEY([ORDERID])
REFERENCES [dbo].[ORDERPRODUCT] ([ORDERID])
GO
ALTER TABLE [dbo].[USERCARTPRODUCT]  WITH CHECK ADD FOREIGN KEY([CARTID])
REFERENCES [dbo].[CART] ([CARTID])
GO
ALTER TABLE [dbo].[USERCARTPRODUCT]  WITH CHECK ADD FOREIGN KEY([PIID])
REFERENCES [dbo].[PRODUCTINVENTORY] ([PIID])
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [checkSex] CHECK  (([SEX]='Fermale' OR [SEX]='Male' OR [SEX]='Woman' OR [SEX]='Man'))
GO


/****** Object:  StoredProcedure [dbo].[CREATEORDER]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*select SUM(quantity*price) as totalcart from USERCARTPRODUCT usc join PRODUCTINVENTORY proin on usc.piid=proin.piid join product pro on pro.PID=proin.PID join cart on usc.cartid=cart.CARTID  where userid=2*/
CREATE PROCEDURE [dbo].[CREATEORDER] (@USERID INT, @SHIPADDRESS VARCHAR(200), @PHONE VARCHAR(10), @NAME VARCHAR(20))
AS 
BEGIN

	DECLARE @PIID INT
	DECLARE @QUANTITY INT
	DECLARE @ORDERID INT
	DECLARE @PRICE INT
	DECLARE @CASH INT
	DECLARE @TOTALCART INT
	DECLARE @COUNT INT

	SELECT @CASH=CASH FROM CUSTOMER WHERE ID = @USERID;
	select @TOTALCART=SUM(quantity*price) from USERCARTPRODUCT usc join PRODUCTINVENTORY proin on usc.piid=proin.piid join product pro on pro.PID=proin.PID join cart on usc.cartid=cart.CARTID  where userid=@USERID

	DECLARE @AMOUNT INT;

	IF (@CASH >= @TOTALCART)
		BEGIN
			SELECT @COUNT=COUNT(CARTNUMBER) FROM USERCARTPRODUCT usc join cart on usc.cartid=cart.cartid where userid=@USERID 
				IF @COUNT > 0	declare @test1 int

				INSERT INTO ORDERPRODUCT(USERID) VALUES (@userid) SELECT @ORDERID=SCOPE_IDENTITY()
				WHILE @COUNT > 0
					BEGIN
						SELECT @PIID=PIID, @QUANTITY=QUANTITY FROM USERCARTPRODUCT usc join cart on usc.cartid=cart.cartid where userid=@USERID 
						SELECT @PRICE=PRICE FROM PRODUCTINVENTORY proin join PRODUCT pro ON proin.PID=pro.PID where PIID=@PIID
						
			
						INSERT INTO ITEMLIST VALUES(@PIID,@QUANTITY,@PRICE,@ORDERID)

						--delete from cart
						DELETE FROM USERCARTPRODUCT WHERE PIID=@PIID

						--Tru so luong trong kho
						UPDATE PRODUCTINVENTORY
						SET AMOUNT = AMOUNT - @QUANTITY
						WHERE PIID=@PIID
	
						SET @COUNT = @COUNT - 1;
					END

		SELECT @ORDERID as orderid

		DECLARE @TOTAL INT
		select @TOTAL=SUM(itemquantity*priceitem) from itemlist join orderproduct on itemlist.orderid=orderproduct.orderid where itemlist.orderid=@ORDERID and userid=@USERID GROUP BY itemlist.orderid
		
		UPDATE CUSTOMER SET CASH = CASH - @TOTALCART WHERE ID=@USERID

		insert into payment(PAYMENTMETHOD,TOTALAMOUNT,ORDERID,PAYMENTSTATUS) values('CASH',@TOTAL,@ORDERID,'SUCCESS')
		insert into ship(ORDERID,DELIVERYSTARTDATE,SHIPSTATUS,SHIPADDRESS,SHIPPHONE,SHIPNAME) values(@ORDERID, NULL,'NOT DELIVERY', @SHIPADDRESS, @PHONE, @NAME)

		END
END;
GO
/****** Object:  StoredProcedure [dbo].[deletebrand]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletebrand] (@Brandid int, @Adminid int)
AS 
BEGIN
	
	declare @Brandname varchar(20)

	select @Brandname=brandname from BRAND where Brandid = @Brandid

	select @Adminid=Adminid from AdminManager where Adminid=@Adminid

	declare @Count int
	select @Count=COUNT(Adminid) from AdminManager where Adminid=@Adminid

	if (@Count>0) 
		begin
			declare @logid int
			INSERT INTO logsomething values ('DeletedBrand',@Brandid,@BrandName,@Adminid,'-','-','-','-','-',CURRENT_TIMESTAMP)	SELECT @logid=SCOPE_IDENTITY()
			declare @countdeleted int
			delete from BRAND where BRANDID = @Brandid SELECT @countdeleted=@@ROWCOUNT;       
			if (@countdeleted > 0)
				begin 
					UPDATE logsomething Set COLUMN5 = 'Success!' where ID=@logid
				end
			else
					UPDATE logsomething Set COLUMN5 = 'Fail!' where ID=@logid
		end
	else
		begin

		INSERT INTO logsomething values ('Delete Brand?Fail',@Brandid,@BrandName,@Adminid,'-','-','-','-','-',CURRENT_TIMESTAMP)
			
		end

END;
GO
/****** Object:  StoredProcedure [dbo].[deletecolor]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletecolor] (@Colorid int, @Adminid int)
AS 
BEGIN
	
	declare @Colorname varchar(20)

	select @Colorname=Colorname from COLOR where Colorid = @Colorid

	select @Adminid=Adminid from AdminManager where Adminid=@Adminid

	declare @Count int
	select @Count=COUNT(Adminid) from AdminManager where Adminid=@Adminid

	if (@Count>0) 
		begin
			declare @logid int
			INSERT INTO logsomething values ('DeletedColor',@Colorid,@Colorname,@Adminid,'-','-','-','-','-',CURRENT_TIMESTAMP)	SELECT @logid=SCOPE_IDENTITY()
			declare @countdeleted int
			delete from Color where Colorid = @Colorid SELECT @countdeleted=@@ROWCOUNT;       
			if (@countdeleted > 0)
				begin 
					UPDATE logsomething Set COLUMN5 = 'Success!' where ID=@logid
				end
			else
					UPDATE logsomething Set COLUMN5 = 'Fail!' where ID=@logid
		end
	else
		begin

		INSERT INTO logsomething values ('Delete Color?Fail',@Colorid,@Colorname,@Adminid,'-','-','-','-','-',CURRENT_TIMESTAMP)
			
		end

END;
GO



/****** Object:  StoredProcedure [dbo].[doneship]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doneship] (@orderid int, @adminid int)
as
begin
	declare @shipid int	
	select @shipid=SHIPID from ORDERPRODUCT orderp join PAYMENT p on orderp.ORDERID=p.ORDERID join SHIP sh on sh.ORDERID=orderp.ORDERID where orderp.ORDERID=@orderid

	select @Adminid=Adminid from AdminManager where Adminid=@Adminid

	declare @Count int
	select @Count=COUNT(Adminid) from AdminManager where Adminid=@Adminid

	if (@Count>0) 
		begin
			declare @logid int
			declare @shipstatus varchar(20)
			INSERT INTO logsomething values ('Done ship',@orderid,@Adminid,'-','-','-','-','-','-',CURRENT_TIMESTAMP)	SELECT @logid=SCOPE_IDENTITY()
			
			select @shipid=SHIPID,@shipstatus=shipstatus from ORDERPRODUCT orderp join PAYMENT p on orderp.ORDERID=p.ORDERID join SHIP sh on sh.ORDERID=orderp.ORDERID where orderp.ORDERID=@orderid

			declare @countupdate int
			if (@shipstatus='SHIPPING')
			BEGIN
					update SHIP set SHIPSTATUS='DONE' where SHIPID=@shipid SELECT @countupdate=@@ROWCOUNT
			END  
			if (@countupdate > 0)
				begin 
					UPDATE logsomething Set COLUMN5 = 'Success!' where ID=@logid
				end
			else
					UPDATE logsomething Set COLUMN5 = 'Fail!' where ID=@logid
		end
	else
		begin

		INSERT INTO logsomething values ('Doneship ???',@orderid,@Adminid,'-','-','-','-','-','-',CURRENT_TIMESTAMP)
		
		end
	select column5 as status from logsomething where id=@logid
end
GO
/****** Object:  StoredProcedure [dbo].[edituser]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[edituser] (@Adminid int, @userid int, @name varchar(30), @pass varchar(20), @sex varchar(10), @email varchar(30), @phone varchar(10), @address varchar(100), @cash int)
AS 
BEGIN

	select @Adminid=Adminid from AdminManager where Adminid=@Adminid
	declare @Count int
	select @Count=COUNT(Adminid) from AdminManager where Adminid=@Adminid
	if (@Count>0) 
		begin
			declare @logid int
			INSERT INTO logsomething values ('edituser',@Adminid,@userid,@name,@pass,@email,@phone,@cash,'-',CURRENT_TIMESTAMP) SELECT @logid=SCOPE_IDENTITY()
			declare @countupdate int
				UPDATE CUSTOMER SET name=@name, PASSWORD=@pass, sex=@sex, email=@email, phone=@phone, cash=@cash, address=@address where id=@userid SELECT @countupdate=@@ROWCOUNT;    	
			if (@countupdate > 0)
				begin 
					UPDATE logsomething Set COLUMN9 = 'Success!' where ID=@logid
				end
			else
					UPDATE logsomething Set COLUMN9 = 'Fail!' where ID=@logid
		end
	else
		begin
		INSERT INTO logsomething values ('edituser',@Adminid,@userid,@name,@pass,@email,@phone,@cash,'Fail!',CURRENT_TIMESTAMP) SELECT @logid=SCOPE_IDENTITY()
		end
	select column9 as status from logsomething where id=@logid
END;
GO
/****** Object:  StoredProcedure [dbo].[INSERTINTOCART]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTINTOCART] (@USERID INT, @COLORNAME VARCHAR(20), @SIZE INT, @QUANTITY INT, @PID VARCHAR(20))
AS 
BEGIN
	DECLARE @PIID INT
	DECLARE @CARTID INT 
	DECLARE @COUNTCART INT 

	SELECT @COUNTCART=COUNT(cartid) from cart where userid=@USERID
	SELECT @CARTID=cartid from cart where userid=@USERID

	--THEM CART ID NEU CHUA CO	IF (@CARTID > 0) 
		IF(@COUNTCART < 1)
			BEGIN
				INSERT INTO CART VALUES(@USERID)
			END
		
	SELECT @PIID=piid FROM PRODUCTINVENTORY proin join product pro on proin.PID=pro.PID join COLOR on color.COLORID=proin.COLORID where colorname=@COLORNAME and size=@SIZE and PRO.pid=@PID
	

	--THEM SO LUONG NEU TON TAI
	DECLARE @ADD INT
		select @ADD=quantity from usercartproduct usc join cart on usc.cartid=cart.cartid where userid=@USERID and piid=@PIID
		IF (@ADD > 0)
			BEGIN
			UPDATE USERCARTPRODUCT SET quantity = @ADD + @QUANTITY where piid=@PIID
			END
		ELSE
			BEGIN
			INSERT INTO USERCARTPRODUCT(PIID,QUANTITY,CARTID) VALUES(@PIID,@QUANTITY,@CARTID)
			END
	select * from USERCARTPRODUCT where cartid=@CARTID
END;
GO
/****** Object:  StoredProcedure [dbo].[REGISTATOR]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REGISTATOR] (@USERNAME VARCHAR(20), @PASSWORD VARCHAR(20))
AS 
BEGIN
	declare @id int
	INSERT INTO CUSTOMER(USERNAME,PASSWORD,NAME,SEX,EMAIL,PHONE,ADDRESS,CASH) VALUES(@USERNAME, @USERNAME,'NOT UPDATED','Male','NOT UPDATED','NOT UPDATED','NOT UPDATED', 0) select @id=SCOPE_IDENTITY()  
	INSERT INTO CART values(@id)	
	
	SELECT * FROM CUSTOMER WHERE ID=@id;
END;
GO
/****** Object:  StoredProcedure [dbo].[shiptocustomer]    Script Date: 3/12/2022 10:57:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[shiptocustomer] (@orderid int, @adminid int)
as
begin
	declare @shipid int	
	declare @shipstatus varchar(20)


	select @Adminid=Adminid from AdminManager where Adminid=@Adminid

	declare @Count int
	select @Count=COUNT(Adminid) from AdminManager where Adminid=@Adminid

	if (@Count>0) 
		begin
			declare @logid int
			INSERT INTO logsomething values ('Ship to cus',@orderid,@Adminid,'-','-','-','-','-','-',CURRENT_TIMESTAMP)	SELECT @logid=SCOPE_IDENTITY()
			
			select @shipid=SHIPID,@shipstatus=shipstatus from ORDERPRODUCT orderp join PAYMENT p on orderp.ORDERID=p.ORDERID join SHIP sh on sh.ORDERID=orderp.ORDERID where orderp.ORDERID=@orderid

			declare @countupdate int
			if (@shipstatus='NOT DELIVERY')
			BEGIN
					update SHIP set DELIVERYSTARTDATE=CURRENT_TIMESTAMP, SHIPSTATUS='SHIPPING' where SHIPID=@shipid SELECT @countupdate=@@ROWCOUNT
			END  
			if (@countupdate > 0)
				begin 
					UPDATE logsomething Set COLUMN5 = 'Success!' where ID=@logid
				end
			else
					UPDATE logsomething Set COLUMN5 = 'Fail!' where ID=@logid
		end
	else
		begin

		INSERT INTO logsomething values ('Ship to cus ???',@orderid,@Adminid,'-','-','-','-','-','-',CURRENT_TIMESTAMP)
		
		end
	select column5 as status from logsomething where id=@logid
end
GO

create proc insertInventory (@pid varchar(20), @size int, @colorid int, @amount int)
as
begin
	DECLARE @PIID INT
	DECLARE @COUNTPIID INT 

	SELECT @PIID=PIID FROM PRODUCTINVENTORY WHERE PID=@PID AND SIZE=@SIZE AND COLORID=@COLORID

	SELECT @COUNTPIID=COUNT(PIID) from PRODUCTINVENTORY WHERE PID=@PID AND SIZE=@SIZE AND COLORID=@COLORID

	--THEM NEU CHUA CO 
		IF(@COUNTPIID < 1)
			BEGIN
				INSERT INTO PRODUCTINVENTORY(PID,SIZE,COLORID,AMOUNT) VALUES(@pid,@size,@colorid,@amount)
			END
		ELSE
			BEGIN
	--THEM SO LUONG NEU TON TAI
				UPDATE PRODUCTINVENTORY SET AMOUNT = AMOUNT + @AMOUNT where piid=@PIID			
			END
end
GO
EXEC insertInventory 'T789',38,1,1
go
create trigger addcart
    on USERCARTPRODUCT
    after update, insert
    as
    begin

	 SET NOCOUNT ON;

     
	 Declare @piid int

	 SELECT @piid=piid FROM inserted;

	 Declare @amount int
	 Declare @quantity int

	 select @amount=amount from PRODUCTINVENTORY where piid=@piid
	 select @quantity=quantity from USERCARTPRODUCT where piid=@piid

	
      if  (@quantity > @amount)
		  begin
			rollback;	 
		  end;
    end
go
	/*
	insert into USERCARTPRODUCT values (9,1,1)
	update USERCARTPRODUCT set QUANTITY = QUANTITY - 1 where CARTNUMBER = 63
	select * from USERCARTPRODUCT
	*/
	go
create trigger reduce
    on USERCARTPRODUCT

    after update, insert
    as
    begin
	SET NOCOUNT ON;
      Declare @count int
	  Select top 1 @count=quantity from USERCARTPRODUCT order by quantity asc	  
      if  (@count <= 0)
		  begin
		  Delete from USERCARTPRODUCT where quantity <= 0
		  rollback;
		  end;
    end
go

go
select * from PRODUCTINVENTORY

	


create trigger addinventory
    on PRODUCTINVENTORY
    AFTER INSERT 
	as
    begin
	SET NOCOUNT ON;
	
	  Select top 1 @count=amount from PRODUCTINVENTORY where color order by amount asc 
	  
	  select @count

      if  (@count <= 0)
		  begin
		  Delete from USERCARTPRODUCT where quantity <= 0
		  rollback;
		  end;
    end
go

/*
go
drop trigger addinventory

create trigger addinventory
   on PRODUCTINVENTORY
   AFTER INSERT 
   as  

BEGIN
	declare @pid varchar(20)
	declare @size int
	declare @colorid int
	declare @amount int

	select @pid=pid,@amount=amount,@size=size,@colorid=colorid from inserted
	update PRODUCTINVENTORY set amount=amount+@amount where pid=@pid and size=@size and colorid=@colorid
END
go

insert into PRODUCTINVENTORY(PID,SIZE,COLORID,AMOUNT) values('T123',38,1,1) */

select * from product
GO
CREATE PROCEDURE deleteproduct (@pid varchar(20), @Adminid int)
AS 
BEGIN
	Declare @name varchar(20)
	Declare @brandid int
	Declare @price int
	Declare @review varchar(200)
	Declare @image_link varchar(255)
	select @name=NAME,@brandid=BRANDID,@price=PRICE,@review=REVIEW,@image_link=IMAGE_LINK from product where PID=@pid

	select @Adminid=Adminid from AdminManager where Adminid=@Adminid

	declare @Count int
	select @Count=COUNT(Adminid) from AdminManager where Adminid=@Adminid

	if (@Count>0) 
		begin
			declare @logid int
			INSERT INTO logsomething values ('DeleteProduct',@name,@brandid,@price,@review,@image_link,@adminid,'-','-',CURRENT_TIMESTAMP)	SELECT @logid=SCOPE_IDENTITY()
			declare @countdeleted int
			delete from PRODUCT where pid = @pid SELECT @countdeleted=@@ROWCOUNT;       
			if (@countdeleted > 0)
				begin 
					UPDATE logsomething Set COLUMN9 = 'Success!' where ID=@logid
				end
			else
					UPDATE logsomething Set COLUMN9 = 'Fail!' where ID=@logid
		end
	else
		begin

		INSERT INTO logsomething values ('DeleteProduct',@name,@brandid,@price,@review,@image_link,@adminid,'-','Fail!',CURRENT_TIMESTAMP) SELECT @logid=SCOPE_IDENTITY()
			
		end

		select column9 as status from logsomething where id=@logid

END;
GO
			
			select * from logsomething
