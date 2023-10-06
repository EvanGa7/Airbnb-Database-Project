/* Relational Algebra 5 */
Select [Listing].Listing_ID, Listing_Name, Room_Type, Number_Of_Reviews, Number_Of_Reviews_Per_Month, Country
From [Listing], [Listing Country], Reviews
Where Number_Of_Reviews = 500
AND Number_Of_Reviews_Per_Month >= 5
AND Listing.Listing_ID = [Listing Country].Listing_ID
AND [Listing Country].Listing_ID = Reviews.Listing_ID