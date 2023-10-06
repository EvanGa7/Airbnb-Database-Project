Create View NewJerseyRooms As 
Select Listing.Listing_ID, Room_Type, Availability_Per_Year, Minimum_Nights_Required, Price_Per_Night
From Listing, [Listing Location] 
Where Location = 'New Jersey'
AND Listing.Listing_ID = [Listing Location].Listing_ID