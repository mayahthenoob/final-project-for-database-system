
-- Insert Tours
INSERT INTO Tours (TourID, TourName, ApproxLength, Fee) VALUES
(1, 'Grand Etang & Waterfalls', 4.50, 85.00),
(2, 'Spice Plantation Tour', 3.00, 65.00),
(3, 'Island Highlights', 6.00, 120.00),
(4, 'Coastal Adventure', 5.00, 95.00),
(5, 'Historical St. George''s', 2.50, 55.00),
(6, 'Rainforest Expedition', 7.00, 140.00),
(7, 'Beach Hopper Special', 4.00, 75.00);

-- Insert Locations
INSERT INTO Locations (LocationID, LocationName, LocationType, Address, OfficialDescription) VALUES
(1, 'Grand Etang Lake', 'National Park', 'St. Andrew Parish', 'Stunning crater lake situated in the heart of Grenada''s rainforest at 1,740 feet above sea level'),
(2, 'Annandale Falls', 'Waterfall', 'Constantine, St. George Parish', '30-foot waterfall surrounded by lush tropical gardens and exotic plants'),
(3, 'Gouyave Nutmeg Station', 'Factory', 'Gouyave, St. John Parish', 'Historic nutmeg processing facility showcasing Grenada''s spice heritage since 1947'),
(4, 'Grand Anse Beach', 'Beach', 'St. George Parish', 'Two-mile stretch of pristine white sand beach, voted one of the world''s best beaches'),
(5, 'Belmont Estate', 'Plantation', 'Belmont, St. Patrick Parish', '17th century working cocoa plantation offering authentic farm-to-table experiences'),
(6, 'Fort George', 'Historical Site', 'Church Street, St. George''s', 'Historic fort built by French in 1705, offering panoramic views of St. George''s harbor'),
(7, 'Concord Falls', 'Waterfall', 'Concord, St. John Parish', 'Three-tiered waterfall system with the first falls easily accessible'),
(8, 'River Antoine Rum Distillery', 'Distillery', 'River Antoine, St. Patrick Parish', 'Oldest functioning water-propelled distillery in the Caribbean, operating since 1785'),
(9, 'Levera Beach', 'Beach', 'Levera, St. Patrick Parish', 'Unspoiled beach within national park, important nesting site for leatherback turtles'),
(10, 'Carenage', 'Harbor', 'St. George''s', 'Picturesque horseshoe-shaped harbor with colorful buildings and fishing boats'),
(11, 'Seven Sisters Falls', 'Waterfall', 'Grand Etang Forest Reserve', 'Series of seven cascading waterfalls requiring moderate hiking through rainforest'),
(12, 'Underwater Sculpture Park', 'Marine Park', 'Molinere Bay, St. George Parish', 'World''s first underwater sculpture park featuring works by Jason deCaires Taylor'),
(13, 'La Sagesse Beach', 'Beach', 'La Sagesse, St. David Parish', 'Secluded crescent-shaped beach with calm waters and nature sanctuary'),
(14, 'Dougaldston Spice Estate', 'Plantation', 'Gouyave, St. John Parish', 'Organic spice estate growing nutmeg, cinnamon, cocoa, and various tropical spices'),
(15, 'Market Square', 'Market', 'Granby Street, St. George''s', 'Bustling local market featuring fresh produce, spices, and handcrafted goods');

-- Insert Guides
INSERT INTO Guides (EmployeeID, GuideName, HomeAddress, DateOfHire) VALUES
(101, 'Marcus Baptiste', '15 Church Street, St. George''s', '2020-03-15'),
(102, 'Lisa Thomas', '42 Main Road, Gouyave', '2019-07-22'),
(103, 'David Joseph', '8 Hill View Drive, Sauteurs', '2021-01-10'),
(104, 'Jennifer Mitchell', '27 Grand Anse Road, St. George''s', '2018-05-18'),
(105, 'Kevin Williams', '53 Victoria Street, St. George''s', '2020-11-03'),
(106, 'Samantha Peters', '19 River Road, St. Patrick Parish', '2019-09-14'),
(107, 'Andre Charles', '34 Market Hill, St. George''s', '2021-06-20'),
(108, 'Michelle George', '61 Hillsborough Street, Carriacou', '2022-02-08');

-- Insert Clients
INSERT INTO Clients (ClientID, ClientName, Phone, Email) VALUES
(1001, 'Sarah Johnson', '+1-473-555-0123', 'sarah.johnson@email.com'),
(1002, 'Michael Chen', '+1-473-555-0124', 'm.chen@email.com'),
(1003, 'Emma Williams', '+1-473-555-0125', 'emma.williams@email.com'),
(1004, 'James Rodriguez', '+1-473-555-0126', 'j.rodriguez@email.com'),
(1005, 'Olivia Brown', '+1-473-555-0127', 'olivia.b@email.com'),
(1006, 'Robert Taylor', '+1-473-555-0128', 'rob.taylor@email.com'),
(1007, 'Sophia Anderson', '+1-473-555-0129', 'sophia.a@email.com'),
(1008, 'William Martinez', '+1-473-555-0130', 'w.martinez@email.com'),
(1009, 'Isabella Garcia', '+1-473-555-0131', 'isabella.garcia@email.com'),
(1010, 'Daniel Wilson', '+1-473-555-0132', 'dan.wilson@email.com'),
(1011, 'Ava Thompson', '+1-473-555-0133', 'ava.thompson@email.com'),
(1012, 'Matthew White', '+1-473-555-0134', 'matt.white@email.com'),
(1013, 'Mia Harris', '+1-473-555-0135', 'mia.harris@email.com'),
(1014, 'Christopher Lee', '+1-473-555-0136', 'chris.lee@email.com'),
(1015, 'Charlotte King', '+1-473-555-0137', 'charlotte.king@email.com'),
(1016, 'Andrew Scott', '+1-473-555-0138', 'andrew.scott@email.com'),
(1017, 'Amelia Green', '+1-473-555-0139', 'amelia.green@email.com'),
(1018, 'Joshua Adams', '+1-473-555-0140', 'joshua.adams@email.com'),
(1019, 'Emily Baker', '+1-473-555-0141', 'emily.baker@email.com'),
(1020, 'Ryan Nelson', '+1-473-555-0142', 'ryan.nelson@email.com');

-- Insert TourLocations (Tours must visit at least 3 locations)
INSERT INTO TourLocations (TourID, LocationID, VisitOrder) VALUES
-- Tour 1: Grand Etang & Waterfalls
(1, 1, 1),  -- Grand Etang Lake
(1, 2, 2),  -- Annandale Falls
(1, 7, 3),  -- Concord Falls
(1, 3, 4),  -- Gouyave Nutmeg Station

-- Tour 2: Spice Plantation Tour
(2, 5, 1),  -- Belmont Estate
(2, 14, 2), -- Dougaldston Spice Estate
(2, 3, 3),  -- Gouyave Nutmeg Station
(2, 15, 4), -- Market Square

-- Tour 3: Island Highlights
(3, 6, 1),  -- Fort George
(3, 10, 2), -- Carenage
(3, 4, 3),  -- Grand Anse Beach
(3, 1, 4),  -- Grand Etang Lake
(3, 2, 5),  -- Annandale Falls

-- Tour 4: Coastal Adventure
(4, 4, 1),  -- Grand Anse Beach
(4, 12, 2), -- Underwater Sculpture Park
(4, 13, 3), -- La Sagesse Beach
(4, 9, 4),  -- Levera Beach

-- Tour 5: Historical St. George's
(5, 6, 1),  -- Fort George
(5, 10, 2), -- Carenage
(5, 15, 3), -- Market Square

-- Tour 6: Rainforest Expedition
(6, 1, 1),  -- Grand Etang Lake
(6, 11, 2), -- Seven Sisters Falls
(6, 7, 3),  -- Concord Falls
(6, 8, 4),  -- River Antoine Rum Distillery

-- Tour 7: Beach Hopper Special
(7, 4, 1),  -- Grand Anse Beach
(7, 13, 2), -- La Sagesse Beach
(7, 9, 3);  -- Levera Beach

-- Insert Certifications
INSERT INTO Certifications (EmployeeID, LocationID, CertificationDate, ExpiryDate) VALUES
-- Marcus Baptiste (101) - Certified for all main attractions
(101, 1, '2020-04-01', '2023-04-01'),
(101, 2, '2020-04-01', '2023-04-01'),
(101, 3, '2020-05-15', '2023-05-15'),
(101, 4, '2020-04-01', '2023-04-01'),
(101, 7, '2020-06-10', '2023-06-10'),
(101, 10, '2020-04-01', '2023-04-01'),

-- Lisa Thomas (102) - Spice and plantation specialist
(102, 3, '2019-08-01', '2022-08-01'),
(102, 5, '2019-08-01', '2022-08-01'),
(102, 8, '2019-09-15', '2022-09-15'),
(102, 14, '2019-08-01', '2022-08-01'),
(102, 15, '2019-08-01', '2022-08-01'),
(102, 1, '2020-01-10', '2023-01-10'),
(102, 2, '2020-01-10', '2023-01-10'),

-- David Joseph (103) - Northern region specialist
(103, 1, '2021-02-15', '2024-02-15'),
(103, 7, '2021-02-15', '2024-02-15'),
(103, 9, '2021-03-20', '2024-03-20'),
(103, 11, '2021-04-10', '2024-04-10'),
(103, 8, '2021-02-15', '2024-02-15'),

-- Jennifer Mitchell (104) - Most experienced, certified for everything
(104, 1, '2018-06-01', '2021-06-01'),
(104, 2, '2018-06-01', '2021-06-01'),
(104, 3, '2018-06-01', '2021-06-01'),
(104, 4, '2018-06-01', '2021-06-01'),
(104, 5, '2018-07-15', '2021-07-15'),
(104, 6, '2018-06-01', '2021-06-01'),
(104, 7, '2018-06-01', '2021-06-01'),
(104, 10, '2018-06-01', '2021-06-01'),
(104, 12, '2019-03-10', '2022-03-10'),
(104, 13, '2018-08-20', '2021-08-20'),
(104, 15, '2018-06-01', '2021-06-01'),

-- Kevin Williams (105) - Historical and beach specialist
(105, 4, '2020-12-01', '2023-12-01'),
(105, 6, '2020-12-01', '2023-12-01'),
(105, 9, '2021-01-15', '2024-01-15'),
(105, 10, '2020-12-01', '2023-12-01'),
(105, 12, '2020-12-01', '2023-12-01'),
(105, 13, '2021-02-10', '2024-02-10'),
(105, 15, '2020-12-01', '2023-12-01'),

-- Samantha Peters (106) - Eco-tourism specialist
(106, 1, '2019-10-01', '2022-10-01'),
(106, 5, '2019-10-01', '2022-10-01'),
(106, 7, '2019-10-01', '2022-10-01'),
(106, 11, '2019-11-15', '2022-11-15'),
(106, 8, '2019-10-01', '2022-10-01'),
(106, 9, '2020-02-20', '2023-02-20'),

-- Andre Charles (107) - City and culture specialist
(107, 6, '2021-07-15', '2024-07-15'),
(107, 10, '2021-07-15', '2024-07-15'),
(107, 15, '2021-07-15', '2024-07-15'),
(107, 3, '2021-08-20', '2024-08-20'),
(107, 14, '2021-08-20', '2024-08-20'),

-- Michelle George (108) - New guide, limited certifications
(108, 4, '2022-03-01', '2025-03-01'),
(108, 6, '2022-03-01', '2025-03-01'),
(108, 10, '2022-03-01', '2025-03-01');

-- Insert Outings (Past and Future)
INSERT INTO Outings (OutingID, TourID, EmployeeID, OutingDate, OutingTime) VALUES
-- Past outings (for reviews and performance data)
(1, 1, 101, '2024-10-15', '09:00:00'),
(2, 2, 102, '2024-10-16', '10:00:00'),
(3, 3, 104, '2024-10-17', '08:30:00'),
(4, 1, 101, '2024-10-20', '09:00:00'),
(5, 4, 105, '2024-10-22', '10:30:00'),
(6, 5, 107, '2024-10-23', '14:00:00'),
(7, 2, 102, '2024-10-25', '10:00:00'),
(8, 6, 106, '2024-10-27', '08:00:00'),
(9, 3, 104, '2024-10-28', '08:30:00'),
(10, 7, 105, '2024-10-30', '11:00:00'),
(11, 1, 101, '2024-11-01', '09:00:00'),
(12, 4, 105, '2024-11-03', '10:30:00'),
(13, 2, 102, '2024-11-05', '10:00:00'),
(14, 5, 107, '2024-11-06', '14:00:00'),
(15, 3, 104, '2024-11-08', '08:30:00'),
(16, 6, 103, '2024-11-10', '08:00:00'),
(17, 1, 101, '2024-11-12', '09:00:00'),
(18, 7, 105, '2024-11-14', '11:00:00'),
(19, 2, 102, '2024-11-16', '10:00:00'),
(20, 4, 105, '2024-11-18', '10:30:00'),

-- Future outings (scheduled)
(21, 1, 101, '2024-12-02', '09:00:00'),
(22, 2, 102, '2024-12-03', '10:00:00'),
(23, 3, 104, '2024-12-04', '08:30:00'),
(24, 4, 105, '2024-12-05', '10:30:00'),
(25, 5, 107, '2024-12-06', '14:00:00'),
(26, 6, 106, '2024-12-07', '08:00:00'),
(27, 7, 105, '2024-12-08', '11:00:00'),
(28, 1, 101, '2024-12-10', '09:00:00'),
(29, 2, 102, '2024-12-11', '10:00:00'),
(30, 3, 104, '2024-12-12', '08:30:00');

-- Insert OutingClients (bookings and reviews for past outings)
INSERT INTO OutingClients (OutingID, ClientID, Rating, Review) VALUES
-- Outing 1
(1, 1001, 5, 'Absolutely amazing tour! Marcus was so knowledgeable about the rainforest and the waterfalls were breathtaking.'),
(1, 1002, 5, 'Best tour experience in Grenada. Highly recommend!'),
(1, 1003, 4, 'Great tour, very informative. Would have loved more time at Concord Falls.'),

-- Outing 2
(2, 1004, 5, 'Lisa''s knowledge of spices and plantation history was incredible. Learned so much!'),
(2, 1005, 5, 'Fascinating insight into Grenada''s spice industry. The nutmeg processing was amazing to watch.'),
(2, 1006, 4, 'Very educational tour. The Belmont Estate lunch was delicious.'),
(2, 1007, 5, 'Loved every minute of this tour. Lisa is an excellent guide!'),

-- Outing 3
(3, 1008, 5, 'Jennifer gave us the perfect overview of the island. Saw so many beautiful places!'),
(3, 1009, 5, 'Excellent tour covering all the highlights. Fort George views were spectacular.'),
(3, 1010, 5, 'Can''t recommend this tour enough. Jennifer was professional and entertaining.'),
(3, 1011, 4, 'Great introduction to Grenada. Packed a lot into one day.'),

-- Outing 4
(4, 1001, 4, 'Another great tour with Marcus. The waterfalls never disappoint!'),
(4, 1012, 5, 'Beautiful scenery and excellent guide. Perfect day trip.'),

-- Outing 5
(5, 1013, 5, 'Kevin made the coastal tour amazing! The underwater sculpture park was unique.'),
(5, 1014, 5, 'Perfect beach hopping experience. All three beaches were stunning.'),
(5, 1015, 4, 'Really enjoyed the snorkeling at the sculpture park. Great tour!'),

-- Outing 6
(6, 1016, 5, 'Andre''s historical knowledge brought St. George''s to life. Fascinating stories!'),
(6, 1017, 4, 'Nice compact tour of the capital. Fort George is a must-see.'),

-- Outing 7
(7, 1018, 5, 'Lisa is definitely the spice expert! Loved tasting all the fresh spices.'),
(7, 1019, 5, 'Educational and delicious! The organic spice estate was beautiful.'),
(7, 1020, 4, 'Great tour for foodies. Learned the difference between so many spices.'),

-- Outing 8
(8, 1001, 5, 'Samantha''s rainforest expedition was challenging but so rewarding. Seven Sisters Falls is worth the hike!'),
(8, 1002, 5, 'Best adventure tour! The rum distillery visit was the perfect ending.'),
(8, 1003, 4, 'Intense hike but amazing waterfalls. Samantha kept great pace.'),

-- Outing 9
(9, 1004, 5, 'Second tour with Jennifer - she never disappoints!'),
(9, 1005, 5, 'Comprehensive tour with excellent timing. Saw everything we wanted.'),

-- Outing 10
(10, 1006, 4, 'Kevin knows all the best beach spots. La Sagesse was our favorite.'),
(10, 1007, 5, 'Perfect relaxing beach tour. Kevin was friendly and accommodating.'),

-- Outing 11
(11, 1008, 5, 'Marcus is simply the best guide. Third tour with him!'),
(11, 1009, 5, 'Consistently excellent tours. The waterfalls were even more beautiful this time.'),

-- Outing 12
(12, 1010, 5, 'Kevin''s beach tour exceeded expectations. The snorkeling was incredible!'),
(12, 1011, 4, 'Great day at the beach. Good variety of locations.'),

-- Outing 13
(13, 1012, 5, 'Lisa''s passion for Grenadian culture and spices is contagious!'),
(13, 1013, 5, 'Wonderful tour! Market Square was bustling and colorful.'),

-- Outing 14
(14, 1014, 4, 'Andre is very professional. Enjoyed the historical insights.'),
(14, 1015, 5, 'Short but sweet tour of St. George''s. Perfect for cruise passengers.'),

-- Outing 15
(15, 1016, 5, 'Jennifer continues to be outstanding. Island highlights tour is the best!'),
(15, 1017, 5, 'Saw so much in one day. Jennifer made it seamless and fun.'),

-- Outing 16
(16, 1018, 4, 'David did great job leading this challenging expedition. Very knowledgeable about the forest.'),
(16, 1019, 5, 'Amazing adventure! The Seven Sisters Falls trek was unforgettable.'),

-- Outing 17
(17, 1020, 5, 'Marcus never fails to deliver an exceptional experience!'),
(17, 1001, 5, 'Fourth tour - still discovering new things about these locations!'),

-- Outing 18
(18, 1002, 4, 'Kevin''s beach tour is perfect for families. Kids loved it!'),
(18, 1003, 5, 'Relaxing and beautiful. Kevin found the quietest spots.'),

-- Outing 19
(19, 1004, 5, 'Lisa is a treasure trove of knowledge. Best spice tour on the island!'),
(19, 1005, 5, 'Highly educational and entertaining. The nutmeg station was fascinating.'),

-- Outing 20
(20, 1006, 5, 'Another fantastic coastal tour with Kevin. The sculpture park is a must-see!'),
(20, 1007, 4, 'Great variety of beaches. Kevin was very informative.'),

-- Future bookings (no reviews yet)
(21, 1008, NULL, NULL),
(21, 1009, NULL, NULL),
(21, 1010, NULL, NULL),

(22, 1011, NULL, NULL),
(22, 1012, NULL, NULL),

(23, 1013, NULL, NULL),
(23, 1014, NULL, NULL),
(23, 1015, NULL, NULL),
(23, 1016, NULL, NULL),

(24, 1017, NULL, NULL),
(24, 1018, NULL, NULL),

(25, 1019, NULL, NULL),
(25, 1020, NULL, NULL),

(26, 1001, NULL, NULL),
(26, 1002, NULL, NULL),

(27, 1003, NULL, NULL),
(27, 1004, NULL, NULL),
(27, 1005, NULL, NULL),

(28, 1006, NULL, NULL),
(28, 1007, NULL, NULL),

(29, 1008, NULL, NULL),
(29, 1009, NULL, NULL),

(30, 1010, NULL, NULL),
(30, 1011, NULL, NULL),
(30, 1012, NULL, NULL);

