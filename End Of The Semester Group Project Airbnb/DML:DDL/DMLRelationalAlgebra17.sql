/* Relational Algebra 17 */
Select Distinct Listing.Listing_ID, Listing_Name, Room_Type, Availability_Per_Year, Price_Per_Night, Country, Location, Area
From [Listing], [Listing Country], [Listing Location], [Listing Area], Reviews
Where Country = 'Italy'
AND Price_Per_Night = '150'
AND Availability_Per_Year > '50'
AND [Listing].Listing_ID = [Listing Country].Listing_ID
AND [Listing Country].Listing_ID = [Listing Location].Listing_ID
AND [Listing Location].Listing_ID = [Listing Area].Listing_ID