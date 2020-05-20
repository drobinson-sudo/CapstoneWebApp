using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System.Web.ModelBinding;
using CapstoneWebApp.Models;

namespace CapstoneWebApp.Maintenance
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        ApplicationUserManager userMgr;
        ApplicationRoleManager roleMgr;

        protected void Page_Load(object sender, EventArgs e)
        {
            userMgr = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            roleMgr = Context.GetOwinContext().Get<ApplicationRoleManager>();
        }

        //Select Methods
        public IQueryable<IdentityRole> grdRoles_GetData()
        {
            return roleMgr.Roles;
        }
        public IQueryable<ApplicationUser> lsvUser_GetData()
        {
            return userMgr.Users;
        }
        public object dvRoles_GetItem([Control] string grdRoles)
        {
            if (grdRoles == null) return new IdentityRole();
            return (from r in roleMgr.Roles
                    where r.Id == grdRoles
                    select r).SingleOrDefault();
        }
        

        //Update methods
        public void lsvUsers_UpdateItem(string Id)
        {
            ApplicationUser user = (from u in userMgr.Users
                                    where u.Id == Id
                                    select u).SingleOrDefault();
            TryUpdateModel(user);
            user.UserName = user.Email;
            IdentityResult result = userMgr.Update(user);
            if (result.Succeeded) Reload();
        }
        public void grdRoles_UpdatItem(string Id)
        {
            IdentityRole role = (from r in roleMgr.Roles
                                 where r.Id == Id
                                 select r).SingleOrDefault();
            TryUpdateModel(role);
            IdentityResult result = roleMgr.Update(role);
            if (result.Succeeded) Reload();
        }
        public void dvRoles_UpdateItem(string Id)
        {
            IdentityRole role = (from r in roleMgr.Roles
                                 where r.Id == Id
                                 select r).SingleOrDefault();
            TryUpdateModel(role);
            IdentityResult result = roleMgr.Update(role);
            if (result.Succeeded) Reload();
        }


        //Insert methods
        public void  lsvUsers_InsertItem()
        {
            ApplicationUser user = new ApplicationUser();
            TryUpdateModel(user);
            user.UserName = user.Email;
            IdentityResult result = userMgr.Create(user);
            if (result.Succeeded) Reload();
        }
        public void dvRoles_InsertItem()
        {
            IdentityRole role = new IdentityRole();
            TryUpdateModel(role);
            IdentityResult result = roleMgr.Create(role);
            if (result.Succeeded) Reload();
        }


        //Delete Methods
        public void lsvUsers_DeleteItem(string Id)
        {
            ApplicationUser user = (from u in userMgr.Users
                                    where u.Id == Id
                                    select u).SingleOrDefault();
            IdentityResult result = userMgr.Delete(user);
            if (result.Succeeded) Reload();
        }
        public void dvRoles_DeleteItem(string Id)
        {
            IdentityRole role = (from r in roleMgr.Roles
                                  where r.Id == Id
                                  select r).SingleOrDefault();
            IdentityResult result = roleMgr.Delete(role);
            if (result.Succeeded) Reload();
        }


        


        //Helper methods
        public string ListRoles(ICollection<IdentityUserRole> userRoles)
        {
            IdentityRole role;
            var names = new List<string>();

            foreach (var ur in userRoles)
            {
                role = (from r in roleMgr.Roles
                        where r.Id == ur.RoleId
                        select r).SingleOrDefault();
                names.Add(role.Name);
            }
            return string.Join(",", names);
        }
        public void Reload()
        {
            lsvUsers.DataBind();
            grdRoles.DataBind();
            ddlUsers.DataBind();
            lstRoles.DataBind();
        }
        protected void GridView_PreRender(object sender, EventArgs e)
        {
            GridView grd = (GridView)sender;
            if (grd.HeaderRow != null)
                grd.HeaderRow.TableSection = TableRowSection.TableHeader;
        }


        //Add roles to user button
        protected void btnRoles_Click(object sender, EventArgs e)
        {
            string userID = ddlUsers.SelectedValue;
            foreach (ListItem item in lstRoles.Items)
            {
                //add role if user is not already added
                if (item.Selected)
                {
                    if (!userMgr.IsInRole(userID, item.Text))
                    {
                        userMgr.AddToRole(userID, item.Text);
                    }
                }
                //remove user from role if unselected
                else
                {
                    if (userMgr.IsInRole(userID, item.Text))
                    {
                        userMgr.RemoveFromRole(userID, item.Text);
                    }
                }
            }
            lsvUsers.DataBind();
        }
    }
}