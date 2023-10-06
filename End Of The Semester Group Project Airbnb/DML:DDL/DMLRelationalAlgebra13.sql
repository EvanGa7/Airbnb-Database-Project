/* Relational Algebra 13 */
Select Distinct Listing.Listing_ID, Listing_Name, Room_Type, Minimum_Nights_Required, Country, Location, Area
From [Listing], [Listing Country], [Listing Location], [Listing Area]
Where Location = 'District of Columbia'
AND Area = 'Washington, D.C.'
AND Minimum_Nights_Required >= '30'
AND [Listing].Listing_ID = [Listing Country].Listing_ID
AND [Listing Country].Listing_ID = [Listing Location].Listing_ID
AND [Listing Location].Listing_ID = [Listing Area].Listing_ID
