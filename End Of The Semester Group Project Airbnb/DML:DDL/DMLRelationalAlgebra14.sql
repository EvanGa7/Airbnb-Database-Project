/* Relational Algebra 14 */
Select AVG (Number_Of_Reviews) As NumberOfReviewsForSanDiegoCalifornia
From Reviews
Inner Join [Listing]
On Reviews.Listing_ID = [Listing].Listing_ID
Inner Join [Listing Country]
On Listing.Listing_ID = [Listing Country].Listing_ID
Inner Join [Listing Area]
On [Listing Country].Listing_ID = [Listing Area].Listing_ID
Inner Join [Listing Location]
On [Listing Area].Listing_ID = [Listing Location].Listing_ID
Group By Country, Area, Location
Having Country = 'United States'
AND Location = 'California' 
AND Area = 'San Diego'
