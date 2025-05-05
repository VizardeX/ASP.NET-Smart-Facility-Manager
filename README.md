# ASP.NET Smart Facility Manager

## Overview
**ASP.NET Smart Facility Manager** is a role-based web application built using ASP.NET Web Forms. It enables admins, finance officers, and guests to interact through a shared digital space, managing rooms, events, devices, and internal communication. The system offers user registration, login, event management, and device tracking with a clean, modular architecture.

## Features
- Authentication and role-based access: Admin, Guest, and Finance users each have specific views and permissions.
- Event management: Create, view, and manage events depending on user roles.
- Room and device tracking: Monitor facility rooms and devices, including pages for out-of-battery alerts.
- Internal messaging system: Allows users to send and view messages within the platform.
- User profile pages: Personalized profile pages for different user roles.
- Finance communication modules: Tools for internal finance users and guest communication.

## Technologies Used
- Frontend: ASP.NET Web Forms (.aspx, .aspx.cs)
- Backend: C#, ADO.NET
- Database: Microsoft SQL Server
- IDE: Visual Studio
- Configuration: Web.config

## Database Setup
The `SQL` folder contains the following scripts:
- `Tables.sql`: Defines all database tables and relationships
- `Insertions.sql`: Inserts data into the tables
- `Procedures.sql`: Adds stored procedures for core functions like registration and login

To set up the database:
1. Open SQL Server Management Studio.
2. Execute `Tables.sql`.
3. Execute `Insertions.sql`.
4. Execute `Procedures.sql`.

## How to Run
1. Open `Milestone3.sln` in Visual Studio.
2. Build the solution.
3. Run the project using IIS Express.
4. Use the login or registration pages to explore functionality by user type.
