<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportsList.aspx.cs" Inherits="CapstoneWebApp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="accordion" id="accordionReport">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="ReportsProjectDb">
            
            <AlternatingItemTemplate>
                
                <div class="card">
                    <div class="card-header">
                        <p class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#r<%# Eval("ReportID") %>r">                
                                <asp:Label ID="CreatedLabel" runat="server" Text='<%# Eval("Created") %>' />                
                            </button>
                                                        
                            <asp:Label ID="SummaryLabel" runat="server" Text='<%# Eval("Summary") %>' />                
                        </p>
                    </div>
                    <div id="r<%# Eval("ReportID") %>r" class="collapse" data-parent="#accordionReport">
                        <div class="card-body">
                            <p class="mb-0">
                                <span class="card-text-right">
                                Last Edited:
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Edited") %>' />
                                </span>
                                <br />
                                <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
                            </p>
                        </div>
                    </div>
                </div>
                
            </AlternatingItemTemplate>
            
            
            
            <ItemTemplate>
                 <div class="card">
                    <div class="card-header">
                        <p class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#r<%# Eval("ReportID") %>r">                
                                <asp:Label ID="CreatedLabel" runat="server" Text='<%# Eval("Created") %>' />                
                            </button>
                                                        
                            <asp:Label ID="SummaryLabel" runat="server" Text='<%# Eval("Summary") %>' />                
                        </p>
                    </div>
                    <div id="r<%# Eval("ReportID") %>r" class="collapse" data-parent="#accordionReport">
                        <div class="card-body">
                            <p class="mb-0">
                                <span class="card-text-right">
                                Last Edited:
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Edited") %>' />
                                </span>
                                <br />
                                <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
                            </p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div style="" id="itemPlaceholderContainer" runat="server">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="" class="text-center p-2">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">ReportID:
                <asp:Label ID="ReportIDLabel" runat="server" Text='<%# Eval("ReportID") %>' />
                <br />
                Created:
                <asp:Label ID="CreatedLabel" runat="server" Text='<%# Eval("Created") %>' />
                <br />
                Edited:
                <asp:Label ID="EditedLabel" runat="server" Text='<%# Eval("Edited") %>' />
                <br />
                Summary:
                <asp:Label ID="SummaryLabel" runat="server" Text='<%# Eval("Summary") %>' />
                <br />
                Content:
                <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
                <br />
                <br />
                </span>
            </SelectedItemTemplate>
            
        </asp:ListView>
        </div>
        <asp:SqlDataSource ID="ReportsProjectDb" runat="server" ConnectionString="<%$ ConnectionStrings:ReportsProjectDb %>" SelectCommand="spReport_WebAppGetAllReverseChron" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
   
</asp:Content>
