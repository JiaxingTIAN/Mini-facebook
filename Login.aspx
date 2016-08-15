<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id, Email, Password, Role FROM [User] WHERE (Email = @email)" InsertCommand="INSERT INTO [User](Email, Password) VALUES ( @email , @password)">
        <InsertParameters>
            <asp:ControlParameter ControlID="regEmail" Name="email" PropertyName="Text" />
            <asp:ControlParameter ControlID="hashPass" Name="password" PropertyName="Value" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="email" PropertyName="Value" />
        </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Profile]" InsertCommand="INSERT INTO Profile(FirstName,LastName,Gender,AddressLine,State,Country,email,phone,Birthday,userID) 
VALUES (@firstname,@lastname,@gender,@address,@state,@country,@newemail,@newphone,@boa,@myID)">
            <InsertParameters>
                <asp:ControlParameter ControlID="FirstName" Name="firstname" PropertyName="Text" />
                <asp:ControlParameter ControlID="LastName" Name="lastname" PropertyName="Text" />
                <asp:ControlParameter ControlID="HiddenField2" Name="gender" PropertyName="Value" />
                <asp:ControlParameter ControlID="Address" Name="address" PropertyName="Text" />
                <asp:ControlParameter ControlID="State" Name="state" PropertyName="Text" />
                <asp:ControlParameter ControlID="Country" Name="country" PropertyName="Text" />
                <asp:ControlParameter ControlID="HiddenField1" Name="newemail" PropertyName="Value" />
                <asp:ControlParameter ControlID="Phone" Name="newphone" PropertyName="Text" />
                <asp:ControlParameter ControlID="Birthday" Name="boa" PropertyName="Text" />
                <asp:ControlParameter ControlID="HiddenField3" Name="myID" PropertyName="Value" />
            </InsertParameters>
        </asp:SqlDataSource>
    <div class =" container" style="margin-top:100px">
        <h1 style="text-align:center">Welcome to Connect BU</h1>
        <div style="padding:20px; width: 500px; margin:auto;Font-Size:20px">

            <asp:Label ID="Label1" runat="server" Text="Label">Sign in</asp:Label><br /><br />
            <asp:Label ID="Label2" runat="server" Text="Label" Width="100px" >Email:</asp:Label>
            <asp:TextBox ID="LoginEmail" runat="server" Width="200px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" TextMode="Email"></asp:TextBox><br /><br />
            <asp:Label ID="Label3" runat="server" Text="Label" Width="100px">Password:</asp:Label>
            <asp:TextBox ID="LoginPass" runat="server" Width="200px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" TextMode="Password"></asp:TextBox><br /><br />
            <asp:Button ID="LoginButton" runat="server" Text="Login" class="gbutton" Width="150px" OnClick="LoginButton_Click" Font-Size="16px" /><br /><br />
            or<br /><br />
            <asp:Button ID="Button1" runat="server" Text="Create an account" class="gbutton" Width="150px" OnClick="Button1_Click" Font-Size="16px" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
       
    </div>
    <asp:Panel ID="Panel1" runat="server" CssClass="container ontop" Visible="False" Font-Size="20px" Height ="300px">
        Please enter the email and password to continue<br /><br />

        <asp:Label ID="Label4" runat="server" Text="Label" Width="100px" >Email:</asp:Label>
        <asp:TextBox ID="regEmail" runat="server" Width="200px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" TextMode="Email"></asp:TextBox><br /><br />
        <asp:Label ID="Label5" runat="server" Text="Label" Width="100px">Password:</asp:Label>
        <asp:TextBox ID="regPw" runat="server" Width="200px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" TextMode="Password"></asp:TextBox><br /><br />
        <asp:Label ID="Label6" runat="server" Text="Label" Width="100px">Comfirm Password:</asp:Label>
        <asp:TextBox ID="rePw" runat="server" Width="200px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" TextMode="Password"></asp:TextBox><br /><br />
        <asp:Label ID="status" runat="server" Text=""></asp:Label><br /><br />
        <asp:Button ID="Button2" runat="server" Text="Continue" class="gbutton" Width="150px" OnClick="RegButton_Click" Font-Size="16px" />
        <asp:HiddenField ID="hashPass" runat="server" />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" CssClass="container ontop" Visible="False" Font-Size="20px">
        Fill in the information below to create profile<br /><br />
        <asp:Label ID="Label7" runat="server" Text="Label" Width="100px" >First Name:</asp:Label>
        <asp:TextBox ID="FirstName" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;"></asp:TextBox><br /><br />
        <asp:Label ID="Label8" runat="server" Text="Label" Width="100px">Last Name:</asp:Label>
        <asp:TextBox ID="LastName" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;"></asp:TextBox><br /><br />
        <asp:Label ID="Label9" runat="server" Text="Label" Width="100px">Gender:</asp:Label>
        <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" Width="85px" GroupName="Gender"/>
        <asp:RadioButton ID="RadioButton2" runat="server" Text="Female" Width="85px" GroupName="Gender"/>
        <asp:HiddenField ID="HiddenField2" runat="server" />
        <asp:HiddenField ID="HiddenField3" runat="server" />
        <br /><br />
        <asp:Label ID="Label14" runat="server" Text="Label" Width="100px">Birthday:</asp:Label>
        <asp:TextBox ID="Birthday" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" TextMode="Date"></asp:TextBox><br /><br />
        <asp:Label ID="Label10" runat="server" Text="Label" Width="100px" >Contry:</asp:Label>
        <asp:TextBox ID="Country" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;"></asp:TextBox><br /><br />
        <asp:Label ID="Label11" runat="server" Text="Label" Width="100px">State:</asp:Label>
        <asp:TextBox ID="State" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;"></asp:TextBox><br /><br />
        <asp:Label ID="Label12" runat="server" Text="Label" Width="100px" >Address Line:</asp:Label>
        <asp:TextBox ID="Address" runat="server" Width="200px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;"></asp:TextBox><br /><br />
        <asp:Label ID="Label13" runat="server" Text="Label" Width="100px">Phone:</asp:Label>
        <asp:TextBox ID="Phone" runat="server" Width="200px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" TextMode="Number"></asp:TextBox><br /><br />
        
        <asp:Button ID="Button3" runat="server" Text="Create Profile" class="gbutton" Width="150px" OnClick="Button3_Click" Font-Size="16px" />
        <asp:Button ID="Button4" runat="server" Text="Skip" class="gbutton" Width="150px" OnClick="Button4_Click" Font-Size="16px" />
    </asp:Panel>
    <asp:Panel runat="server" ID="MegBox" CssClass="container ontop" Visible="false" Font-Size="Large" Width="260px" Height="100px">
        <asp:Label ID="Meg" runat="server" Text="Label"></asp:Label><br /><br />
        <asp:Button ID="Button5" runat="server" Text="OK" class="gbutton" width="100px" OnClick="Button5_Click"/>
    </asp:Panel>
    </form>
</body>
</html>
