/* Relational Algebra 3 */
Select [Listing].Listing_ID, Listing_Name, Listing_License_Number, Room_Type, Price_Per_Night, Country, Location, Area 
From [Listing], [Listing Country], [Listing Location], [Listing Area]
Where Listing_License_Number IS NULL
AND Listing.Listing_ID = [Listing Country].Listing_ID
AND [Listing Country].Listing_ID = [Listing Location].Listing_ID 
AND [Listing Location].Listing_ID = [Listing Area]. Listing_ID