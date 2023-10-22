
-- Creating the database
DROP DATABASE IF EXISTS Project3;
CREATE DATABASE Project3;
USE Project3;

-- DROP TABLE IF EXISTS skills;
-- DROP TABLE IF EXISTS JobPlatform;
-- DROP TABLE IF EXISTS JobPlatformListing;
-- DROP TABLE IF EXISTS JobListingSkills;
-- DROP TABLE IF EXISTS Survey;

-- Creating the tables

-- Skills table
CREATE TABLE Skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(255) NOT NULL
);

-- Platforms where jobs are posted
CREATE TABLE JobPlatform (
    platform_id INT AUTO_INCREMENT PRIMARY KEY,
    platform_name VARCHAR(255) NOT NULL
);

-- Companies table
CREATE TABLE Company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL
);

-- Job listings table
CREATE TABLE JobListing (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(255) NOT NULL,
    company_id INT,
    location VARCHAR(255) NOT NULL,
    schedule_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

-- Relation between Job Listings and Platforms where they are posted
CREATE TABLE JobPlatformListing (
    job_id INT,
    platform_id INT,
    PRIMARY KEY (job_id, platform_id),
    FOREIGN KEY (job_id) REFERENCES JobListing(job_id),
    FOREIGN KEY (platform_id) REFERENCES JobPlatform(platform_id)
);

-- Skills required for each job listing
CREATE TABLE JobListingSkills (
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id, skill_id),
    FOREIGN KEY (job_id) REFERENCES JobListing(job_id),
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id)
);

-- Survey results table
CREATE TABLE Survey (
    survey_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_id INT,
    demand_percentage DECIMAL(5,2),
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id)
);
