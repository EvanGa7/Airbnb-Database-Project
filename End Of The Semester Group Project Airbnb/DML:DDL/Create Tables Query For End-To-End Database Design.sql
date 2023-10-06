Create Table [Listing] (
	Listing_ID int NOT NULL,
	Listing_Name varchar(MAX),
	Listing_License_Number varchar(MAX),
	Room_Type varchar(15),
	Availability_Per_Year int,
	Minimum_Nights_Required int,
	Price_Per_Night int,

)

Create Table [Listing Country] (
	Listing_ID int,
	Country char(14),

)

Create Table [Listing Location] (
	Listing_ID int, 
	Location varchar(50),

)

Create Table [Listing Area] (
	Listing_ID int,
	Area varchar(20),

)

Create Table [Listing Neighborhood] (
	Listing_ID int,
	Neighborhood varchar(100),
	Latitude decimal(9,6),
	Longitude decimal(8,6),

)


Create Table [Host] (
	Host_ID int,
	Listing_ID int, 
	Host_Name char(50),
	Number_Of_Listings_Per_Host int,

)

Create Table [Reviews] (
	Listing_ID int,
	Number_Of_Reviews int,
	Last_Review varchar(10),
	Number_Of_Reviews_Per_Month int,
	Number_Of_Reviews_Last_Twelve_Months int,

);