<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CapstoneWebApp.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About Capstone Reports</h2>
    
    <p>Capstone Reports is a web app designed for viewing research reports submitted by the team members of the research project.<br />

Users must register (or log in) to view the reports.<br />

Admin users have "user management" priveleges, where users' login information can be edited and roles can be created and assigned to users.<br />

Once logged in, users are able to view the reports of the research team.<br /><br /></p>
        <hr />


<h3>Reporting App Architecture</h3>
<div class="row">
    
<asp:Image runat="server" ImageUrl="~/Images/Network.png" />
</div>       

        <br /><br />


<p>Data is stored in a SQL database hsoted on Azure Services. The data is only able to be accessed through "paramaterized" stored procedures. <br />

Reports are created and edited via a compiled desktop app which connects to the SQL database. All team members may have the app installed on their computers and have access to the same database at once.<br />

The web app allows for viewing of the reports, but not edits or deletes.</p>
</asp:Content>
