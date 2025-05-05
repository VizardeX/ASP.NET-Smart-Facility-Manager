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
