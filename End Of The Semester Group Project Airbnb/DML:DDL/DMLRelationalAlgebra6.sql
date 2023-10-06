/* Relational Algebra 6 */
Select Host_Name, Count(Host_ID) As Number_Of_Hosts, Number_Of_Listings_Per_Host, Area 
From Host
Inner Join [Listing] 
On Host.Listing_ID = Listing.Listing_ID
Inner Join [Listing Country]
On Listing.Listing_ID = [Listing Country].Listing_ID
Inner Join [Listing Area]
On [Listing Country].Listing_ID = [Listing Area].Listing_ID
Inner Join [Listing Location]
On [Listing Area].Listing_ID = [Listing Location].Listing_ID
Inner Join [Listing Neighborhood]
On [Listing Location].Listing_ID = [Listing Neighborhood].Listing_ID
Group By Host_Name, Number_Of_Listings_Per_Host, Area
Having Area = 'New York City'
AND Number_Of_Listings_Per_Host > '5';