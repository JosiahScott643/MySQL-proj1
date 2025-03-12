<h1>Olympic Medals Database</h1>

<h2>Description</h2>
The **Olympic Medals Database** project is designed to store and manage information about Olympic medalists throughout history. The dataset includes every athlete who has won a medal since the inception of the Olympic Games in 1896. The database is designed to eliminate redundant and duplicated information by applying **Third Normal Form (3NF)**, ensuring that data is structured efficiently.

In this project, I designed and created a relational database to store medal-related data, adhering to the rules of normalization to eliminate redundancy. I worked with data detailing athletes, their countries, and the medals they won. I used SQL to create tables, define relationships between entities, and insert sample data to test the functionality of the database.

<br />

<h2>Languages and Tools Used</h2>

- <b>SQL</b> 
- <b>Relational Database Management System (RDBMS)</b> (e.g., MySQL, PostgreSQL)

<h2>Database Structure</h2>

The database is designed with the following tables:

1. <b>Athletes</b>
   - Contains information about Olympic athletes (e.g., name, gender, date of birth).
   - Primary Key: `athlete_id`.

2. <b>Countries</b>
   - Stores information about countries (e.g., country name).
   - Primary Key: `country_id`.

3. <b>Events</b>
   - Describes the Olympic events (e.g., event name, year).
   - Primary Key: `event_id`.

4. <b>Medals</b>
   - Contains information about the medals awarded (e.g., medal type, athlete ID, event ID).
   - Primary Key: `medal_id`.
   - Foreign Keys: `athlete_id`, `event_id`, `country_id`.

<h2>Program Walk-through</h2>

1. **Designing the Database**:
   - Designed the schema with proper normalization in mind to ensure that no redundant data was stored.
   - Applied **3rd Normal Form (3NF)** to organize data into distinct tables and minimize duplication.

2. **Creating Tables**:
   - Used SQL commands to create the `Athletes`, `Countries`, `Events`, and `Medals` tables, defining primary and foreign keys to establish relationships.

   Example SQL for creating the `Athletes` table:
   ```sql
   CREATE TABLE Athletes (
       athlete_id INT PRIMARY KEY,
       first_name VARCHAR(100),
       last_name VARCHAR(100),
       date_of_birth DATE,
       gender CHAR(1),
       country_id INT,
       FOREIGN KEY (country_id) REFERENCES Countries(country_id)
   );
