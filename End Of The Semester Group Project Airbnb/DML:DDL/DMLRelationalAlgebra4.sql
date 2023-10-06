/* Relational Algebra 4 */
Select Distinct [Listing].Listing_ID, Listing_Name, Listing_License_Number, Country, Location, Area 
From [Listing], [Listing Country], [Listing Location], [Listing Area]
Where Listing_License_Number IS NOT NULL
AND Country = 'Greece'
AND Listing.Listing_ID = [Listing Country].Listing_ID
AND [Listing Country].Listing_ID = [Listing Location].Listing_ID
AND [Listing Location].Listing_ID = [Listing Area].Listing_ID
Order By Listing_License_Number