package com.sqlsamples;
/**
 * By Corie Beale
 */

import java.sql.Connection;
import java.sql.Statement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

public class App {

    public static void main(String[] args) {

        //Update the username and password below
        String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=AirBNB;user=jdbcABNB;password=abc123"
                + ";trustStore=C:\\Program Files\\Java\\jdk-14.0.2\\lib\\cacert;trustStorePassword=changeit"; // TODO: replace database name and login

        try {
            // Load SQL Server JDBC driver and establish connection.
            System.out.print("Connecting to SQL Server ... ");
            try (Connection connection = DriverManager.getConnection(connectionUrl)) {
                System.out.println("Done.");

                String sql;
                Scanner user = new Scanner(System.in);

                // -----------------------------------------------------------------------------------------------------
                System.out.println("--- Query 1 ---");

                sql = "SELECT Listing.Listing_ID, Listing_Name, Room_Type, Minimum_Nights_Required, Price_Per_Night,\n" +
                            "Country, Location, Area\n" +
                        "FROM Listing, [Listing Country], [Listing Location], [Listing Area]\n" +
                        "WHERE Location  = 'New Jersey' AND Minimum_Nights_Required >= 90 AND\n" +
                            "Listing.Listing_ID = [Listing Country].Listing_ID AND\n" +
                            "[Listing Country].Listing_ID = [Listing Location].Listing_ID AND\n" +
                            "[Listing Location].Listing_ID = [Listing Area].Listing_ID;";
                try (Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery(sql)) {
                    System.out.println("Listings in New Jersey where you must stay at least 90 nights:\n");
                    TimeUnit.SECONDS.sleep(2);
                    while (resultSet.next()) {
                        System.out.println(
                                "Listing ID: " + resultSet.getInt(1) +
                              "\nListing name: " + resultSet.getString(2) +
                              "\nRoom type: " + resultSet.getString(3) +
                              "\nMinimum nights required: " + resultSet.getString(4) +
                              "\nPrice per night: " + resultSet.getString(5) +
                              "\nCountry: " + resultSet.getString(6) +
                              "\nLocation: " + resultSet.getString(7) +
                              "\nArea: " + resultSet.getString(8) +
                                "\n---------------------------------------------------------------------------------");
                    }
                    System.out.println("Loading next query...");
                    TimeUnit.SECONDS.sleep(10);
                }

                // -----------------------------------------------------------------------------------------------------
                System.out.println("--- Query 2 ---");

                sql = "SELECT * FROM (SELECT TOP(3) Listing.Listing_ID, Listing_Name, Room_Type, Minimum_Nights_Required, Price_Per_Night,\n" +
                            "Number_Of_Reviews, Country, Location, Area\n" +
                        "FROM Listing, [Listing Country], [Listing Location], [Listing Area], Reviews\n" +
                        "WHERE Country = 'Canada' AND Number_Of_Reviews > 0 AND\n" +
                            "Listing.Listing_ID = [Listing Country].Listing_ID AND\n" +
                            "[Listing Country].Listing_ID = [Listing Location].Listing_ID AND\n" +
                            "[Listing Location].Listing_ID = [Listing Area].Listing_ID AND\n" +
                            "[Listing Area].Listing_ID = Reviews.Listing_ID\n" +
                        "GROUP BY Listing.Listing_ID, Listing_Name, Room_Type, Minimum_Nights_Required, Price_Per_Night,\n" +
                            "Number_Of_Reviews, Country, Location, Area\n" +
                        "ORDER BY Price_Per_Night DESC, Number_Of_Reviews DESC) x\n" +
                        "UNION\n" +
                        "SELECT * FROM (SELECT TOP(3) Listing.Listing_ID, Listing_Name, Room_Type, Minimum_Nights_Required, Price_Per_Night,\n" +
                            "Number_Of_Reviews, Country, Location, Area\n" +
                        "FROM Listing, [Listing Country], [Listing Location], [Listing Area], Reviews\n" +
                        "WHERE Country = 'Canada' AND Price_Per_Night != 0 AND Number_Of_Reviews > 0 AND\n" +
                            "Listing.Listing_ID = [Listing Country].Listing_ID AND\n" +
                            "[Listing Country].Listing_ID = [Listing Location].Listing_ID AND\n" +
                            "[Listing Location].Listing_ID = [Listing Area].Listing_ID AND\n" +
                            "[Listing Area].Listing_ID = Reviews.Listing_ID\n" +
                        "GROUP BY Listing.Listing_ID, Listing_Name, Room_Type, Minimum_Nights_Required, Price_Per_Night,\n" +
                            "Number_Of_Reviews, Country, Location, Area\n" +
                        "ORDER BY Price_Per_Night ASC, Number_Of_Reviews ASC) y\n" +
                        "ORDER BY Price_Per_Night DESC";

                try (Statement statement = connection.createStatement();
                     ResultSet resultSet = statement.executeQuery(sql)) {
                    System.out.println("Listings in Canada sorted by the top three most expensive and " +
                            "containing the most reviews to the bottom three least expensive with the least reviews:");
                    TimeUnit.SECONDS.sleep(2);
                    while (resultSet.next()) {
                        System.out.println(
                                "Listing ID: " + resultSet.getInt(1) +
                              "\nListing name: " + resultSet.getString(2) +
                              "\nRoom type: " + resultSet.getString(3) +
                              "\nMinimum nights required: " + resultSet.getString(4) +
                              "\nPrice per night: " + resultSet.getString(5) +
                              "\nNumber of reviews: " + resultSet.getString(6) +
                              "\nCountry: " + resultSet.getString(7) +
                              "\nLocation: " + resultSet.getString(8) +
                              "\nArea: " + resultSet.getString(9) +
                              "\n---------------------------------------------------------------------------------");
                    }
                    System.out.println("Loading next query...");
                    TimeUnit.SECONDS.sleep(10);
                }

                // -----------------------------------------------------------------------------------------------------
                System.out.println("--- Query 3 ---");

                sql = "SELECT Host_ID, Host_Name,\n" +
                            "Number_Of_Listings_Per_Host, Country, Location, Area\n" +
                        "FROM Listing, [Listing Country], [Listing Location], [Listing Area], Reviews, Host\n" +
                        "WHERE Listing.Listing_ID = [Listing Country].Listing_ID AND\n" +
                            "[Listing Country].Listing_ID = [Listing Location].Listing_ID AND\n" +
                            "[Listing Location].Listing_ID = [Listing Area].Listing_ID AND\n" +
                            "[Listing Area].Listing_ID = Reviews.Listing_ID AND\n" +
                            "Reviews.Listing_ID = Host.Listing_ID AND\n" +
                            "Host_Name IS NOT NULL AND Number_Of_Listings_Per_Host >= 100\n" +
                        "GROUP BY Host_ID, Host_Name, Number_Of_Listings_Per_Host,\n" +
                            "Country, Location, Area\n" +
                        "ORDER BY Number_Of_Listings_Per_Host DESC";

                try (Statement statement = connection.createStatement();
                     ResultSet resultSet = statement.executeQuery(sql)) {
                    System.out.println("Hosts who have the greatest amount of listings than others and where they create listings:");
                    TimeUnit.SECONDS.sleep(2);
                    while (resultSet.next()) {
                        System.out.println(
                                "Host ID: " + resultSet.getInt(1) +
                              "\nHost name: " + resultSet.getString(2) +
                              "\nNumber of listings per host: " + resultSet.getString(3) +
                              "\nCountry: " + resultSet.getString(4) +
                              "\nLocation: " + resultSet.getString(5) +
                              "\nArea: " + resultSet.getString(6) +
                                "\n---------------------------------------------------------------------------------");

                    }
                    System.out.println("Loading next query...");
                    TimeUnit.SECONDS.sleep(10);
                }

                // -----------------------------------------------------------------------------------------------------
                System.out.println("--- Query 4 ---");

                sql = "SELECT Listing.Listing_ID, Listing_Name, Room_Type, Minimum_Nights_Required, Price_Per_Night,\n" +
                            "Number_Of_Reviews, Last_Review, Country, Location, Area\n" +
                        "FROM Listing, [Listing Country], [Listing Location], [Listing Area], Reviews\n" +
                        "WHERE Last_Review LIKE '%2020%' AND \n" +
                            "Listing.Listing_ID = [Listing Country].Listing_ID AND\n" +
                            "[Listing Country].Listing_ID = [Listing Location].Listing_ID AND\n" +
                            "[Listing Location].Listing_ID = [Listing Area].Listing_ID AND\n" +
                            "[Listing Area].Listing_ID = Reviews.Listing_ID\n" +
                        "GROUP BY Listing.Listing_ID, Listing_Name, Room_Type, Minimum_Nights_Required, Price_Per_Night,\n" +
                            "Number_Of_Reviews, Last_Review, Country, Location, Area\n" +
                        "ORDER BY Number_Of_Reviews DESC;";

                try (Statement statement = connection.createStatement();
                     ResultSet resultSet = statement.executeQuery(sql)) {
                    System.out.println("Listings who's last review was in 2020, ordered by the most to least total reviews:\n");
                    TimeUnit.SECONDS.sleep(2);
                    while (resultSet.next()) {
                        System.out.println(
                                "Listing ID: " + resultSet.getInt(1) +
                              "\nListing name: " + resultSet.getString(2) +
                              "\nRoom type: " + resultSet.getString(3) +
                              "\nMinimum nights required: " + resultSet.getString(4) +
                              "\nPrice per night: " + resultSet.getString(5) +
                              "\nNumber of reviews: " + resultSet.getString(6) +
                              "\nLast review: " + resultSet.getString(7) +
                              "\nCountry: " + resultSet.getString(8) +
                              "\nLocation: " + resultSet.getString(9) +
                              "\nArea: " + resultSet.getString(10) +
                              "\n---------------------------------------------------------------------------------");
                    }
                    System.out.println("Loading next query...");
                    TimeUnit.SECONDS.sleep(10);
                }

                // -----------------------------------------------------------------------------------------------------
                System.out.println("--- Query 5 ---");

                sql = "SELECT Country, COUNT(Listing.Listing_ID) AS 'Number of Listings'\n" +
                        "FROM Listing, [Listing Country]\n" +
                        "WHERE Listing.Listing_ID = [Listing Country].Listing_ID\n" +
                        "GROUP BY Country\n" +
                        "ORDER BY Country";

                try (Statement statement = connection.createStatement();
                     ResultSet resultSet = statement.executeQuery(sql)) {
                    System.out.println("Of the countries included, the following shows the countries with the most listings:\n");
                    TimeUnit.SECONDS.sleep(2);
                    while (resultSet.next()) {
                        System.out.println(
                                "Country: " + resultSet.getString(1) +
                              "\nNumber of listings: " + resultSet.getInt(2));
                    }
                }

                connection.close();
                System.out.println("\nAll done.");
            }
        } catch (Exception e) {
            System.out.println();
            e.printStackTrace();
        }
    }
}