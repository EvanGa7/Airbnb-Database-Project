/* Relational Algebra 12 */
Select MAX(Number_Of_Reviews) AS HighestNumberOfReviews, Area
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
Group By Number_Of_Reviews, Area