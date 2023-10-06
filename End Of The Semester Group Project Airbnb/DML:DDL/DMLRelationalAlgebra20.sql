/* Relational Algebra 20 */

Select Max(Number_Of_Reviews_Last_Twelve_Months) HighestNumberOfReviewsPast12Months, Country
From Reviews
Inner Join [Listing]
On Reviews.Listing_ID = [Listing].Listing_ID
Inner Join [Listing Country]
On Listing.Listing_ID = [Listing Country].Listing_ID
Inner Join [Listing Area]
On [Listing Country].Listing_ID = [Listing Area].Listing_ID
Inner Join [Listing Location]
On [Listing Area].Listing_ID = [Listing Location].Listing_ID
Inner Join [Listing Neighborhood]
On [Listing Location].Listing_ID = [Listing Neighborhood].Listing_ID
Where [Listing].Listing_ID = Reviews.Listing_ID
Group By Country