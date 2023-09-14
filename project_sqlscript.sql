REM   Script: icc_dbms_project
REM   Creates a detailed database for the clear view of ICC tournament 

CREATE TABLE icc_admin 
( 
    member_id INT NOT NULL, 
    name VARCHAR(30) NOT NULL, 
    title VARCHAR(30) NOT NULL, 
    salary INT NOT NULL, 
    PRIMARY KEY (member_id) 
);

CREATE TABLE country_team 
( 
    team_id INT NOT NULL, 
    team_name VARCHAR(20) NOT NULL, 
    board VARCHAR(10) NOT NULL, 
    admitted_year INT NOT NULL, 
    approved_by INT NOT NULL, 
    PRIMARY KEY (team_id), 
    FOREIGN KEY (approved_by) REFERENCES icc_admin(member_id) 
);

CREATE TABLE tournament 
( 
    tournament_id INT NOT NULL, 
    format VARCHAR(20) NOT NULL, 
    year INT NOT NULL, 
    hosts VARCHAR(20) NOT NULL, 
    organized_by INT NOT NULL, 
    PRIMARY KEY (tournament_id), 
    FOREIGN KEY (organized_by) REFERENCES icc_admin(member_id) 
);

CREATE TABLE player 
( 
    player_id INT NOT NULL, 
    player_name VARCHAR(30) NOT NULL, 
    role VARCHAR(30) NOT NULL, 
    team_id INT NOT NULL, 
    PRIMARY KEY (player_id), 
    FOREIGN KEY (team_id) REFERENCES country_team(team_id) 
);

CREATE TABLE award 
( 
    award_name VARCHAR(30) NOT NULL, 
    award_year INT NOT NULL, 
    player_id INT NOT NULL, 
    member_id INT NOT NULL, 
    PRIMARY KEY (award_name,award_year), 
    FOREIGN KEY (player_id) REFERENCES player(player_id), 
    FOREIGN KEY (member_id) REFERENCES icc_admin(member_id) 
);

CREATE TABLE match 
( 
    match_id INT NOT NULL, 
    played_date DATE, 
    venue VARCHAR(30) NOT NULL, 
    PRIMARY KEY (match_id) 
);

CREATE TABLE teamA 
( 
    match_id INT NOT NULL, 
    team_id INT NOT NULL, 
    score INT NOT NULL, 
    result VARCHAR(10) NOT NULL, 
    PRIMARY KEY (match_id,team_id), 
    FOREIGN KEY (match_id) REFERENCES match(match_id), 
    FOREIGN KEY (team_id) REFERENCES country_team(team_id) 
);

CREATE TABLE teamB    
( 
    match_id INT NOT NULL, 
    team_id INT NOT NULL, 
    score INT NOT NULL, 
    result VARCHAR(10) NOT NULL, 
    PRIMARY KEY (match_id,team_id), 
    FOREIGN KEY (match_id) REFERENCES match(match_id), 
    FOREIGN KEY (team_id) REFERENCES country_team(team_id) 
);

CREATE TABLE match_stats 
( 
    player_id INT NOT NULL, 
    match_id INT NOT NULL, 
    runs_scored INT NOT NULL, 
    wickets_taken INT NOT NULL, 
    PRIMARY KEY (player_id,match_id), 
    FOREIGN KEY (player_id) REFERENCES player(player_id), 
    FOREIGN KEY (match_id) REFERENCES match(match_id) 
);

CREATE TABLE player_stats 
( 
    player_id INT NOT NULL, 
    matches INT NOT NULL, 
    runs INT NOT NULL, 
    highest INT NOT NULL, 
    average DECIMAL(4,2), 
    strike_rate DECIMAL(5,2), 
    no_of_100s INT NOT NULL, 
    wickets INT NOT NULL, 
    economy INT, 
    points INT, 
    icc_rank INT, 
    PRIMARY KEY (player_id), 
    FOREIGN KEY (player_id) REFERENCES player(player_id) 
);

INSERT INTO icc_admin VALUES (201, 'Greg Barclay', 'Chairman',1000000);

INSERT INTO icc_admin VALUES (202, 'Shashank Manohar', 'Ex-Chairman', 950000);

INSERT INTO icc_admin VALUES (203, 'Clare Connor', 'Chair-Woman', 590400);

INSERT INTO icc_admin VALUES (204, 'Clive Hitchcock', 'Secretary', 420000);

INSERT INTO icc_admin VALUES (205, 'Ranjan Madugalle', 'Chief Refree', 40000);

INSERT INTO icc_admin VALUES (206, 'Kyle Coetzer', 'Associate Repr',490000);

INSERT INTO icc_admin VALUES (207, 'David Kendix', 'Statistician', 140000);

INSERT INTO icc_admin VALUES (208, 'Matthew Mott', 'Coach Repr.',306000);

INSERT INTO icc_admin VALUES (209, 'Shaun Pollock', 'Media Repr.',50000);

INSERT INTO icc_admin VALUES (210, 'David White', 'Member Repr.', 100000);

INSERT INTO country_team VALUES (101, 'India', 'BCCI', 1926,201);

INSERT INTO country_team VALUES (102, 'Australia', 'CA', 1909,203);

INSERT INTO country_team VALUES (103, 'England', 'ECB', 1909,204);

INSERT INTO country_team VALUES (104, 'South Africa', 'CSA', 1909,205);

INSERT INTO country_team VALUES (105, 'West Indies', 'WCB', 1926,204);

INSERT INTO country_team VALUES (106, 'Pakistan', 'PCB', 1952,206);

INSERT INTO country_team VALUES (107, 'Sri Lanka', 'SLC',1981,207);

INSERT INTO country_team VALUES (108, 'Bangladesh', 'BCB', 2000,203);

INSERT INTO country_team VALUES (109, 'Afghanistan', 'ACB', 2017, 202);

INSERT INTO country_team VALUES (110, 'Zimbabwe', 'ZC', 1992,206);

INSERT INTO tournament VALUES (301, 'ODI', 2011, 'India', 201);

INSERT INTO tournament VALUES (302, 'T20I',2016, 'India', 202);

INSERT INTO tournament VALUES (383, 'ODI', 2015, 'Australia', 203);

INSERT INTO tournament VALUES (304, 'ODI', 2019, 'England', 204);

INSERT INTO tournament VALUES (305, 'WTC', 2021, 'Final(England)', 205);

INSERT INTO tournament VALUES (306, 'T20I', 2021, 'India', 206);

INSERT INTO player VALUES (401, 'Virat Kohli', 'Right Handed Batsman',101);

INSERT INTO player VALUES (402, 'Rohit Sharma', 'Right Handed Batsman', 101);

INSERT INTO player VALUES(403, 'Jasprit Bumrah', 'Right Arm Fast Bowler', 101);

INSERT INTO player VALUES (404, 'Joe Hoot', 'Right Handed Batsman', 103);

INSERT INTO player VALUES (405, 'Ravichandran Ashwin', 'off break Bowler', 101);

INSERT INTO player VALUES (406, 'Ashton Agar', 'Slow Left Arm, Bowler', 102);

INSERT INTO player VALUES (407, 'David Warner', 'Left Handed Batsman',102);

INSERT INTO player VALUES (408, 'Shaheen Afridi', 'Left Handed Batsman', 106);

INSERT INTO player VALUES(409, 'Rashid Khan', 'Leg Break Bowler', 109);

INSERT INTO player VALUES (410, 'Sikandar Raza', 'All Rounder', 110);

INSERT INTO player VALUES(411, 'Ben Stokes', 'All Rounder', 103);

INSERT INTO player VALUES(412, 'Nicholas Pooran', 'Wicket Keeper', 105);

INSERT INTO player VALUES (413, 'Maheesh Teekshana', 'off Break Bowler', 107);

INSERT INTO player VALUES (414, 'Shakib Al Hasan', 'All Rounder', 108);

INSERT INTO player VALUES (415, 'Wanindu Hasaranga', 'Leg Break Bowler', 107);

INSERT INTO player VALUES (416, 'Quinton De Cock', 'Wicket Keeper', 104);

INSERT INTO player VALUES (417, 'Steve Smith', 'Right Handed Batsman', 102);

INSERT INTO player VALUES(418, 'MS Dhoni', 'Wicket Keeper', 101);

INSERT INTO player VALUES(419, 'Babar Azam', 'Right Handed Batsman', 106);

INSERT INTO award VALUES ('ODI Player of The Decade', 2020,401,206);

INSERT INTO award VALUES('T20 Player of The Decade', 2020,409,207);

INSERT INTO award VALUES ('Test Player of The Decade', 2020,417,209);

INSERT INTO award VALUES ('Test Player of The Year', 2021,404,205);

INSERT INTO award VALUES ('Spirit of The Decade', 2020,418,202);

INSERT INTO award VALUES ('ODI Player of The Year', 2021,419,206);

INSERT INTO match VALUES (501, DATE '2022-08-20', 'Kolkata');

INSERT INTO match VALUES (502, DATE '2022-08-21', 'Lord''s');

INSERT INTO match VALUES (503, DATE '2022-07-22', 'MCG');

INSERT INTO match VALUES (504, DATE '2021-07-23', 'Johannesburg');

INSERT INTO match VALUES (505, DATE '2020-05-24', 'Dubai');

INSERT INTO match VALUES (506, DATE '2022-05-25', 'Ahmedabad');

INSERT INTO match VALUES (507, DATE '2021-06-26', 'Brisbane');

INSERT INTO match VALUES (508, DATE '2020-08-27', 'Colombo');

INSERT INTO match VALUES (509, DATE '2020-09-28', 'Kolkata');

INSERT INTO match VALUES (510, DATE '2021-10-29', 'MCG');

INSERT INTO teamA VALUES (501, 101, 325, 'Won');

INSERT INTO teamA VALUES (502, 103, 215, 'Lost');

INSERT INTO teamA VALUES (503, 102, 376, 'Won');

INSERT INTO teamA VALUES (504, 104, 321, 'Won');

INSERT INTO teamA VALUES (505, 106, 298, 'Lost');

INSERT INTO teamA VALUES (506, 101, 412, 'Won');

INSERT INTO teamA VALUES (507, 102, 275, 'Won');

INSERT INTO teamA VALUES (508, 107, 283, 'Lost');

INSERT INTO teamA VALUES (509, 101, 356, 'Lost');

INSERT INTO teamA VALUES (510, 102, 225, 'Lost');

INSERT INTO teamB VALUES (501, 103, 300, 'Lost');

INSERT INTO teamB VALUES (502, 105, 220, 'Won');

INSERT INTO teamB VALUES (503, 109, 276, 'Lost');

INSERT INTO teamB VALUES (504, 108, 311, 'Lost');

INSERT INTO teamB VALUES (505, 102, 300, 'Won');

INSERT INTO teamB VALUES (506, 104, 356, 'Lost');

INSERT INTO teamB VALUES (507, 110, 234, 'Lost');

INSERT INTO teamB VALUES (508, 103, 282, 'Won');

INSERT INTO teamB VALUES (509, 102, 357, 'Won');

INSERT INTO teamB VALUES (510, 101, 226, 'Won');

INSERT INTO match_stats VALUES (402,501,112,1);

INSERT INTO match_stats VALUES (404,501,14,2);

INSERT INTO match_stats VALUES (411,502,66,4);

INSERT INTO match_stats VALUES (412,502,27,0);

INSERT INTO match_stats VALUES (407,503,94,0);

INSERT INTO match_stats VALUES (409,503,32,6);

INSERT INTO match_stats VALUES (416,504,134,0);

INSERT INTO match_stats VALUES (414,504,56,3);

INSERT INTO match_stats VALUES (408,505,4,4);

INSERT INTO match_stats VALUES (406,505,45,2);

INSERT INTO match_stats VALUES (403,506,6,4);

INSERT INTO match_stats VALUES (416,506,34,0);

INSERT INTO match_stats VALUES (417,507,78,1);

INSERT INTO match_stats VALUES (410,507,47,2);

INSERT INTO match_stats VALUES (415,508,58, 5);

INSERT INTO match_stats VALUES (404,508,36,0);

INSERT INTO match_stats VALUES (401,509,110,0);

INSERT INTO match_stats VALUES (407,509,23,0);

INSERT INTO match_stats VALUES (417,510,51,1);

INSERT INTO match_stats VALUES (402,510,209,0);

INSERT INTO player_stats VALUES (401,262,12344,183,57.68,92.44,43,4,6.22,744,5);

INSERT INTO player_stats VALUES (402,233,9376,264,48.58,89.18,29,8,5.21,740,6);

INSERT INTO player_stats VALUES (403,72,47,14,6.71,50.54,8,121,4.64,662,4);

INSERT INTO player_stats VALUES (404,158,6207,133,50.06,86.93,16,26,5.77,691,13);

INSERT INTO player_stats VALUES (405,113,707,65,16.44,86.96,8,151,4.94, NULL, NULL);

INSERT INTO player_stats VALUES (406,17,239,46,21.73,84.15,0,17,5.34,434,74);

INSERT INTO player_stats VALUES (407,135,5680,179,44.38,95.13,24,0,8,739,7);

INSERT INTO player_stats VALUES (408, 32, 102, 19,17,68.46,0,62,5.51,661,5);

INSERT INTO player_stats VALUES (409,83,1114,60, 21.02,105.69,0,158,4.17,651,8);

INSERT INTO player_stats VALUES (410, 122, 3648,141,36.85,84.42,6,70,4.9,NULL,30);

INSERT INTO player_stats VALUES (411,105, 2924,182,38.99,95.09,3,74,6.05, NULL, NULL);

INSERT INTO player_stats VALUES (412,52,1555,118,36.16, 96.11,1,6,6.18, NULL, 29);

INSERT INTO player_stats VALUES (413,9,28,11,8,47.46,0,10,4.07,433,75);

INSERT INTO player_stats VALUES (414,221,6755,134,37.53,82.26,9,285,4.44,619,16);

INSERT INTO player_stats VALUES (416,132,5774,178,46.19,96.2,17,8,NULL,784,3);

INSERT INTO player_stats VALUES (417,132,4554,164,44.21,88.2,11,28,5.41,672,20);

INSERT INTO player_stats VALUES (419,92,4664,158,59.79,89.74,17,0,NULL,890,1);

INSERT INTO player_stats VALUES (415,31,604, 88, 25.17,103.42,8,34,5.1,531,39);

INSERT INTO player_stats VALUES (418,350, 10773, 183, 50.58,87.56,10,1,5.17, NULL, NULL);

