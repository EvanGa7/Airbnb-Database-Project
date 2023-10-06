Insert Into Listing (Listing_ID, Listing_Name, Listing_License_Number, Room_Type, Availability_Per_Year, Minimum_Nights_Required, Price_Per_Night)
Select Listing_ID, Listing_Name, Listing_Licence_Number, Room_Type, Availability_Per_Year, Minimum_Nights_Required, Price_Per_Night
From ListingsDataCombined;

Insert Into Host
Select Host_ID, Listing_ID, Host_Name, Number_Of_Listings_Per_Host
From ListingsDataCombined;

Insert Into [Listing Area]
Select Listing_ID, Area
From ListingsDataCombined;

Insert Into [Listing Country]
Select Listing_ID, Country
From ListingsDataCombined;

Insert Into [Listing Location]
Select Listing_ID, Location
From ListingsDataCombined;

Insert Into [Listing Neighborhood]
Select Listing_ID, Neighborhood, Latitude, Longitude
From ListingsDataCombined;

Insert Into [Reviews]
Select Listing_ID, Number_Of_Reviews, Last_Review, Number_Of_Reviews_Per_Month, Number_Of_Reviews_Last_Twelve_Months, Number_Of_Listings_Per_Host
From ListingsDataCombined;