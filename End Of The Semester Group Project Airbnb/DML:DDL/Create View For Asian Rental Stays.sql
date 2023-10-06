Create View AsianRentalStays As
Select Listing.Listing_ID, Listing_License_Number, Room_Type, Availability_Per_Year, Minimum_Nights_Required, Price_Per_Night, Country, Number_Of_Reviews
From Listing, [Listing Country], Reviews
Where Country In ('Japan', 'Thailand', 'Singapore', 'Turkey', 'China', 'Taiwan')
AND Listing.Listing_ID = [Listing Country].Listing_ID
AND [Listing Country].Listing_ID = Reviews.Listing_ID