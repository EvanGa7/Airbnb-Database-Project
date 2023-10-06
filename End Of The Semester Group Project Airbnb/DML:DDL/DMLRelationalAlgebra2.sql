/* Relational Algebra 2 */
Select Distinct [Listing].Listing_ID, Listing_Name, Room_Type, Price_Per_Night, Availability_Per_Year, Country, Location, Area 
From [Listing], [Listing Country], [Listing Location], [Listing Area]
Where Location = 'Texas'
AND Area = 'Austin'
AND Availability_Per_Year = 100
AND Listing.Listing_ID = [Listing Country].Listing_ID
AND [Listing Country].Listing_ID = [Listing Location].Listing_ID 
AND [Listing Location].Listing_ID = [Listing Area]. Listing_ID