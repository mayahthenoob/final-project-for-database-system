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
