-- SQL Queries for College Clubs Event Management System

-- Query to Retrieve All Club Names and Their Presidents
SELECT c.club_name, p.name AS president_name
FROM Clubs c
JOIN Presidents p ON c.president_id = p.president_id;

-- Query to Retrieve Members Who Registered for Events
SELECT m.name AS member_name, e.event_name
FROM Members m
JOIN Event_Registration er ON m.member_id = er.member_id
JOIN Events e ON er.event_id = e.event_id;

-- Query to Count the Number of Members in Each Club
SELECT c.club_name, COUNT(m.member_id) AS member_count
FROM Clubs c
LEFT JOIN Members m ON c.club_id = m.club_id
GROUP BY c.club_name;

-- Query to Retrieve Events in a Specific Date Range
SELECT event_name, date, location
FROM Events
WHERE date BETWEEN '2024-12-01' AND '2024-12-20';

-- Query to Retrieve Event Winners
SELECT m.name AS member_name, e.event_name, p.award
FROM Members m
JOIN Participation p ON m.member_id = p.member_id
JOIN Events e ON p.event_id = e.event_id
WHERE p.award = 'Winner' AND e.is_competitive = TRUE;

-- Query to List Events and Their Participants Count
SELECT e.event_name, COUNT(er.member_id) AS participants_count
FROM Events e
LEFT JOIN Event_Registration er ON e.event_id = er.event_id
GROUP BY e.event_name;

-- Query to Retrieve Clubs and Their Non-Competitive Events
SELECT c.club_name, e.event_name
FROM Clubs c
JOIN Events e ON c.club_id = e.club_id
WHERE e.is_competitive = FALSE;

-- Query to Retrieve Members and Their Role in Events
SELECT m.name AS member_name, e.event_name, p.role
FROM Members m
JOIN Participation p ON m.member_id = p.member_id
JOIN Events e ON p.event_id = e.event_id;

-- Query to Retrieve Events with More Than 2 Participants
SELECT e.event_name, COUNT(er.member_id) AS participants_count
FROM Events e
JOIN Event_Registration er ON e.event_id = er.event_id
GROUP BY e.event_name
HAVING COUNT(er.member_id) > 2;
