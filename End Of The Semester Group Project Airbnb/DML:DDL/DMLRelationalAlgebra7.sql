/* Relational Algebra 7 */
Select Listing.Listing_ID, Listing_Name, Room_Type, Price_Per_Night, Listing_License_Number, Country
From [Listing], [Listing Country]
Where Listing_License_Number IS NOT NULL
AND Country = 'Germany'
AND [Listing].Listing_ID = [Listing Country].Listing_ID