<%@ Page Title="User Maintenance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserMaintenance.aspx.cs" Inherits="CapstoneWebApp.Maintenance.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>User and Role Maintenance</h1>

    <div class="accordion" id="accordionUsers">
    <asp:ListView ID="lsvUsers" runat="server" DataKeyNames="Id"
        SelectMethod="lsvUser_GetData" 
        ItemType="CapstoneWebApp.Models.ApplicationUser">
            <AlternatingItemTemplate>                
                <div class="card">
                    <div class="card-header">
                        <p class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#r<%# Item.Id %>r">                
                                <asp:Label ID="email" runat="server" Text='<%# Item.Email %>' />                
                            </button>                                                        
                            <asp:Label ID="userName" runat="server" Text='<%# Item.UserName %>' />                
                        </p>
                    </div>
                    <div id="r<%# Item.Id %>r" class="collapse" data-parent="#accordionUsers">
                        <div class="card-body">
                            <p class="mb-0">
                                <asp:Label ID="userRoles" runat="server" Text='<%# ListRoles(Item.Roles) %>' />
                            </p>
                        </div>
                    </div>
                </div>
            </AlternatingItemTemplate>

            <ItemTemplate>                
                <div class="card">
                    <div class="card-header">
                        <p class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#r<%# Item.Id %>r">                
                                <asp:Label ID="email" runat="server" Text='<%# Item.Email %>' />                
                            </button>                                                        
                            <asp:Label ID="userName" runat="server" Text='<%# Item.UserName %>' />                
                        </p>
                    </div>
                    <div id="r<%# Item.Id %>r" class="collapse" data-parent="#accordionUsers">
                        <div class="card-body">
                            <p class="mb-0">
                                <asp:Label ID="userRoles" runat="server" Text='<%# ListRoles(Item.Roles) %>' />
                            </p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
    </asp:ListView>
    </div>

     <div class="row mt-5"  >
         <div class="col-sm-6">
             <h2>Roles</h2>
             <asp:GridView ID="grdRoles" runat="server" DataKeyNames="Id"
                 AutoGenerateColumns="false" SelectMethod="grdRoles_GetData"
                 CssClass="table table-borderes table-striped table-condensed"
                 OnPreRender="GridView_PreRender">
                 <Columns>
                     <asp:BoundField HeaderText="Role Name" DataField="Name" />
                     <asp:CommandField ShowSelectButton ="true" />
                 </Columns>
             </asp:GridView>
             <asp:DetailsView ID="dvRoles" runat="server" DataKeyNames="Id"
                 AutoGenerateRows="false" CssClass="table table-bordered table-condensed"
                 SelectMethod="dvRoles_GetItem" UpdateMethod="dvRoles_UpdateItem"
                 InsertMethod="dvRoles_InsertItem" DeleteMethod="dvRoles_DeleteItem">
                 <Fields>
                     <asp:BoundField HeaderText="Role Name" DataField="Name" />
                     <asp:CommandField ShowEditButton="true" ShowInsertButton="true" ShowDeleteButton="true" />
                 </Fields>
             </asp:DetailsView>
         </div>
         <div class="col-sm-6">
             <h2>Add Roles to User</h2>
             <div class="form-group">
                 <label class="control-label">Select a user:</label>
                 <asp:DropDownList ID="ddlUsers" runat="server" SelectMethod="lsvUser_GetData"
                     DataValueField="Id" DataTextField="UserName" CssClass="form-control">
                 </asp:DropDownList>
             </div>
             <div class="form-group">
                 <label class="control-label">Add Role(s)</label>
                 <asp:ListBox ID="lstRoles" runat="server" SelectionMode="Multiple"
                     SelectMethod="grdRoles_GetData" DataValueField="Id"
                     DataTextField="Name" CssClass="form-control"></asp:ListBox>
             </div>
             <div class="form-group">
                 <asp:Button ID="btnAddRoles" runat="server" Text="Set Roles"
                     CssClass="btn btn-secondary" OnClick="btnRoles_Click" />
             </div>
         </div>
     </div>   
        
        
    
    
</asp:Content>
