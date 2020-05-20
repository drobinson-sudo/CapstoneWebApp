# CapstoneWebApp

## An ASP.Net web app to view research progress reports

### Overview

This is **Part III** of a three-part group project for a Capstone course. My team mates were to research privacy and security needs for a fictitious company as relates to the new **Califronia Privacy Laws (CCPA)**. This ASP.Net app (and the related [**Winforms desktop app**](https://github.com/drobinson-sudo/DesktopReportsCapstone) was created for each team member to access reports on their own computers via the Internet.

Part I of this project was a SQL database using Azure SQL (for cloud storage.) Part II of this project was a compiled [**desktop app**](https://github.com/drobinson-sudo/DesktopReportsCapstone) to connect to the same database for creating, editing, and viewing of reports.

### Scope

The scope of this web app was to have the ability to view reports, in reverse chronological order, from a database of our choosing with some method of securing the data.

![Animated GIF of Web App](demo/capstone_webapp.gif)

### Of Special Note

I used ASP.net with authentication, and Entity Framework for ORM. The report data is from the same Azure SQL database as the Desktop Reports Capstone repository. However, the authentication and authorization data is on a separate database.  

EntityFramework calls parameterized stored procedures on the database to retrieve the report data. This webapp is "Read Only", meaning that as scoped, the app only needed to present data, not create or edit data. 

The admin feature of this web app allows for editing user information, creating roles, and adding roles to users. However, as this point there is really no need for additional roles as the only pages to access are the About page, the Reports page, and the Manage Accounts page (well, also there is a Privacy Policy page, but most people naturally stay away from there...)

### Conclusion

This is a somewhat simple web app (we were also graded on how close we stayed to our original scope documents from the beginning of the project.) Feel free to [**visit the live site**](https://capstonewebapp.azurewebsites.net/) and click around. You must register in order to view the reports, but anything that looks like an email address will work.
