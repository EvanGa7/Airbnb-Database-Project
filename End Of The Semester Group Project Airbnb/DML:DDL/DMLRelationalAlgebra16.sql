/* Relational Algebra 16 */
Select COUNT(Listing.Listing_ID) AS NumberOfStaysInUSEntireHomes, Room_Type, Country
From [Listing]
Inner Join [Listing Country]
On Listing.Listing_ID = [Listing Country].Listing_ID
Inner Join [Listing Area]
On [Listing Country].Listing_ID = [Listing Area].Listing_ID
Inner Join [Listing Location]
On [Listing Area].Listing_ID = [Listing Location].Listing_ID
Inner Join [Listing Neighborhood]
On [Listing Location].Listing_ID = [Listing Neighborhood].Listing_ID
Group By Room_Type, Country
Having Country = 'United States'
AND Room_Type = 'Entire home/apt'