-- ORIGINAL DATA (FICTIONAL, not real world data)

DROP TABLE IF EXISTS CombinedJobsAndSkillsData;
CREATE TABLE CombinedJobsAndSkillsData (
    JobTitle VARCHAR(255) NOT NULL,
    PlatformName VARCHAR(255) NOT NULL,
    Year INT NOT NULL,
    SkillName VARCHAR(255) NOT NULL,
    TotalRespondents INT NOT NULL,
    DemandCount INT NOT NULL
);

-- Populating the CombinedJobsAndSkillsData table
INSERT INTO CombinedJobsAndSkillsData (JobTitle, PlatformName, Year, SkillName, TotalRespondents, DemandCount) VALUES 
    ('Data Scientist', 'LinkedIn', 2022, 'Python', 65000, 10000),
    ('Data Scientist', 'LinkedIn', 2022, 'SQL', 65000, 9500),
    ('Data Scientist', 'LinkedIn', 2022, 'TensorFlow', 65000, 7000),
    ('ML Engineer', 'LinkedIn', 2022, 'PyTorch', 65000, 7200),
    ('Data Engineer', 'LinkedIn', 2022, 'Apache Kafka', 65000, 5000),
    ('Data Analyst', 'LinkedIn', 2022, 'Tableau', 65000, 7500);

select * from CombinedJobsAndSkillsData;