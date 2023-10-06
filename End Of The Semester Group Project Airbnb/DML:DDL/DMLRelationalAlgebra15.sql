/* Relational Algebra 15 */
Select AVG(Number_Of_Listings_Per_Host) As AvgListingsPerUSPerson
From Reviews
Inner Join [Listing]
On Reviews.Listing_ID = [Listing].Listing_ID
Inner Join [Listing Country]
On Listing.Listing_ID = [Listing Country].Listing_ID
Inner Join [Listing Area]
On [Listing Country].Listing_ID = [Listing Area].Listing_ID
Inner Join [Listing Location]
On [Listing Area].Listing_ID = [Listing Location].Listing_ID
Inner Join [Host]
On [Listing Area].Listing_ID = [Host].Listing_ID
Group By Host_ID, Host_Name, Country, Location, Area
Having Country = 'United States'