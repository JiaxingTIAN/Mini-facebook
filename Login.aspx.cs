using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        try  //catches blank User name
        {
            HiddenField1.Value = LoginEmail.Text;
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Table.Rows.Count == 0)
            {
                MegBox.Visible = true;
                Meg.Text = "The Account does not exist.";

                return;
            }
            string hashpass = FormsAuthentication.HashPasswordForStoringInConfigFile(LoginPass.Text, "SHA1");
            DataRow row = dv.Table.Rows[0];
            string temppass = (string)row["Password"];
            string id = "" + (int)row["Id"];
            if (temppass == hashpass)
            {
                //authenticated
                FormsAuthentication.RedirectFromLoginPage(id, false);
                return;
            }
            else {
                MegBox.Visible = true;
                Meg.Text = "Password not correct.";
 
                return;
            }
        }
        catch
        {
            //Not authenticated
            MegBox.Visible = true;
            Meg.Text = "Not authenticated";
        }
        

    }

    protected void RegButton_Click(object sender, EventArgs e)
    {

        if (regEmail.Text == "")
        {
            status.Text = "Please enter a email.";
            return;
        }

        if (regPw.Text == "" || rePw.Text == "")
        {
            status.Text = "Please enter a password and re-enter it.";
            return;
        }

        if (regPw.Text != rePw.Text)
        {
            status.Text = "Passwords do not match";
            return;
        }

        //Validate password length or characters (optional)
        if (regPw.Text.Length < 6)
        {
            status.Text = "Enter a password at least six characters.";
            return;
        }

        //Check that the user is not in the database
        HiddenField1.Value = regEmail.Text;
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count != 0)
        {
            status.Text = "Email already exists.";
            return;
        }

        //Add user
        hashPass.Value = FormsAuthentication.HashPasswordForStoringInConfigFile(regPw.Text, "SHA1");
        SqlDataSource1.Insert();
        status.Text = "User Added";

        Panel1.Visible = false;
        Panel2.Visible = true;

    }
    //Create Profile
    protected void Button3_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        DataRow row = dv.Table.Rows[0];
        string id = "" + (int)row["Id"];
        HiddenField3.Value = id;
        //insert profile
        if (RadioButton1.Checked)
            HiddenField2.Value = "Male";
        else if (RadioButton2.Checked)
            HiddenField2.Value = "Female";
        else
        {
            Meg.Text = "Please select gender.";
            MegBox.Visible = true;
            return;
        }
            

        if (FirstName.Text == "" || LastName.Text == "" || Address.Text == "" || State.Text == "" || Country.Text == "" || Phone.Text == "" || Birthday.Text == "")
        {
            Meg.Text = "Please fill in all the field.";
            MegBox.Visible = true;
            return;
        }

        SqlDataSource2.Insert();
        //redirect to profile page

        FormsAuthentication.RedirectFromLoginPage(id, false);
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //redirect to profile page
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        DataRow row = dv.Table.Rows[0];
        string id = "" + (int)row["Id"];
        FormsAuthentication.RedirectFromLoginPage(id, false);
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        MegBox.Visible = false;
        Meg.Text = "";
        LoginEmail.Text = "";
        LoginPass.Text = "";
    }
}