# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peopleroles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

drop table if exists skills;
CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(4096) NOT NULL DEFAULT '(default description)',
    tag VARCHAR(255) NOT NULL,
    url VARCHAR(4096),
    time_commitment VARCHAR(255)
    );

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(id, name, description, tag, url, time_commitment)
VALUES
    (1, 'Skating', 'Enjoying skating on various surfaces.', 'Sports', NULL, '3 hours per week'),
    (2, 'Painting', 'Expressing creativity through painting.', 'Art', NULL, '5 hours per week'),
    (3, 'Coding', 'Creating and building programs with computer programming.', 'Technology', NULL, '10 hours per week'),
    (4, 'House Cleaning', 'Keeping your home clean and organized.', 'Home & Living', NULL, '2 hours per week'),
    (5, 'Singing', 'Having fun singing and performing music.', 'Music', NULL, '4 hours per week'),
    (6, 'Sewing', 'Making and fixing clothes with a needle and thread.', 'Crafts', NULL, '6 hours per week'),
    (7, 'Travelling', 'Exploring new places and experiencing different cultures.', 'Adventure', NULL, 'Varies'),
    (8, 'Dancing', 'Expressing emotions through dance moves.', 'Performing Arts', NULL, '3 hours per week')
;

SELECT * FROM skills;

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)

# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

drop table if exists people;
CREATE TABLE people (
    people_id INT PRIMARY KEY,
    people_first_name VARCHAR(255),
    people_last_name VARCHAR(256) NOT NULL,
    people_email VARCHAR(255) DEFAULT '(default email)',
    people_linkedin_url VARCHAR(4096),
    people_headshot_url VARCHAR(4096),
    people_discord_handle VARCHAR(255),
    brief_bio VARCHAR(4096),
    date_joined DATE NOT NULL DEFAULT '2023-11-08'
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,people_first_name, people_last_name, people_email, people_linkedin_url,people_headshot_url,people_discord_handle, brief_bio) values 
    (1, 'John', 'Person 1', 'john1@gmail.com', 'https://www.linkedin.com/in/john1', 'https://example.com/john1_headshot.jpg', 'john1_discord', 'Experienced professional with a passion for innovation.'),
    (2, 'Emma', 'Person 2', 'emma2@yahoo.com', 'https://www.linkedin.com/in/emma2', 'https://example.com/emma2_headshot.jpg', 'emma2_discord', 'Strategic thinker with a passion for pushing boundaries.'),
    (3, 'Sara', 'Person 3', 'sara3@vcu.edu', 'https://www.linkedin.com/in/sara3', 'https://example.com/sara3_headshot.jpg', 'sara3_discord', 'Dedicated individual with strong problem-solving skills.'),
    (4, 'Tanya', 'Person 4', 'tanya4@gmail.com', 'https://www.linkedin.com/in/tanya4', 'https://example.com/tanya4_headshot.jpg', 'tanya4_discord', 'Results-driven professional committed to excellence.'),
    (5, 'Bella', 'Person 5', 'bella5@yahoo.com', 'https://www.linkedin.com/in/bella5', 'https://example.com/bella5_headshot.jpg', 'bella5_discord', 'Creative thinker with a passion for design.'),
    (6, 'Kartik', 'Person 6', 'kartik6@yahoo.com', 'https://www.linkedin.com/in/kartik6', 'https://example.com/kartik6_headshot.jpg', 'kartik6_discord', 'Tech enthusiast with a focus on software development.'),
    (7, 'Dan', 'Person 7', 'dan07@yahoo.com', 'https://www.linkedin.com/in/dan07', 'https://example.com/dan07_headshot.jpg', 'dan07_discord', 'Accomplished professional turning challenges into opportunities.'),
    (8, 'Akansh', 'Person 8', 'akansha8@yahoo.com', 'https://www.linkedin.com/in/akansh8', 'https://example.com/akansh8_headshot.jpg', 'akansh8_discord', 'Seasoned expert with a flair for creative problem-solving.'),
    (9, 'Kia', 'Person 9', 'kiaelizabeth9@yahoo.com', 'https://www.linkedin.com/in/kia9', 'https://example.com/kia9_headshot.jpg', 'kia9_discord', 'Proactive problem-solver with a keen eye for opportunities.'),
    (10, 'Paul', 'Person 10', 'paul10@yahoo.com', 'https://www.linkedin.com/in/paul10', 'https://example.com/paul10_headshot.jpg', 'paul10_discord', 'Visionary leader driving positive change.');


SELECT * FROM people;
# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if exists peopleskills;
CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL
);



# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES
    (1, 1, '2023-11-08'),  
    (3, 1, '2023-11-09'),  
    (6, 1, '2023-11-10'), 
    (3, 2, '2023-11-08'), 
    (4, 2, '2023-11-09'),  
    (5, 2, '2023-11-10'),  
    (1, 3, '2023-11-08'), 
    (5, 3, '2023-11-10'),  
    (3, 5, '2023-11-08'),  
    (6, 5, '2023-11-09'),  
    (2, 6, '2023-11-08'),  
    (3, 6, '2023-11-09'),  
    (4, 6, '2023-11-10'),  
    (3, 7, '2023-11-08'), 
    (5, 7, '2023-11-09'),  
    (6, 7, '2023-11-10'),
    (1, 8, '2023-11-08'),  
    (3, 8, '2023-11-09'),  
    (5, 8, '2023-11-10'),  
    (6, 8, '2023-11-11'), 
    (2, 9, '2023-11-08'),  
    (5, 9, '2023-11-10'), 
    (6, 9, '2023-11-11'), 
    (1, 10, '2023-11-08'), 
    (4, 10, '2023-11-09'),  
    (5, 10, '2023-11-10');

SELECT * FROM peopleskills;
-- SELECT count(*) FROM peopleskills;

-- SELECT
--     people_last_name,
--     name,
--     tag
-- FROM
--     peopleskills a
-- INNER JOIN people b on (a.people_id=b.people_id)
-- INNER JOIN skills c on (a.skills_Id=c.id)
-- WHERE
--     people_last_name='Person 1'
-- ORDER BY
--     name,
--     people_last_name;


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

drop table if exists roles;
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sort_priority INT NOT NULL
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (name, sort_priority)
VALUES
    ('Designer', 10),
    ('Developer', 20),
    ('Recruit', 30),
    ('Team Lead', 40),
    ('Boss', 50),
    ('Mentor', 60);

SELECT * FROM roles;


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL
);



# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles(people_id, role_id, date_assigned)
VALUES
    (1, 2, '2023-11-08'),
    (2, 5, '2023-11-08'), 
    (2, 6, '2023-11-08'), 
    (3, 2, '2023-11-08'), 
    (3, 4, '2023-11-08'), 
    (4, 3, '2023-11-08'), 
    (5, 3, '2023-11-08'), 
    (6, 2, '2023-11-08'), 
    (6, 1, '2023-11-08'), 
    (7, 1, '2023-11-08'), 
    (8, 1, '2023-11-08'), 
    (8, 4, '2023-11-08'), 
    (9, 2, '2023-11-08'), 
    (10, 2, '2023-11-08'),
    (10, 1, '2023-11-08'); 

    SELECT * FROM peopleroles;