--Creating DataBase
CREATE DATABASE CLUBS;
USE CLUBS;

--1.Presidents Table
CREATE TABLE Presidents
(
    president_id INT PRIMARY KEY,
    name VARCHAR(100),
    title VARCHAR(50),
    -- Optional field to
    store titles
    like Dr., Mr., etc. email VARCHAR
    (100), -- Optional
field for contact info phone_number VARCHAR
    (15) -- Optional
field for contact info
);
    --2.Clubs Table
    CREATE TABLE Clubs
    (
        club_id INT
            PRIMARY KEY,
        club_name
            VARCHAR(100) NOT NULL,
        description TEXT,
        president_id INT,
        FOREIGN KEY (president_id) REFERENCES Presidents(president_id)
    );
    -- 3. Members Table
    CREATE TABLE Members
    (
        member_id INT
            PRIMARY KEY,
        name VARCHAR(100)
            NOT NULL,
        email VARCHAR(100)
            UNIQUE NOT NULL,
        phone VARCHAR(15),
        club_id INT,
        FOREIGN KEY (club_id) REFERENCES Clubs(club_id)
    );
    -- 4. Events Table
    CREATE TABLE Events
    (
        event_id
            INT PRIMARY KEY,
        event_name
            VARCHAR(100) NOT
NULL,
        club_id INT,
        date DATE NOT NULL,
        location
            VARCHAR(100),
        description TEXT,
        is_competitive BOOLEAN
            DEFAULT FALSE,
        FOREIGN KEY (club_id) REFERENCES Clubs(club_id)
    );
    -- 5. Event_Registra􀆟on Table
    CREATE TABLE Event_Registration

    (
        registration_id INT PRIMARY
KEY,
        event_id INT,
        member_id INT,
        registration_date DATE,
        FOREIGN KEY (event_id) REFERENCES Events(event_id),
        FOREIGN KEY (member_id) REFERENCES Members(member_id)
    );
    -- 6. Par􀆟cipa􀆟on Table
    CREATE TABLE Participation
    (
        participation_id INT PRIMARY
KEY,
        event_id
            INT,
        member_id INT,
        role
            VARCHAR(50),
        award
            VARCHAR(50),
        FOREIGN KEY (event_id) REFERENCES Events(event_id),
        FOREIGN KEY (member_id) REFERENCES Members(member_id)
    );

    -- Inserting data into Presidents table
    INSERT INTO Presidents
        (president_id, name, title, email, phone_number)
    VALUES
        (1001, 'MS Sushma Kunchala', 'President', 'sushma@xyz.com',
            '1234567890'),
        (1002, 'Dr. Nagini', 'President', 'nagini@xyz.com', '0987654321'),
        (1003, 'Dr. V. Priyanka', 'President', 'priyanka@xyz.com', '1122334455'),
        (1004, 'Mr. Bharath', 'President', 'bharath@xyz.com', '5566778899'),
        (1005, 'N. Siddarth Reddy', 'President', 'siddarth@xyz.com',
            '9988776655'),
        (1006, 'Dr. N. N. Ramesh', 'President', 'ramesh@xyz.com',
            '6677889900'),
        (1008, 'Dr. V. Sivaramakrishna', 'President', 'sivaramakrishna@xyz.com', '1231231230'),
        (1009, 'Dr. S. Rakesh', 'President', 'rakesh@xyz.com', '9876543210'),
        (1010, 'Dr. Y. Padmasai', 'President', 'padmasai@xyz.com', '1112223333'),
        (1011, 'Dr. N. Sunanda', 'President', 'sunanda@xyz.com', '4445556666');
    select *
    from Presidents;

    --Inserting data into clubs Table

    INSERT INTO Clubs
        (club_id, club_name, description, president_id)
    VALUES
        (1, 'CSI', 'Educational club in the computer science domain.',
            1001),
        (2, 'Turing Hut', 'Competitive coding club.', 1002),
        (3, 'IEEE', 'A technical professional association dedicated to technological growth.',
            1003),
        (4, 'GDGC', 'A community of passionate tech enthusiasts and learners.', 1004),
        (5, 'ACM', 'International student chapter that brings together technology geeks, computer
educators, and working professionals.', 1005),
        (6, 'NSS', '"Not Me But You", which reflects the essence of democratic living and upholds the need
for selfless service.', 1006),
        (7, 'ASME', 'Where mechanical engineers could exchange ideas and share information.',
            1008),
        (8, 'ICI', 'A not-for-profit organization dedicated to the cause of disseminating
knowledge on concrete, promoting concrete technology and construction.', 1009)
    ,
;
16
    (9, 'ED Cell', 'Offers incubation facilities for upcoming young entrepreneurs to incubate their ideas
in any proposed area of their interest.', 1010),
    (10, 'Krithomedh', 'Enlighten and inspire young minds about the technical perks of AI and IoT.',
1011);
    select *
    from Clubs
    -- Inserting data into Members table
    INSERT INTO Members
        (member_id, name, email, phone,
        club_id)
    VALUES
        (1, 'Amit Kumar', 'amit.kumar@gmail.com', '9876543210', 1),
        (2, 'Priya Sharma', 'priya.sharma@gmail.com', '9123456789', 1),
        (3, 'Ravi Kumar', 'ravi.kumar@gmail.com', '9988776655', 2),
        (4, 'Anjali Reddy', 'anjali.reddy@gmail.com', '9234567890', 2),
        (5, 'Suresh Babu', 'suresh.babu@gmail.com', '9876543212', 3),
        (6, 'Neha Gupta', 'neha.gupta@gmail.com', '9887654321', 3),
        (7, 'Karan Patel', 'karan.patel@gmail.com', '9876123456', 4),
        (8, 'Deepika Iyer', 'deepika.iyer@gmail.com', '9456123456', 4),
        (9, 'Nikhil Verma', 'nikhil.verma@gmail.com', '9876451234', 5),
        (10, 'Sneha Desai', 'sneha.desai@gmail.com', '9786543120', 5),
        (11, 'Vikas Singh', 'vikas.singh@gmail.com', '9236547812', 6),
        (12, 'Ritika Joshi', 'ritika.joshi@gmail.com', '9456321857', 6),
        (13, 'Arvind Yadav', 'arvind.yadav@gmail.com', '9332219876', 7),
        (14, 'Pooja Patel', 'pooja.patel@gmail.com', '9876548765', 7),
        (15, 'Manoj Kumar', 'manoj.kumar@gmail.com', '9675312845', 8),
        (16, 'Simran Kaur', 'simran.kaur@gmail.com', '9245789012', 8),
        (17, 'Sandeep Reddy', 'sandeep.reddy@gmail.com', '9334687210', 9),
        (18, 'Ayesha Khan', 'ayesha.khan@gmail.com', '9201837465', 9),
        (19, 'Rohit Sharma', 'rohit.sharma@gmail.com', '9876301234', 10),
        (20, 'Geeta Devi', 'geeta.devi@gmail.com', '9198765432',
            10);
    select *
    from members
    ;
17
    -- Inserting data into Events table
    INSERT INTO Events
        (event_id, event_name, club_id, date, location, description,
        is_competitive)
    VALUES
        (1, 'Tech Talk', 1, '2024-12-15', 'Auditorium A', 'A session on the latest trends in computer
science and technology.', FALSE),
        (2, 'Coding Marathon', 2, '2024-12-20', 'Room 301', 'A competitive coding event to challenge
participants to solve problems in limited time.', TRUE),
        (3, 'Annual Technical Conference', 3, '2024-11-25', 'Main Hall', 'An annual gathering of
technical professionals to discuss advancements in various fields.', FALSE),
        (4, 'Hackathon', 4, '2024-12-05', 'Hack Lab', 'A 24-hour coding competition focused on solving
real-world problems with technology.', TRUE),
        (5, 'Robotics Workshop', 5, '2024-12-10', 'Tech Lab', 'A hands-on workshop to build and
program robots using popular robotics platforms.', FALSE),
        (6, 'Social Responsibility Campaign', 6, '2024-12-01', 'Campus Grounds', 'An event aimed at
promoting social causes and volunteerism among students.', FALSE),
        (7, 'Mechanical Engineering Symposium', 7, '2024-12-18', 'Engineering Block', 'A symposium
where mechanical engineers present their research and innovations.', FALSE),
        (8, 'Concrete Technology Seminar', 8, '2024-12-12', 'Cement Room', 'A seminar to discuss the
latest advancements in concrete technology and construction.', FALSE),
        (9, 'Entrepreneurship Panel Discussion', 9, '2024-12-22', 'Business Auditorium', 'A panel
discussion with successful entrepreneurs sharing insights and advice on building a
startup.', FALSE)
    ,
20
    (10, 'AI & IoT Expo', 10, '2024-12-17', 'Exhibition Hall', 'An expo showcasing the latest
innovations in Artificial Intelligence and Internet of Things.', FALSE);
    select *
    from
        events;
    -- Inserting data into Event_Registration table
    INSERT INTO Event_Registration
        (registration_id, event_id, member_id, registration_date)
    VALUES
        (1, 1, 1, '2024-12-10'),
        (2, 2, 3, '2024-12-15'),
        (3, 2, 4, '2024-12-15'),
        (4, 3, 5, '2024-11-20'),
        (5, 4, 6, '2024-12-02'),
        (6, 4, 7, '2024-12-03'),
        (7, 5, 8, '2024-12-07'),
        (8, 6, 9, '2024-11-25'),
        (9, 7, 10, '2024-12-10'),
        (10, 8, 11, '2024-12-01'),
        (11, 8, 12, '2024-12-02'),
        (12, 9, 13, '2024-12-20'),
        (13, 9, 14, '2024-12-21'),
        (14, 10, 15, '2024-12-12'),
        (15,
            10, 16, '2024-12-13');
    select *
    from
        Event_Registration
    ;
21
    -- Inserting data into Participation table
    INSERT INTO Participation
        (participation_id, event_id, member_id, role, award)
    VALUES
        (1, 1, 1, 'Participant', NULL),
        (2, 2, 3, 'Participant', 'Winner'),
        (3, 2, 4, 'Participant', 'Runner-up'),
        (4, 3, 5, 'Speaker', NULL),
        (5, 4, 6, 'Organizer', NULL),
        (6, 4, 7, 'Participant', 'Winner'),
        (7, 5, 8, 'Participant', NULL),
        (8, 6, 9, 'Participant', NULL),
        (9, 7, 10, 'Speaker', NULL),
        (10, 8, 11, 'Participant', 'Winner'),
        (11, 8, 12, 'Participant', 'Runner-up'),
        (12, 9, 13, 'Panelist', NULL),
        (13, 9, 14, 'Participant', NULL),
        (14, 10, 15, 'Participant', NULL),
        (15,
            10, 16, 'Organizer', NULL);
    select
        *
    from Participation;
