BEGIN TRANSACTION PriceInsert
BEGIN TRY

	   INSERT INTO [Listing Country](Listing_ID, Country)
	   Values ('1037022', 'Saudi Arabia')

END TRY

BEGIN CATCH

		INSERT INTO [Listing Area](Listing_ID, Area)
		Values ('1037022', 'Riyadh')

	ROLLBACK TRANSACTION PriceInsert
		
		INSERT INTO [Listing Country](Listing_ID, Country)
	   Values ('1037022', 'Saudi Arabia')
	   INSERT INTO [Listing Area](Listing_ID, Area)
		Values ('1037022', 'Riyadh')


	COMMIT TRANSACTION PriceInsert
END CATCH