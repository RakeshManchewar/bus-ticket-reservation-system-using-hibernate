-- Schema for Bus Ticket Reservation System using Hibernate
-- Note: Hibernate can auto-create these tables, but this file is for reference.
CREATE DATABASE IF NOT EXISTS bus_ticket_hibernate;
USE bus_ticket_hibernate;

-- Table structure for table `admin`
CREATE TABLE IF NOT EXISTS admin (
    adminId INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Table structure for table `route`
CREATE TABLE IF NOT EXISTS route (
    routeId INT PRIMARY KEY AUTO_INCREMENT,
    source VARCHAR(255) NOT NULL,
    destination VARCHAR(255) NOT NULL,
    distance DOUBLE NOT NULL
);

-- Table structure for table `bus`
CREATE TABLE IF NOT EXISTS bus (
    busId INT PRIMARY KEY AUTO_INCREMENT,
    busNumber VARCHAR(255) UNIQUE NOT NULL,
    busType VARCHAR(255),
    totalSeats INT NOT NULL,
    availableSeats INT NOT NULL,
    routeId INT,
    fare DOUBLE NOT NULL,
    FOREIGN KEY (routeId) REFERENCES route(routeId) ON DELETE SET NULL
);

-- Table structure for table `customer`
CREATE TABLE IF NOT EXISTS customer (
    customerId INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20)
);

-- Table structure for table `booking`
CREATE TABLE IF NOT EXISTS booking (
    bookingId INT PRIMARY KEY AUTO_INCREMENT,
    customerId INT NOT NULL,
    busId INT NOT NULL,
    bookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    journeyDate DATE NOT NULL,
    numOfSeats INT NOT NULL,
    totalFare DOUBLE NOT NULL,
    status VARCHAR(50) DEFAULT 'CONFIRMED',
    FOREIGN KEY (customerId) REFERENCES customer(customerId) ON DELETE CASCADE,
    FOREIGN KEY (busId) REFERENCES bus(busId) ON DELETE CASCADE
);

-- Insert initial data
INSERT INTO admin (username, password) VALUES ('admin', 'admin123');

INSERT INTO route (source, destination, distance) VALUES
('Nagpur', 'Pune', 800),
('Nagpur', 'Mumbai', 900),
('Pune', 'Nagpur', 800);

INSERT INTO bus (busNumber, busType, totalSeats, availableSeats, routeId, fare) VALUES
('MH1001', 'AC Sleeper', 40, 40, 1, 850.00),
('MH1002', 'Non-AC Sleeper', 35, 35, 2, 1200.00),
('MH1003', 'AC Seater', 40, 40, 3, 850.00);

-- Verification
SELECT 'Hibernate Database Schema created successfully.' AS Status;
