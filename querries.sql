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
