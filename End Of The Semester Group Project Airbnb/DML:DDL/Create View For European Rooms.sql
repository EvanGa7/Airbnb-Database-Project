Create View EuropeanRooms As
Select Listing.Listing_ID, Listing_License_Number, Room_Type, Availability_Per_Year, Minimum_Nights_Required, Price_Per_Night, Country
From Listing, [Listing Country]
Where Country In ('Austria', 'Belgium', 'Czech Republic', 'Denmark', 'France', 'Germany', 'Greece', 'Ireland', 'Latvia', 'Mexico', 'Netherlands', 'Norway', 'Portugal', 'Spain', 'Sweden', 'Switzerland', 'United Kingdom')
