<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CapstoneWebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    

    <div class="row">
        <div class="card-deck">
        <!--<div class="col-md-4" style="left: -4px; "> -->
            
            <div class="card">
                <div class="card-header">
                    <h2>Getting started</h2>
                </div>
                <div class="card-body">
                    <p>
                     Project Reports is a web-driven interface to review weekly progress reports within the organization's project teams. Get started by reviewing the documentation.
                    </p>                    
                </div>
                <div class="card-footer text-center pb-0">
                    <p>
                    <a class="btn btn-secondary mx-auto" href="About.aspx">Learn more &raquo;</a>
                    </p>
                </div>
            </div>
            
        <!--</div> -->
        <!--<div class="col-md-4">-->
            <div class="card shadow p-1">
                <div class="card-header">
                    <h2>Reports</h2>
                </div>
                <div class="card-body">
                    <p>
                        Begin reviewing reports now.
                    </p>                    
                </div>
                <div class="card-footer text-center pb-0">
                    <p>
                        <a class="btn btn-primary mx-auto" href="ReportsList.aspx">Reports &raquo;</a>
                    </p>
                </div>
            </div>
        <!--</div>-->
        <!--<div class="col-md-4">-->
            <div class="card">
                <div class="card-header">
                    <h2>Manage Users</h2>
                </div>
                <div class="card-body">
                    <p>
                        Administrators manage roles and permissions for using this app.
                    </p>                    
                </div>
                <div class="card-footer text-center pb-0">
                    <p>
                        <a class="btn btn-secondary" href="Maintenance/UserMaintenance.aspx">Manage Users &raquo;</a>
                    </p>
                </div>
            </div>
        <!--</div>-->
        </div>
    </div>

</asp:Content>
