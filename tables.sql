-- Create Tours Table
CREATE TABLE Tours (
    TourID INT PRIMARY KEY AUTO_INCREMENT,
    TourName VARCHAR(100) NOT NULL,
    ApproxLength DECIMAL(4,2) NOT NULL,
    Fee DECIMAL(10,2) NOT NULL
);

-- Create Locations Table
CREATE TABLE Locations (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    LocationName VARCHAR(100) NOT NULL,
    LocationType VARCHAR(50) NOT NULL,
    Address VARCHAR(200),
    OfficialDescription TEXT
);

-- Create Guides Table
CREATE TABLE Guides (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    GuideName VARCHAR(100) NOT NULL,
    HomeAddress VARCHAR(200),
    DateOfHire DATE NOT NULL
);

-- Create Clients Table
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    ClientName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

-- Create TourLocations Junction Table
CREATE TABLE TourLocations (
    TourID INT,
    LocationID INT,
    VisitOrder INT NOT NULL,
    PRIMARY KEY (TourID, LocationID),
    FOREIGN KEY (TourID) REFERENCES Tours(TourID) ON DELETE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID) ON DELETE CASCADE
);

-- Create Certifications Table
CREATE TABLE Certifications (
    EmployeeID INT,
    LocationID INT,
    CertificationDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    PRIMARY KEY (EmployeeID, LocationID),
    FOREIGN KEY (EmployeeID) REFERENCES Guides(EmployeeID) ON DELETE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID) ON DELETE CASCADE
);

-- Create Outings Table
CREATE TABLE Outings (
    OutingID INT PRIMARY KEY AUTO_INCREMENT,
    TourID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OutingDate DATE NOT NULL,
    OutingTime TIME NOT NULL,
    FOREIGN KEY (TourID) REFERENCES Tours(TourID),
    FOREIGN KEY (EmployeeID) REFERENCES Guides(EmployeeID)
);

-- Create OutingClients Junction Table
CREATE TABLE OutingClients (
    OutingID INT,
    ClientID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Review TEXT,
    PRIMARY KEY (OutingID, ClientID),
    FOREIGN KEY (OutingID) REFERENCES Outings(OutingID) ON DELETE CASCADE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID) ON DELETE CASCADE
);

