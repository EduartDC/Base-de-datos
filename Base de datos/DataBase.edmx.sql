
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/21/2023 23:13:45
-- Generated from EDMX file: C:\Users\Eduar\source\repos\Base de datos\Base de datos\DataBase.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Mex];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_SalesArticles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Belongings_Articles] DROP CONSTRAINT [FK_SalesArticles];
GO
IF OBJECT_ID(N'[dbo].[FK_StaffOperations]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Operations] DROP CONSTRAINT [FK_StaffOperations];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomersContracts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contracts] DROP CONSTRAINT [FK_CustomersContracts];
GO
IF OBJECT_ID(N'[dbo].[FK_ContractsBelongings]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Belongings] DROP CONSTRAINT [FK_ContractsBelongings];
GO
IF OBJECT_ID(N'[dbo].[FK_BelongingsImagesBelonging]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ImagesBelongings] DROP CONSTRAINT [FK_BelongingsImagesBelonging];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomersImagesIdentification]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ImagesIdentifications] DROP CONSTRAINT [FK_CustomersImagesIdentification];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomersSales]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [FK_CustomersSales];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomersSetAside]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SetAsides] DROP CONSTRAINT [FK_CustomersSetAside];
GO
IF OBJECT_ID(N'[dbo].[FK_SetAsideOperations]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Operations] DROP CONSTRAINT [FK_SetAsideOperations];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOperations]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [FK_SalesOperations];
GO
IF OBJECT_ID(N'[dbo].[FK_ContractsOperations]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Operations] DROP CONSTRAINT [FK_ContractsOperations];
GO
IF OBJECT_ID(N'[dbo].[FK_SetAsideArticlesSetAside]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticlesSetAsides] DROP CONSTRAINT [FK_SetAsideArticlesSetAside];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticlesArticlesSetAside]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticlesSetAsides] DROP CONSTRAINT [FK_ArticlesArticlesSetAside];
GO
IF OBJECT_ID(N'[dbo].[FK_Articles_inherits_Belongings]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Belongings_Articles] DROP CONSTRAINT [FK_Articles_inherits_Belongings];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[SetAsides]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SetAsides];
GO
IF OBJECT_ID(N'[dbo].[Belongings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Belongings];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Contracts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contracts];
GO
IF OBJECT_ID(N'[dbo].[Staffs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Staffs];
GO
IF OBJECT_ID(N'[dbo].[Sales]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sales];
GO
IF OBJECT_ID(N'[dbo].[Operations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Operations];
GO
IF OBJECT_ID(N'[dbo].[ArticlesSetAsides]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ArticlesSetAsides];
GO
IF OBJECT_ID(N'[dbo].[ImagesIdentifications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ImagesIdentifications];
GO
IF OBJECT_ID(N'[dbo].[ImagesBelongings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ImagesBelongings];
GO
IF OBJECT_ID(N'[dbo].[Belongings_Articles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Belongings_Articles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'SetAsides'
CREATE TABLE [dbo].[SetAsides] (
    [idSetAside] int IDENTITY(1,1) NOT NULL,
    [creationDate] datetime  NOT NULL,
    [deadlineDate] datetime  NOT NULL,
    [totalAmount] float  NOT NULL,
    [reaminingAmount] float  NOT NULL,
    [percentage] nvarchar(max)  NOT NULL,
    [Customer_idCustomer] int  NOT NULL
);
GO

-- Creating table 'Belongings'
CREATE TABLE [dbo].[Belongings] (
    [idBelonging] int IDENTITY(1,1) NOT NULL,
    [appraisalValue] float  NOT NULL,
    [category] nvarchar(max)  NOT NULL,
    [description] nvarchar(max)  NULL,
    [characteristics] nvarchar(max)  NOT NULL,
    [loanAmount] float  NOT NULL,
    [serialNumber] nvarchar(max)  NOT NULL,
    [Contract_idContract] int  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [idCustomer] int IDENTITY(1,1) NOT NULL,
    [curp] nvarchar(max)  NOT NULL,
    [blackList] bit  NULL,
    [address] nvarchar(max)  NOT NULL,
    [firstName] nvarchar(max)  NOT NULL,
    [lastName] nvarchar(max)  NOT NULL,
    [identification] nvarchar(max)  NULL,
    [telephonNumber] int  NOT NULL,
    [cumulativeProfit] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Contracts'
CREATE TABLE [dbo].[Contracts] (
    [idContract] int IDENTITY(1,1) NOT NULL,
    [loanAmount] float  NOT NULL,
    [idContractPrevious] int  NULL,
    [deadlineDate] datetime  NOT NULL,
    [creationDate] datetime  NOT NULL,
    [state] nvarchar(max)  NOT NULL,
    [iva] int  NOT NULL,
    [interestRate] int  NULL,
    [renewalFee] float  NOT NULL,
    [settlementAmount] float  NOT NULL,
    [duration] int  NOT NULL,
    [Customer_idCustomer] int  NOT NULL
);
GO

-- Creating table 'Staffs'
CREATE TABLE [dbo].[Staffs] (
    [idStaff] int IDENTITY(1,1) NOT NULL,
    [status] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [fisrtName] nvarchar(max)  NOT NULL,
    [lastName] nvarchar(max)  NOT NULL,
    [userName] nvarchar(max)  NOT NULL,
    [rol] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Sales'
CREATE TABLE [dbo].[Sales] (
    [idSale] int IDENTITY(1,1) NOT NULL,
    [total] float  NOT NULL,
    [subtotal] float  NOT NULL,
    [saleDate] datetime  NOT NULL,
    [discount] nvarchar(max)  NOT NULL,
    [Customer_idCustomer] int  NOT NULL
);
GO

-- Creating table 'Operations'
CREATE TABLE [dbo].[Operations] (
    [idOperation] int IDENTITY(1,1) NOT NULL,
    [operationDate] datetime  NOT NULL,
    [paymentAmount] float  NOT NULL,
    [receivedAmount] float  NOT NULL,
    [changeAmount] float  NOT NULL,
    [Staff_idStaff] int  NOT NULL,
    [SetAside_idSetAside] int  NULL,
    [Contract_idContract] int  NULL,
    [Sale_idSale] int  NULL
);
GO

-- Creating table 'ArticlesSetAsides'
CREATE TABLE [dbo].[ArticlesSetAsides] (
    [idArticlesSetAside] int IDENTITY(1,1) NOT NULL,
    [discount] int  NOT NULL,
    [SetAside_idSetAside] int  NOT NULL,
    [Article_idBelonging] int  NOT NULL
);
GO

-- Creating table 'ImagesIdentifications'
CREATE TABLE [dbo].[ImagesIdentifications] (
    [idImagenIdentification] int IDENTITY(1,1) NOT NULL,
    [imagen] varbinary(max)  NOT NULL,
    [Customer_idCustomer] int  NOT NULL
);
GO

-- Creating table 'ImagesBelongings'
CREATE TABLE [dbo].[ImagesBelongings] (
    [idImagenBelonging] int IDENTITY(1,1) NOT NULL,
    [imagen] varbinary(max)  NOT NULL,
    [Belonging_idBelonging] int  NOT NULL
);
GO

-- Creating table 'Belongings_Articles'
CREATE TABLE [dbo].[Belongings_Articles] (
    [idArticle] int IDENTITY(1,1) NOT NULL,
    [barCode] nvarchar(max)  NULL,
    [sellingPrice] float  NULL,
    [state] nvarchar(max)  NOT NULL,
    [customerProfit] nvarchar(max)  NOT NULL,
    [storeProfit] nvarchar(max)  NOT NULL,
    [creationDate] datetime  NOT NULL,
    [idBelonging] int  NOT NULL,
    [Sale_idSale] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idSetAside] in table 'SetAsides'
ALTER TABLE [dbo].[SetAsides]
ADD CONSTRAINT [PK_SetAsides]
    PRIMARY KEY CLUSTERED ([idSetAside] ASC);
GO

-- Creating primary key on [idBelonging] in table 'Belongings'
ALTER TABLE [dbo].[Belongings]
ADD CONSTRAINT [PK_Belongings]
    PRIMARY KEY CLUSTERED ([idBelonging] ASC);
GO

-- Creating primary key on [idCustomer] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([idCustomer] ASC);
GO

-- Creating primary key on [idContract] in table 'Contracts'
ALTER TABLE [dbo].[Contracts]
ADD CONSTRAINT [PK_Contracts]
    PRIMARY KEY CLUSTERED ([idContract] ASC);
GO

-- Creating primary key on [idStaff] in table 'Staffs'
ALTER TABLE [dbo].[Staffs]
ADD CONSTRAINT [PK_Staffs]
    PRIMARY KEY CLUSTERED ([idStaff] ASC);
GO

-- Creating primary key on [idSale] in table 'Sales'
ALTER TABLE [dbo].[Sales]
ADD CONSTRAINT [PK_Sales]
    PRIMARY KEY CLUSTERED ([idSale] ASC);
GO

-- Creating primary key on [idOperation] in table 'Operations'
ALTER TABLE [dbo].[Operations]
ADD CONSTRAINT [PK_Operations]
    PRIMARY KEY CLUSTERED ([idOperation] ASC);
GO

-- Creating primary key on [idArticlesSetAside] in table 'ArticlesSetAsides'
ALTER TABLE [dbo].[ArticlesSetAsides]
ADD CONSTRAINT [PK_ArticlesSetAsides]
    PRIMARY KEY CLUSTERED ([idArticlesSetAside] ASC);
GO

-- Creating primary key on [idImagenIdentification] in table 'ImagesIdentifications'
ALTER TABLE [dbo].[ImagesIdentifications]
ADD CONSTRAINT [PK_ImagesIdentifications]
    PRIMARY KEY CLUSTERED ([idImagenIdentification] ASC);
GO

-- Creating primary key on [idImagenBelonging] in table 'ImagesBelongings'
ALTER TABLE [dbo].[ImagesBelongings]
ADD CONSTRAINT [PK_ImagesBelongings]
    PRIMARY KEY CLUSTERED ([idImagenBelonging] ASC);
GO

-- Creating primary key on [idBelonging] in table 'Belongings_Articles'
ALTER TABLE [dbo].[Belongings_Articles]
ADD CONSTRAINT [PK_Belongings_Articles]
    PRIMARY KEY CLUSTERED ([idBelonging] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Sale_idSale] in table 'Belongings_Articles'
ALTER TABLE [dbo].[Belongings_Articles]
ADD CONSTRAINT [FK_SalesArticles]
    FOREIGN KEY ([Sale_idSale])
    REFERENCES [dbo].[Sales]
        ([idSale])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesArticles'
CREATE INDEX [IX_FK_SalesArticles]
ON [dbo].[Belongings_Articles]
    ([Sale_idSale]);
GO

-- Creating foreign key on [Staff_idStaff] in table 'Operations'
ALTER TABLE [dbo].[Operations]
ADD CONSTRAINT [FK_StaffOperations]
    FOREIGN KEY ([Staff_idStaff])
    REFERENCES [dbo].[Staffs]
        ([idStaff])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StaffOperations'
CREATE INDEX [IX_FK_StaffOperations]
ON [dbo].[Operations]
    ([Staff_idStaff]);
GO

-- Creating foreign key on [Customer_idCustomer] in table 'Contracts'
ALTER TABLE [dbo].[Contracts]
ADD CONSTRAINT [FK_CustomersContracts]
    FOREIGN KEY ([Customer_idCustomer])
    REFERENCES [dbo].[Customers]
        ([idCustomer])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomersContracts'
CREATE INDEX [IX_FK_CustomersContracts]
ON [dbo].[Contracts]
    ([Customer_idCustomer]);
GO

-- Creating foreign key on [Contract_idContract] in table 'Belongings'
ALTER TABLE [dbo].[Belongings]
ADD CONSTRAINT [FK_ContractsBelongings]
    FOREIGN KEY ([Contract_idContract])
    REFERENCES [dbo].[Contracts]
        ([idContract])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ContractsBelongings'
CREATE INDEX [IX_FK_ContractsBelongings]
ON [dbo].[Belongings]
    ([Contract_idContract]);
GO

-- Creating foreign key on [Belonging_idBelonging] in table 'ImagesBelongings'
ALTER TABLE [dbo].[ImagesBelongings]
ADD CONSTRAINT [FK_BelongingsImagesBelonging]
    FOREIGN KEY ([Belonging_idBelonging])
    REFERENCES [dbo].[Belongings]
        ([idBelonging])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BelongingsImagesBelonging'
CREATE INDEX [IX_FK_BelongingsImagesBelonging]
ON [dbo].[ImagesBelongings]
    ([Belonging_idBelonging]);
GO

-- Creating foreign key on [Customer_idCustomer] in table 'ImagesIdentifications'
ALTER TABLE [dbo].[ImagesIdentifications]
ADD CONSTRAINT [FK_CustomersImagesIdentification]
    FOREIGN KEY ([Customer_idCustomer])
    REFERENCES [dbo].[Customers]
        ([idCustomer])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomersImagesIdentification'
CREATE INDEX [IX_FK_CustomersImagesIdentification]
ON [dbo].[ImagesIdentifications]
    ([Customer_idCustomer]);
GO

-- Creating foreign key on [Customer_idCustomer] in table 'Sales'
ALTER TABLE [dbo].[Sales]
ADD CONSTRAINT [FK_CustomersSales]
    FOREIGN KEY ([Customer_idCustomer])
    REFERENCES [dbo].[Customers]
        ([idCustomer])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomersSales'
CREATE INDEX [IX_FK_CustomersSales]
ON [dbo].[Sales]
    ([Customer_idCustomer]);
GO

-- Creating foreign key on [Customer_idCustomer] in table 'SetAsides'
ALTER TABLE [dbo].[SetAsides]
ADD CONSTRAINT [FK_CustomersSetAside]
    FOREIGN KEY ([Customer_idCustomer])
    REFERENCES [dbo].[Customers]
        ([idCustomer])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomersSetAside'
CREATE INDEX [IX_FK_CustomersSetAside]
ON [dbo].[SetAsides]
    ([Customer_idCustomer]);
GO

-- Creating foreign key on [SetAside_idSetAside] in table 'Operations'
ALTER TABLE [dbo].[Operations]
ADD CONSTRAINT [FK_SetAsideOperations]
    FOREIGN KEY ([SetAside_idSetAside])
    REFERENCES [dbo].[SetAsides]
        ([idSetAside])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SetAsideOperations'
CREATE INDEX [IX_FK_SetAsideOperations]
ON [dbo].[Operations]
    ([SetAside_idSetAside]);
GO

-- Creating foreign key on [Contract_idContract] in table 'Operations'
ALTER TABLE [dbo].[Operations]
ADD CONSTRAINT [FK_ContractsOperations]
    FOREIGN KEY ([Contract_idContract])
    REFERENCES [dbo].[Contracts]
        ([idContract])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ContractsOperations'
CREATE INDEX [IX_FK_ContractsOperations]
ON [dbo].[Operations]
    ([Contract_idContract]);
GO

-- Creating foreign key on [SetAside_idSetAside] in table 'ArticlesSetAsides'
ALTER TABLE [dbo].[ArticlesSetAsides]
ADD CONSTRAINT [FK_SetAsideArticlesSetAside]
    FOREIGN KEY ([SetAside_idSetAside])
    REFERENCES [dbo].[SetAsides]
        ([idSetAside])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SetAsideArticlesSetAside'
CREATE INDEX [IX_FK_SetAsideArticlesSetAside]
ON [dbo].[ArticlesSetAsides]
    ([SetAside_idSetAside]);
GO

-- Creating foreign key on [Article_idBelonging] in table 'ArticlesSetAsides'
ALTER TABLE [dbo].[ArticlesSetAsides]
ADD CONSTRAINT [FK_ArticlesArticlesSetAside]
    FOREIGN KEY ([Article_idBelonging])
    REFERENCES [dbo].[Belongings_Articles]
        ([idBelonging])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticlesArticlesSetAside'
CREATE INDEX [IX_FK_ArticlesArticlesSetAside]
ON [dbo].[ArticlesSetAsides]
    ([Article_idBelonging]);
GO

-- Creating foreign key on [Sale_idSale] in table 'Operations'
ALTER TABLE [dbo].[Operations]
ADD CONSTRAINT [FK_OperationsSales]
    FOREIGN KEY ([Sale_idSale])
    REFERENCES [dbo].[Sales]
        ([idSale])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OperationsSales'
CREATE INDEX [IX_FK_OperationsSales]
ON [dbo].[Operations]
    ([Sale_idSale]);
GO

-- Creating foreign key on [idBelonging] in table 'Belongings_Articles'
ALTER TABLE [dbo].[Belongings_Articles]
ADD CONSTRAINT [FK_Articles_inherits_Belongings]
    FOREIGN KEY ([idBelonging])
    REFERENCES [dbo].[Belongings]
        ([idBelonging])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------