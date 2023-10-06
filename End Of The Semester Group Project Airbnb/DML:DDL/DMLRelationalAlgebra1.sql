/* Relational Algebra 1 */
Select Distinct [Listing].Listing_ID, Listing_Name, Room_Type, Minimum_Nights_Required, Price_Per_Night, Country, Location, Area 
From [Listing], [Listing Country], [Listing Location], [Listing Area]
Where Location = 'New Jersey'
AND Area = 'Jersey City'
AND Minimum_Nights_Required >= 30
AND Listing.Listing_ID = [Listing Country].Listing_ID
AND [Listing Country].Listing_ID = [Listing Location].Listing_ID 
AND [Listing Location].Listing_ID = [Listing Area]. Listing_ID
ORDER BY Minimum_Nights_Required