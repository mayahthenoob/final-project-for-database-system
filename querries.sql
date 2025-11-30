SELECT 
    t.TourName,
    COUNT(DISTINCT o.OutingID) AS TotalOutings,
    COUNT(oc.ClientID) AS TotalClients,
    AVG(oc.Rating) AS AvgRating,
    SUM(t.Fee) AS TotalRevenue
FROM Tours t
JOIN Outings o ON t.TourID = o.TourID
JOIN OutingClients oc ON o.OutingID = oc.OutingID
GROUP BY t.TourID, t.TourName
ORDER BY TotalRevenue DESC;


SELECT 
    g.EmployeeID,
    g.GuideName,
    COUNT(DISTINCT o.OutingID) AS OutingsLed,
    COUNT(DISTINCT oc.ClientID) AS ClientsServed,
    AVG(oc.Rating) AS AvgRating,
    SUM(t.Fee) AS RevenueGenerated
FROM Guides g
JOIN Outings o ON g.EmployeeID = o.EmployeeID
JOIN Tours t ON o.TourID = t.TourID
JOIN OutingClients oc ON o.OutingID = oc.OutingID
GROUP BY g.EmployeeID, g.GuideName
ORDER BY AvgRating DESC, RevenueGenerated DESC;


SELECT 
    g.GuideName,
    l.LocationName,
    c.ExpiryDate,
    DATEDIFF(c.ExpiryDate, CURDATE()) AS DaysRemaining
FROM Certifications c
JOIN Guides g ON c.EmployeeID = g.EmployeeID
JOIN Locations l ON c.LocationID = l.LocationID
WHERE c.ExpiryDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 90 DAY)
ORDER BY c.ExpiryDate;


SELECT DISTINCT g.EmployeeID, g.GuideName
FROM Guides g
WHERE NOT EXISTS (
    SELECT tl.LocationID
    FROM TourLocations tl
    WHERE tl.TourID = 1  -- Replace with desired TourID
    AND NOT EXISTS (
        SELECT 1
        FROM Certifications c
        WHERE c.EmployeeID = g.EmployeeID
        AND c.LocationID = tl.LocationID
        AND c.ExpiryDate > CURDATE()
    )
);


SELECT 
    g.EmployeeID,
    g.GuideName,
    COUNT(o.OutingID) AS OutingsThisMonth,
    COUNT(o.OutingID) * 50 AS MonthlyPay
FROM Guides g
LEFT JOIN Outings o ON g.EmployeeID = o.EmployeeID
    AND MONTH(o.OutingDate) = MONTH(CURDATE())
    AND YEAR(o.OutingDate) = YEAR(CURDATE())
GROUP BY g.EmployeeID, g.GuideName
ORDER BY MonthlyPay DESC;


SELECT 
    l.LocationName,
    l.LocationType,
    COUNT(DISTINCT tl.TourID) AS ToursIncluded,
    COUNT(DISTINCT oc.ClientID) AS TotalVisitors
FROM Locations l
JOIN TourLocations tl ON l.LocationID = tl.LocationID
JOIN Outings o ON tl.TourID = o.TourID
JOIN OutingClients oc ON o.OutingID = oc.OutingID
GROUP BY l.LocationID, l.LocationName, l.LocationType
ORDER BY TotalVisitors DESC;