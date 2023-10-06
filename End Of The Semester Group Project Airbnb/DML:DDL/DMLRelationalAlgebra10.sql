/* Relational Algebra 10 */
Select Count(Number_Of_Reviews) As StaysWithLastReviewOnMay52021, Last_Review
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
Group By Last_Review
Having Last_Review = '5/5/2021'
