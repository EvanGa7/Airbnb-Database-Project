/* Relational Algebra 9 */
Select Distinct Listing.Listing_ID, Listing_Name, Country, Neighborhood, Longitude, Latitude 
From [Listing], [Listing Country], [Listing Location], [Listing Neighborhood]
Where Country = 'Singapore' 
AND Listing_Name LIKE '%Changi'
AND Listing.Listing_ID = [Listing Country].Listing_ID
AND [Listing Country].Listing_ID = [Listing Neighborhood].Listing_ID
