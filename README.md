# College Clubs Event Management System

The College Clubs Event Management System is designed to streamline and efficiently handle the organization, participation, and tracking of events hosted by various college clubs. This database management project provides a structured solution for managing club details, member participation, event registrations, and specific roles or awards within events, catering to both competitive and non-competitive event types.

## Project Overview
The primary goal of the system is to ensure easy access and efficient management of event-related data for college club administrators and participants alike. The system consists of five core tables that represent the foundational entities of the system:

1. **Clubs**: Stores details about each club, including unique identifiers, names, descriptions, and associated presidents.
2. **Members**: Maintains information about students, such as names, contact details, and their associated clubs.
3. **Events**: Logs information about events, including event names, dates, locations, descriptions, and whether they are competitive or non-competitive.
4. **Event_Registration**: Captures registration data linking members to events they have signed up for.
5. **Participation**: Records roles and achievements of participants in events, such as roles (e.g., "Participant," "Organizer," "Judge") and awards won.

## Features
- Efficient tracking of events organized by various college clubs.
- Support for both competitive and non-competitive events.
- Detailed logging of member participation and achievements.
- Capability to manage event registrations and participant roles.
- Easy generation of reports for club administrators.

## Database Design
### Entity Relationships
- **Clubs** and **Members**: A club can have multiple members, but each member belongs to one club.
- **Events** and **Clubs**: An event is organized by a single club.
- **Event_Registration**: Links members to the events they have registered for.
- **Participation**: Tracks participant roles and awards within events.

### Tables
#### Clubs
| Column           | Type          | Description                               |
|------------------|---------------|-------------------------------------------|
| club_id          | INT           | Unique identifier for each club.          |
| club_name        | VARCHAR(100)  | Name of the club.                         |
| description      | TEXT          | Description of the club.                  |
| president_id     | INT           | References the president of the club.     |

#### Members
| Column           | Type          | Description                               |
|------------------|---------------|-------------------------------------------|
| member_id        | INT           | Unique identifier for each member.        |
| name             | VARCHAR(100)  | Name of the member.                       |
| email            | VARCHAR(100)  | Email address of the member.              |
| phone            | VARCHAR(15)   | Contact number of the member.             |
| club_id          | INT           | References the club to which the member belongs. |

#### Events
| Column           | Type          | Description                               |
|------------------|---------------|-------------------------------------------|
| event_id         | INT           | Unique identifier for each event.         |
| event_name       | VARCHAR(100)  | Name of the event.                        |
| club_id          | INT           | References the club organizing the event. |
| date             | DATE          | Date of the event.                        |
| location         | VARCHAR(100)  | Location of the event.                    |
| description      | TEXT          | Description of the event.                 |
| is_competitive   | BOOLEAN       | Indicates if the event is competitive.    |

#### Event_Registration
| Column           | Type          | Description                               |
|------------------|---------------|-------------------------------------------|
| registration_id  | INT           | Unique identifier for each registration.  |
| event_id         | INT           | References the event being registered for.|
| member_id        | INT           | References the registering member.        |
| registration_date| DATE          | Date of registration.                     |

#### Participation
| Column           | Type          | Description                               |
|------------------|---------------|-------------------------------------------|
| participation_id | INT           | Unique identifier for each participation. |
| event_id         | INT           | References the event.                     |
| member_id        | INT           | References the participating member.      |
| role             | VARCHAR(50)   | Role of the participant (e.g., "Judge").  |
| award            | VARCHAR(50)   | Award won by the participant (if any).    |

## Example Queries
### Retrieve All Club Names and Their Presidents
```sql
SELECT c.club_name, p.name AS president_name
FROM Clubs c
JOIN Presidents p ON c.president_id = p.president_id;
```

### Retrieve Members Who Registered for Events
```sql
SELECT m.name AS member_name, e.event_name
FROM Members m
JOIN Event_Registration er ON m.member_id = er.member_id
JOIN Events e ON er.event_id = e.event_id;
```

### Count the Number of Members in Each Club
```sql
SELECT c.club_name, COUNT(m.member_id) AS member_count
FROM Clubs c
LEFT JOIN Members m ON c.club_id = m.club_id
GROUP BY c.club_name;
```

### Retrieve Events in a Specific Date Range
```sql
SELECT event_name, date, location
FROM Events
WHERE date BETWEEN '2024-12-01' AND '2024-12-20';
```

### Retrieve Event Winners
```sql
SELECT m.name AS member_name, e.event_name, p.award
FROM Members m
JOIN Participation p ON m.member_id = p.member_id
JOIN Events e ON p.event_id = e.event_id
WHERE p.award = 'Winner' AND e.is_competitive = TRUE;
```

## How to Use
1. Clone this repository.
2. Import the SQL script into your preferred database management system.
3. Run the provided queries to interact with the data.
4. Customize the system as per your requirements.

## License
This project is licensed under the VNRVJIET collage . Feel free to use and modify it for educational or commercial purposes.

## Contributing
Contributions are welcome! Please create a pull request with your changes or open an issue for discussion.
