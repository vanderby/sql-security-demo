﻿-- Auto-generated by Entity Framework
CREATE TABLE [dbo].[Contacts] (
    [ContactId] [int] NOT NULL IDENTITY,
    [Name] [nvarchar](max),
    [Address] [nvarchar](max),
    [City] [nvarchar](max),
    [State] [nvarchar](max),
    [Zip] [nvarchar](max),
    [Email] [nvarchar](max),
    CONSTRAINT [PK_dbo.Contacts] PRIMARY KEY ([ContactId])
)
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] [nvarchar](128) NOT NULL,
    [Name] [nvarchar](256) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY ([Id])
)
CREATE UNIQUE INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]([Name])
CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] [nvarchar](128) NOT NULL,
    [RoleId] [nvarchar](128) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId])
)
CREATE INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]([UserId])
CREATE INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]([RoleId])
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] [nvarchar](128) NOT NULL,
    [Email] [nvarchar](256),
    [EmailConfirmed] [bit] NOT NULL,
    [PasswordHash] [nvarchar](max),
    [SecurityStamp] [nvarchar](max),
    [PhoneNumber] [nvarchar](max),
    [PhoneNumberConfirmed] [bit] NOT NULL,
    [TwoFactorEnabled] [bit] NOT NULL,
    [LockoutEndDateUtc] [datetime],
    [LockoutEnabled] [bit] NOT NULL,
    [AccessFailedCount] [int] NOT NULL,
    [UserName] [nvarchar](256) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY ([Id])
)
CREATE UNIQUE INDEX [UserNameIndex] ON [dbo].[AspNetUsers]([UserName])
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] [int] NOT NULL IDENTITY,
    [UserId] [nvarchar](128) NOT NULL,
    [ClaimType] [nvarchar](max),
    [ClaimValue] [nvarchar](max),
    CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]([UserId])
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] [nvarchar](128) NOT NULL,
    [ProviderKey] [nvarchar](128) NOT NULL,
    [UserId] [nvarchar](128) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey], [UserId])
)
CREATE INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]([UserId])
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserClaims] ADD CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserLogins] ADD CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
CREATE TABLE [dbo].[__MigrationHistory] (
    [MigrationId] [nvarchar](150) NOT NULL,
    [ContextKey] [nvarchar](300) NOT NULL,
    [Model] [varbinary](max) NOT NULL,
    [ProductVersion] [nvarchar](32) NOT NULL,
    CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
)
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201510220150018_Initial', N'ContactManager.Migrations.Configuration',  0x1F8B0800000000000400DD5CDB6EE436127D0FB0FF20E86937705ABE6406B3467B064EDB4E8C8C2F98F6048B7D19B025765B18895224CAB111E4CBF6613F29BF1052A22EBC49544B7D7110209896C853C5E221592C55F9CFFFFD7FFAE1390CAC2798A47E84CEECA3C9A16D41E4469E8F5667768697DFBDB33FBCFFC737D34B2F7CB67E29DB9DD076A4274ACFEC478CE353C749DD4718827412FA6E12A5D1124FDC2874801739C78787FF768E8E1C48206C826559D34F19C27E08F31FE4E72C422E8C7106829BC88341CA9E9337F31CD5BA05214C63E0C2339BB4C5C0C5370081154C264507DB3A0F7C409499C360695B00A108034C543DFD9CC2394E22B49AC7E401081E5E6248DA2D4190423684D3BAB9E9680E8FE9689CBA6309E566298EC29E804727CC3C8ED87D2D23DB95F988012F89A1F10B1D756EC4CA7EB625CA3A9D05096DA731F1843D3DB0F8D707152B0879E87FA44116E02C816708663801C181759F2D02DFFD19BE3C445F213A4359103495246A9277DC03F2E83E896298E0974F70C9AB7EEDD996C37777C4FE556FB96B31C66B844F8E6DEB96A8021601AC18D1B0C71C4709FC112298000CBD7B80314CC8845E7B30B7A9A4842092FEBF9446284816946DDD80E78F10ADF0E3994DFE695B57FE33F4CA274C83CFC827EB8F74C24906BB849C7B5E02D374E37266F980372C644E0CBF7993FDD78F372EE332047E30B294A953AFE5D6155E12F45314C0B6657E536D22E7697C0BF1A4EC382920AF1202F75B947C9D34110F2CE37EF5D6706CBA359C1C2D9627EFDEBC05DEC9DBEFE1C99B75B68975F6877A6350CCD6D1F13BA3D9923693411BC4F19BB7A348BD054FFE2A9F7A413E391A13B2737C8241FE367DF4E3E200E5E6FB0B6B76954421FDCDF3AB78FB651E65894B0713699B3C806405F1404A53A8F1695DA2EE3FB5A9A632BD954DE980D65909A5886DAF8652DFCDCA3566DC791C93C9CBA9452DD2DF5D120076E836BD96FDB0EBD034DD100DA490B958FA4908AB51FE1011FA01D45BE77B90A6643FF07E02E9E3E6FD23E86609A129F193C2CDFB30F78F1182B759B8A0ECDF9EACD1A6E6E1B7E88AACB728B944B4D760BC8F91FB35CAF025F22E889BFA19BB2520FDF9E087E600A3A873EEBAC4F1BF226486DE2C22F7E9AE9B4D3B1CDDA376ED90CC02E0876A8F44D84DBF944D6BAF44DD42F24C34CD54DE499BAA1FA3958FCC542D9BEA552D5A74AACA9AF55595829969CA5AEA15CD1B74EA59B41ACDDFCB67687C872F87DD7F8F6FD8E1BDF928C7AEDCC57CFAA8D0CD873EA8A45F40908D2D6AADD5906F02E3AF861C76FF5743AE2679FCE47BD42B31B806958D09BC517BF50DAB7BCD099A6D7B3970C3DCB6F0EDEC01BAE5729EA691EBE7AB40110063E10B5E7FE2C359DDB18C6234623C840C8C10DDA7471E7942C6668BA4BA43173080185AE76EF1096006521778B219C980BC1E8A9527AA42B13A2EC22BF7AD2493301D26B413A097A094AC541F617959F8C8F56310745A49E8697884D1B15732C437173086880AECB48489707518842A50C91126A5CB4253A7C1B876226ABC56DD9C77B9B0F5BC4BD189AD70B2C377D6F092F96F1B2166BBC5B640CE76939828A00DE9ED82A0ECAE624A00F1E2B26F04156E4C1A8232976A2B04E52DB60382F2267975042DAEA8A6F32FDC57F78D9EFC4579FBC77AABB976C04DCE1E7B46CDC2F7CC63F83EB92BCBF4BC58D097F059955941F464F7B394B9BA224528F81C623E5B21B5ADDAE565D4A8D2379C760816CB91FAF3AE6C0788C8C336C09AAB1DA0EC7BA20424ADC91ECA95E1C056ED9823D203B60CDDB5C2B2E343806DD048C66E7E576D34D47F7D15F96D7481A94656B1415A2746F78D068E8210E2FEC70FDCC028BAD0AE6C181377BA8F43DD18189B8C16037538BF1A23958319DD4A2535BBADA4F2E9FA787583AC2478601A2B958319DD4A8CA3DD4652F8153D3C8B4126E2BD8091165B192CA90EACEADDD429722AD983A9A349BE9CDE8038F6D1AA918CC99E58739689F9DDBC7F7E625860386EAA4853ACB4AD24E128012B28BCA507A407AFFC24C517008305A0A1A299174ACD94C7B366FB2F450A27B03C8FE5515076A0FFE63AA9F326150E0D43B822430CA9579487E21B04D0F6B468622C0840A2CF729C454116A28EBCC936ACE2636013A678628E50E5263641AA87E63845EE213720C5878936049658D884608FCC31F2B4C12642FEC0BC3FCB6E6822B04732C6D411A821F9B7120DA55B084F6B23D2EB36C1BE8CE77CCCFEB46FEFAEB3AF48FA4DB17D4773231F06E3CD53E5BAAF3F577A089DC5CBBB5BD3E6BAFB9C1EA50CEF36517421DF9DCD9DCE87EF3B5FE20DA9FF7475226C6675F5D9FB5A311AC9411258E39D392A9FBFD5C4E4DFF4386BF8242DEECCE15FF5D0B2998AC529D97CB1169EC6A2EA16E612E4E4AB26BAFCD61C599186D58456BC5E035BA1B3F8AE871F24676A711E91FCDA1CBB4EDB12F7D13D3EBFB4F7F621075811DD197682693036B3298E730036F260380FB97EDC138B65BA4860ECF95E124A1BE21842A822AE378C501A0CFDFEC32591F0DB4F6BE68B1E93CB0CE1B6F8B6CC183D5E3FDA6E941C5290436C5249AF821D425063CA020C2665A742C4A168625BA519C9F1FE9262184E6883C9FCD76016F8906EE6650342357F09535C6443D9C78747C742D9EAFE94903A69EA058A008DA28E949FAEADD771FAD4C49D398C032AB3D01348DC4790FC3304CFFF6A22AD519E3908AB59823908882BB31C84D428A51C84C3557EF4405AAF24720DC60ECBC22D4724E7C48DC04BC5E7C66BE4C1E733FBF7BCD7691E76A6FFCA1F1F58D7E967E4FF9A91170FC4A0D61F728EFF381554EDA1813DAD7733B7EAF57FBE145D0FACBB846CEFA7D6A160CB756698AF82EBA54DD17580366BD7C6BDDE05A5DC78DA16C4FA15660B1F8F525D366CEB5755900D425454898D85378A09755560EB60692BC03CF213E71560FD06ABAE085B47356D3558EE1F0DAC0533DF86CA9E3B3C6A1477F86D6C491BF143F7EB6C924A6E86B9B35259CD261D3FCD65FC6F597532DAE9A8282A190D7B97D4DE7825C9BE148FD43979BBAD19D9669948CBC7CCBF5575C81EE4332B922B775F03B26DAEE9BE3BEC79227DBF4A8F3D231B4BB9DD7D3DC7B6C9A6FB26B1E764EB55B5B1675CDBD5F9B963A6191FA13BAFC1907341C569551657B4D55614DF76C8BD7E1191A92FFCC8BA26C3B080A0E08624847FAD925494DEAB337E75C26A326A05D64DF442F5A9C6A26069614A72A516ED62FB8D953914AD83656DDAC56A12F4DB64B3F3A555366BD32E5B93F6BE8BD21165E2B9AA9CA7639F6C4B0D7C4DA522DC483A2A93BA7CE2D66493D75419328A51B8D5A34998783D8520A39864CCA5D3A3F043CE7D206773E30F7313FF20F5573504FD33DD08BADCA95CB5B946CBA8740E048DCA264204E80662E09123FB3CC1FE929CACE4358D61E77F3B248F0BD22F290BE85DA3BB0CC719264386E122E0026AD4C968939F57B7F03A4FEFE2FCCF608D3104A2A64F63FF77E887CC0FBC4AEF2B45CC490341BD171631A6738969E478F55221DD46C8108899AF72BA1E601807042CBD4373F004D7D18DD0EF235C01F7A58E30EA40BA278237FBF4C207AB048429C3A8FB939F84C35EF8FCFE2FD5FDEA929F5E0000 , N'6.1.3-40302')

-- Manually added to seed sample data for demo purposes
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'27426b2f-1b0c-47ed-a257-1d5b6392395d', NULL, 0, N'AD5vkd3hMPm3/SSCcTtYFwyb2ddIl9ICGbDyxRiw/F2sgB/lyfpymO0XbsyX8rszBg==', N'e8f19c69-9113-411b-b7ed-55e735e8bf52', NULL, 0, 0, NULL, 0, 0, N'user2@contoso.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b82e9ed3-bc9d-448c-8d4d-18111fb4717e', NULL, 0, N'AITklkPXgiV769VqHHVGH1sec67qckh6HghyiY51gOm9xEvvAVmW5lHLqj+39r9BzA==', N'eab2d86c-5d54-44a7-a2a4-16631912820b', NULL, 0, 0, NULL, 0, 0, N'user1@contoso.com')

INSERT INTO Contacts 
	(Name, Address, City, State, Zip, Email) 
VALUES
	('Debra Garcia', '1234 Main St', 'Redmond', 'WA', '10999', 'debra@example.com'),
	('Thorsten Weinrich', '5678 1st Ave W', 'Redmond', 'WA', '10999', 'thorsten@example.com'),
	('Yuhong Li', '9012 State st', 'Redmond', 'WA', '10999', 'yuhong@example.com'),
	('Jon Orton', '3456 Maple St', 'Redmond', 'WA', '10999', 'jon@example.com'),
	('Diliana Alexieva-Bosseva', '7890 2nd Ave E', 'Redmond', 'WA', '10999', 'diliana@example.com')
go