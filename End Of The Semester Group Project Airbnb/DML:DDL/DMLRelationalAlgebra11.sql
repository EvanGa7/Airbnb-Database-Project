/* Relational Algebra 11 */
Select Distinct Listing.Listing_ID, Listing_Name, Country, Host_ID, Host_Name
From [Listing], [Listing Country], Host 
Where Country = 'United States'
AND [Listing].Listing_ID = Host.Listing_ID
AND Host.Listing_ID = [Listing Country].Listing_ID