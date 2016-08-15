using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Private_Default : System.Web.UI.Page
{
    bool exist = false;
    protected void Page_Load(object sender, EventArgs e)
    {

            HiddenField2.Value = User.Identity.Name;

            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataView dv1 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            DataRow row1 = dv1.Table.Rows[0];
            HiddenField3.Value = (string)row1["Email"];
            if (dv.Table.Rows.Count == 0)
            {
                //Not exist
                exist = false;
                return;
            }
            exist = true;


    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //insert profile
        if (RadioButton1.Checked)
            HiddenField1.Value = "Male";
        else if (RadioButton2.Checked)
            HiddenField1.Value = "Female";
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
        if (exist == true)
        {
            SqlDataSource1.Delete();
        }
        
        
            SqlDataSource1.Insert();
        

        //redirect to profile page
        Response.Redirect("../Default.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        MegBox.Visible = false;
        Meg.Text = "";
    }

}