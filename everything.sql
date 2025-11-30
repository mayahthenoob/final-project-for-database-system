CREATE TABLE Tour (
    TourID INT AUTO_INCREMENT PRIMARY KEY,
    TourName VARCHAR(150) NOT NULL,
    DurationHours TIME NOT NULL,
    Fee DECIMAL(10,2) NOT NULL
);

CREATE TABLE Location (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    LocationName VARCHAR(200) NOT NULL,
    LocationType VARCHAR(100),
    Address VARCHAR(255),
    Description TEXT
);

CREATE TABLE TourLocation (
    TourID INT NOT NULL,
    LocationID INT NOT NULL,
    VisitOrder INT NOT NULL,
    PRIMARY KEY (TourID, LocationID),
    FOREIGN KEY (TourID) REFERENCES Tour(TourID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Guide (
    GuideID INT AUTO_INCREMENT PRIMARY KEY,
    GuideName VARCHAR(150) NOT NULL,
    HomeAddress VARCHAR(255),
    DateHired DATE NOT NULL
);

CREATE TABLE Certification (
    GuideID INT NOT NULL,
    LocationID INT NOT NULL,
    CertificationDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    PRIMARY KEY (GuideID, LocationID, CertificationDate),
    FOREIGN KEY (GuideID) REFERENCES Guide(GuideID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Outing (
    OutingID INT AUTO_INCREMENT PRIMARY KEY,
    TourID INT NOT NULL,
    OutingDate DATE NOT NULL,
    OutingTime TIME NOT NULL,
    GuideID INT NOT NULL,
    FOREIGN KEY (TourID) REFERENCES Tour(TourID),
    FOREIGN KEY (GuideID) REFERENCES Guide(GuideID),
    UNIQUE (GuideID, OutingDate, OutingTime)
);

CREATE TABLE Client (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    ClientName VARCHAR(150) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(150)
);

CREATE TABLE ClientOuting (
    ClientID INT NOT NULL,
    OutingID INT NOT NULL,
    PRIMARY KEY (ClientID, OutingID),
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (OutingID) REFERENCES Outing(OutingID)
);

CREATE TABLE Review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ClientID INT NOT NULL,
    OutingID INT NOT NULL,
    rating INT NOT NULL,
    review_text TEXT,
    created_date DATE,
    created_time TIME,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (OutingID) REFERENCES Outing(OutingID),
    UNIQUE (ClientID, OutingID)
);

CREATE TABLE PayrollRecord (
    PayrollID INT AUTO_INCREMENT PRIMARY KEY,
    GuideID INT NOT NULL,
    period_month INT NOT NULL,
    period_year INT NOT NULL,
    base_salary DECIMAL(10,2) NOT NULL DEFAULT 0,
    outings_count INT NOT NULL DEFAULT 0,
    bonus_amount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (GuideID) REFERENCES Guide(GuideID),
    UNIQUE (GuideID, period_month, period_year)
);

CREATE TABLE AppraisalRecord (
    AppraisalID INT AUTO_INCREMENT PRIMARY KEY,
    GuideID INT NOT NULL,
    appraisal_date DATE NOT NULL,
    outings_led INT,
    comments TEXT,
    overall_score DECIMAL(5,2),
    FOREIGN KEY (GuideID) REFERENCES Guide(GuideID)
);

CREATE TABLE TourPerformance (
    TourID INT PRIMARY KEY,
    average_rating DECIMAL(3,2),
    total_outings INT,
    total_clients INT,
    revenue_generated DECIMAL(12,2),
    FOREIGN KEY (TourID) REFERENCES Tour(TourID)
);

-- Clients
INSERT INTO Client (ClientName, Phone, Email) VALUES
('Emma Williams', '473-1234', 'emma@example.com'),
('Jacob Brown', '473-5678', 'jacob@example.com'),
('Liam Smith', '473-9988', 'liam@example.com'),
('Olivia Davis', '473-1122', 'olivia@example.com'),
('Noah Wilson', '473-3344', 'noah@example.com');

-- Tours
INSERT INTO Tour (TourName, DurationHours, Fee) VALUES
('Grand Etang Adventure', '04:00:00', 120.00),
('Concord Waterfall Tour', '03:50:00', 100.00),
('Historic St. George’s Tour', '02:00:00', 80.00),
('Spice Island Heritage Trek', '05:00:00', 150.00);

-- Locations 
INSERT INTO Location (LocationName, LocationType, Address, Description) VALUES
('Grand Etang Lake', 'Nature', 'Grand Etang Forest Reserve', 'Beautiful volcanic crater lake.'),
('Seven Sisters Waterfalls', 'Waterfall', 'St. Andrew', 'Stunning series of waterfalls.'),
('Concord Falls', 'Waterfall', 'St. John', 'Popular waterfall with swimming areas.'),
('Fort George', 'Historic', 'St. George', '18th century fort overlooking the capital.'),
('Market Square', 'Cultural', 'St. George', 'Local produce and craft market.'),
('Annandale Falls', 'Waterfall', 'St. George', 'Accessible falls with picnic areas.'),
('Belmont Estate', 'Historic', 'St. Andrew', 'Historic cocoa and spice plantation.'),
('Levera Beach', 'Nature', 'St. Patrick', 'Northernmost beach and national park.');

-- Tour Locations
INSERT INTO TourLocation (TourID, LocationID, VisitOrder) VALUES
(1, 1, 1), (1, 6, 2), (1, 2, 3),
(2, 3, 1), (2, 2, 2), (2, 6, 3),
(3, 4, 1), (3, 5, 2), (3, 6, 3),
(4, 7, 1), (4, 8, 2), (4, 5, 3);

-- Guides
INSERT INTO Guide (GuideName, HomeAddress, DateHired) VALUES
('John Peters', 'Gouyave, St. John', '2019-01-15'),
('Sandra Thomas', 'Grenville, St. Andrew', '2020-06-10'),
('Michael Joseph', 'St. George', '2021-03-20');

-- Certifications
INSERT INTO Certification (GuideID, LocationID, CertificationDate, ExpiryDate) VALUES
(1, 1, '2022-01-10', '2025-01-10'),
(1, 2, '2023-05-10', '2025-06-10'),
(1, 6, '2024-03-01', '2027-03-01'),
(2, 3, '2024-04-05', '2026-04-05'),
(2, 2, '2025-06-05', '2025-05-05'),
(2, 6, '2025-04-05', '2026-09-05'),
(2, 7, '2021-01-01', '2027-01-01'),
(2, 8, '2021-01-09', '2027-02-01'),
(3, 4, '2020-08-12', '2026-08-12'),
(3, 5, '2020-07-11', '2026-07-11'),
(3, 6, '2022-02-20', '2027-02-20');

-- Outings
INSERT INTO Outing (TourID, OutingDate, OutingTime, GuideID) VALUES
(1, '2024-05-01', '09:00:00', 1),
(2, '2024-06-03', '10:00:00', 2),
(3, '2025-07-04', '14:00:00', 3),
(1, '2025-08-15', '08:30:00', 1),
(4, '2026-08-15', '11:00:00', 2),
(3, '2026-09-16', '09:00:00', 3);

-- ClientOuting
INSERT INTO ClientOuting (ClientID, OutingID) VALUES
(1, 1), (2, 1), (3, 1),
(4, 2), (5, 2),
(1, 3), (2, 3),
(3, 4), (4, 4), (5, 4),
(1, 5),
(5, 6), (3, 6);

-- Reviews 
INSERT INTO Review (ClientID, OutingID, rating, review_text, created_date, created_time) VALUES
(1, 1, 5, 'Amazing tour! Highly recommended.', '2024-05-01', '08:37'),
(2, 1, 4, 'Great experience but a bit long.', '2024-05-01', '09:10'),
(3, 1, 5, 'John was a fantastic guide!', '2024-05-01', '09:28'),
(4, 2, 5, 'Beautiful waterfalls and friendly guide.', '2024-06-03', '11:15'),
(5, 2, 4, 'Enjoyed the Concord Falls tour.', '2024-06-03', '11:40'),
(1, 3, 5, 'History come alive at Fort George!', '2025-07-04', '14:30'),
(2, 3, 4, 'Good historic tour, worth the time.', '2025-07-04', '15:02'),
(3, 4, 5, 'Another superb trip with John.', '2025-08-15', '10:10'),
(1, 5, 5, 'Loved the spice plantation.', '2026-08-15', '12:00'),
(5, 6, 5, 'Michael is very enthusiastic and knowledgeable.', '2026-09-16', '10:05');

-- Payroll
INSERT INTO PayrollRecord (GuideID, period_month, period_year, base_salary, outings_count, bonus_amount) VALUES
(1, 5, 2024, 2000.00, 2, 100.00),
(2, 5, 2024, 1800.00, 2, 50.00),
(3, 5, 2024, 1700.00, 2, 0.00);

-- Appraisals
INSERT INTO AppraisalRecord (GuideID, appraisal_date, outings_led, comments, overall_score) VALUES
(1, '2024-05-10', 20, 'Excellent guide with strong knowledge. Consistent high ratings.', 95.00),
(2, '2024-05-10', 15, 'Very friendly and professional. Good client feedback.', 90.00),
(3, '2024-05-10', 18, 'Guests love his enthusiasm. Needs to work on time management slightly.', 93.00);

-- Tour Performance
INSERT INTO TourPerformance (TourID, average_rating, total_outings, total_clients, revenue_generated) VALUES
(1, 4.67, 2, 6, 720.00),
(2, 4.50, 1, 2, 200.00),
(3, 4.75, 2, 4, 320.00),
(4, 5.00, 1, 1, 150.00);


-- 1. Tour locations in order
SELECT 
    T.TourName, 
    L.LocationName, 
    TL.VisitOrder
FROM Tour AS T
JOIN TourLocation AS TL ON T.TourID = TL.TourID
JOIN Location AS L ON TL.LocationID = L.LocationID
ORDER BY T.TourID, TL.VisitOrder;

-- 2. Guide certifications
SELECT 
    G.GuideName, 
    L.LocationName, 
    C.CertificationDate, 
    C.ExpiryDate
FROM Guide AS G
LEFT JOIN Certification AS C ON G.GuideID = C.GuideID
LEFT JOIN Location AS L ON C.LocationID = L.LocationID
ORDER BY G.GuideName, L.LocationName;

-- 3. Outings with guide and tour
SELECT 
    O.OutingID,
    T.TourName,
    O.OutingDate,
    O.OutingTime,
    G.GuideName
FROM Outing AS O
JOIN Tour AS T ON O.TourID = T.TourID
JOIN Guide AS G ON O.GuideID = G.GuideID
ORDER BY O.OutingID;

-- 4. Distinct clients on each tour (NO repeats)
SELECT DISTINCT
    T.TourName,
    C.ClientName
FROM ClientOuting CO
JOIN Outing O ON CO.OutingID = O.OutingID
JOIN Client C ON CO.ClientID = C.ClientID
JOIN Tour T ON O.TourID = T.TourID
ORDER BY T.TourName, C.ClientName;

-- 5. Average rating per tour
SELECT 
    T.TourName,
    AVG(R.rating) AS AvgRating
FROM Review R
JOIN Outing O ON R.OutingID = O.OutingID
JOIN Tour T ON O.TourID = T.TourID
GROUP BY T.TourName
ORDER BY T.TourName;

-- 6. Outings where guide is certified for ALL tour locations
SELECT 
    O.OutingID,
    G.GuideName,
    T.TourName
FROM Outing O
JOIN Guide G ON O.GuideID = G.GuideID
JOIN Tour T ON O.TourID = T.TourID
JOIN TourLocation TL ON T.TourID = TL.TourID
LEFT JOIN Certification C
    ON G.GuideID = C.GuideID
   AND C.LocationID = TL.LocationID
   AND CURRENT_DATE() BETWEEN C.CertificationDate AND C.ExpiryDate
GROUP BY O.OutingID
HAVING COUNT(DISTINCT TL.LocationID) = COUNT(DISTINCT C.LocationID)
ORDER BY O.OutingID;
