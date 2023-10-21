DROP TABLE IF EXISTS Skill;
DROP TABLE IF EXISTS Survey;
DROP TABLE IF EXISTS JobPlatform;
DROP TABLE IF EXISTS JobListing;
DROP TABLE IF EXISTS SkillDemand;

CREATE TABLE Skill (
    SkillID INT AUTO_INCREMENT PRIMARY KEY,
    SkillName VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Survey (
    SurveyID INT AUTO_INCREMENT PRIMARY KEY,
    Year INT NOT NULL,
    TotalRespondents INT NOT NULL
);

CREATE TABLE JobPlatform (
    PlatformID INT AUTO_INCREMENT PRIMARY KEY,
    PlatformName VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE JobListing (
    JobID INT AUTO_INCREMENT PRIMARY KEY,
    JobTitle VARCHAR(255) NOT NULL,
    PlatformID INT,
    FOREIGN KEY (PlatformID) REFERENCES JobPlatform(PlatformID)
);

CREATE TABLE SkillDemand (
    DemandID INT AUTO_INCREMENT PRIMARY KEY,
    SkillID INT,
    JobID INT,
    SurveyID INT,
    DemandCount INT,
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID),
    FOREIGN KEY (JobID) REFERENCES JobListing(JobID),
    FOREIGN KEY (SurveyID) REFERENCES Survey(SurveyID)
);

-- Populating the Skill table
INSERT INTO Skill (SkillName) VALUES 
    ('Python'),
    ('SQL'),
    ('TensorFlow'),
    ('PyTorch'),
    ('Apache Kafka'),
    ('Tableau');

-- Populating the Survey table
INSERT INTO Survey (Year, TotalRespondents) VALUES 
    (2022, 65000);

-- Populating the JobPlatform table
INSERT INTO JobPlatform (PlatformName) VALUES 
    ('LinkedIn');

-- Populating the JobListing table
INSERT INTO JobListing (JobTitle, PlatformID) VALUES 
    ('Data Scientist', 1),
    ('ML Engineer', 1),
    ('Data Engineer', 1),
    ('Data Analyst', 1);

-- Populating the SkillDemand table
-- Assume we know the ID values for skills and job listings, adjust if they are different in your DB.
INSERT INTO SkillDemand (SkillID, JobID, SurveyID, DemandCount) VALUES 
    (1, 1, 1, 10000),  -- Python for Data Scientist
    (2, 1, 1, 9500),   -- SQL for Data Scientist
    (3, 1, 1, 7000),   -- TensorFlow for Data Scientist
    (4, 2, 1, 7200),   -- PyTorch for ML Engineer
    (5, 3, 1, 5000),   -- Apache Kafka for Data Engineer
    (6, 4, 1, 7500);   -- Tableau for Data Analyst
    
SELECT SkillName, SUM(DemandCount) as TotalDemand
FROM Skill
JOIN SkillDemand ON Skill.SkillID = SkillDemand.SkillID
GROUP BY SkillName
ORDER BY TotalDemand DESC
