Insert Into Host (Listing_ID, Host_ID, Host_Name, Number_Of_Listings_Per_Host)
Select Listing_ID, Host_ID, Host_Name, Number_Of_Listings_Per_Host 
From ListingsDataCombined

Insert Into Listing (Listing_ID, Listing_Name, Listing_License_Number, Room_Type, Availability_Per_Year, Minimum_Nights_Required, Price_Per_Night)
Select Listing_ID, Listing_Name, Listing_Licence_Number, Room_Type, Availability_Per_Year, Minimum_Nights_Required, Price_Per_Night
From ListingsDataCombined

Insert Into [Listing Area] (Listing_ID, Area)
Select Listing_ID, Area
From ListingsDataCombined

Insert Into [Listing Country] (Listing_ID, Country)
Select Listing_ID, Country
From ListingsDataCombined

Insert Into [Listing Location] (Listing_ID, Location)
Select Listing_ID, Location
From ListingsDataCombined

Insert Into [Listing Neighborhood] (Listing_ID, Neighborhood, Latitude, Longitude)
Select Listing_ID, Neighborhood, Latitude, Longitude
From ListingsDataCombined

Insert Into [Reviews] (Listing_ID, Number_Of_Reviews, Last_Review, Number_Of_Reviews_Per_Month, Number_Of_Reviews_Last_Twelve_Months)
Select Listing_ID, Number_Of_Reviews, Last_Review, Number_Of_Reviews_Per_Month, Number_Of_Reviews_Last_Twelve_Months
From ListingsDataCombined