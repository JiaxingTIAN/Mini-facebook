using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Profilepage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == false)
        {
            SignOut.Visible = false;
            Create.Visible = false;
            Edit.Visible = false;
            Delete.Visible = false;
            Label2.Text = "You can browse profile as guest.";
            DeleteA.Visible = false;
            return;
        }
        Create.Visible = false;
        SignIn.Visible = false;
        HiddenField1.Value = User.Identity.Name;
        HiddenField2.Value = User.Identity.Name;
        displayProfile();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        HiddenField2.Value = ListBox1.SelectedValue.ToString();
        displayProfile();
    }

    protected void SignOut_Click(object sender, EventArgs e)
    {
        Meg.Text = "Click OK to sign out.";
        MegBox.Visible = true;
        action.Value = "3";
    }

    protected void Create_Click(object sender, EventArgs e)
    {
        Response.Redirect("Private/Default.aspx");
    }

    protected void Edit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Private/Default.aspx");
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        Meg.Text = "Click OK to delete profile.";
        action.Value = "1";
        MegBox.Visible = true;
    }
    //function to display the profile of selected user
    public void displayProfile()
    {
        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count == 0)
        {
            Create.Visible = true;
            Delete.Visible = false;
            Edit.Visible = false;
            Label2.Text = "No Profile Exist.";
            return;
        }
        DataRow row = dv.Table.Rows[0];
        string firstName = (string)row["FirstName"];
        
        Label2.Text = "Welcome to " + firstName + "'s Profile.";
        FirstName.Text = firstName;
        LastName.Text = (string)row["LastName"];
        Gender.Text = (string)row["Gender"];
        Address.Text = (string)row["AddressLine"];
        State.Text = (string)row["State"];
        Country.Text = (string)row["Country"];
        Email.Text = (string)row["email"];
        Phone.Text = (string)row["phone"];
        DateTime boa = (DateTime)row["Birthday"];
        Birthday.Text = boa.ToShortDateString();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        if (action.Value == "1")    //delete profile
        {
            SqlDataSource2.Delete();
        }
        else if(action.Value == "2")    //delete account
        {
            SqlDataSource3.Delete();
            FormsAuthentication.SignOut();
            
        }
        else if(action.Value == "3")
        {
            FormsAuthentication.SignOut();
        }
        else
        {
            Meg.Text = "Error." + action;
            return;
        }    
        MegBox.Visible = false;
        Response.Redirect("Default.aspx");
    }

    protected void SignIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    //delete account button
    protected void DeleteA_Click(object sender, EventArgs e)
    {
        action.Value = "2";
        Meg.Text = "Click OK to delete Account.";
        MegBox.Visible = true;
    }

    //Cancel the action
    protected void Button6_Click(object sender, EventArgs e)
    {
        MegBox.Visible = false;
    }
}