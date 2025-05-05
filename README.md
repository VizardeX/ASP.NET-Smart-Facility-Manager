# ASP.NET Smart Facility Manager (HomeSync)

## Overview
**HomeSync** is a role-based web application built using ASP.NET Web Forms. It functions as a virtual assistant platform designed to help users manage home-related tasks and routines. It supports multiple user types (Admins and Guests), providing tools to organize schedules, monitor health and finances, manage rooms and devices, communicate internally, and more.

## Features
- **Authentication and User Roles**: Admins and Guests with distinct capabilities.
- **Task Management**: Create and track tasks with deadlines, priorities, and status updates.
- **Calendar and Reminders**: Manage schedules and receive personalized notifications.
- **Notes**: Record and organize daily notes with timestamps.
- **Travel Tracking**: Save and access trip details including flights and hotel reservations.
- **Financial Management**: Record and track payments made or received, with deadlines and statuses.
- **Health Tracking**: Log daily activity, sleep, and food consumption to monitor well-being.
- **Messaging System**: Send and receive internal messages across users.
- **Room and Device Control**: Monitor usage, availability, and status of smart devices and rooms.
- **Room Activity Scheduling**: Automate room-based tasks like lighting or device usage.
- **Logs**: Track user interactions with rooms and devices for auditing.
- **Personalized Recommendations**: Suggest actions or insights based on user preferences.
- **Energy Monitoring**: Collect data on energy consumption (e.g., kWh) to optimize usage.
- **Home Inventory**: Track household items, manage stock levels, and build shopping lists.
- **Security Camera Monitoring**: View room-specific camera feeds for home surveillance.

## Database Setup
The `/SQL` folder includes:
- `Tables.sql` – Creates the database schema and relationships
- `Insertions.sql` – Fills the system with some users, rooms, devices, and other starting data to help test and explore the platform
- `Procedures.sql` – Defines stored procedures for user registration, login, and other actions
  
## Technologies Used
- **Frontend**: ASP.NET Web Forms (`.aspx`, `.aspx.cs`)
- **Backend**: C#, ADO.NET
- **Database**: Microsoft SQL Server
- **Scripts**: SQL (`Tables.sql`, `Insertions.sql`, `Procedures.sql`)
- **Configuration**: `Web.config`, stored procedures, connection strings


