<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Private_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="container">
            <asp:Label ID="Label2" runat="server" Text="Fill in the form to complete." Font-Size="X-Large"></asp:Label><br /><br />
            <asp:Label ID="Label7" runat="server" Text="Label" Width="100px" >First Name:</asp:Label>
        <asp:TextBox ID="FirstName" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;"></asp:TextBox><br /><br />
        <asp:Label ID="Label8" runat="server" Text="Label" Width="100px">Last Name:</asp:Label>
        <asp:TextBox ID="LastName" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;"></asp:TextBox><br /><br />
        <asp:Label ID="Label9" runat="server" Text="Label" Width="100px">Gender:</asp:Label>
        <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" Width="85px" GroupName="Gender"/>
        <asp:RadioButton ID="RadioButton2" runat="server" Text="Female" Width="85px" GroupName="Gender"/>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Profile WHERE ([userID] = @id)" SelectCommand="SELECT * FROM [Profile] WHERE([userID] = @id)" InsertCommand="INSERT INTO Profile(FirstName,LastName,Gender,AddressLine,State,Country,phone,Birthday,userID,email) 
VALUES (@firstname,@lastname,@gender,@address,@state,@country,@newphone,@boa,@myID,@newEmail)" UpdateCommand="UPDATE Profile SET FirstName = @firstName, LastName = @lastName, Gender = @gender, AddressLine = @addr, State = @state, Country = @country, phone = @newPhone, Birthday = @boa, email = @Newemail WHERE (userID = @id)" UpdateCommandType="StoredProcedure">
            <InsertParameters>
                <asp:ControlParameter ControlID="FirstName" Name="firstname" PropertyName="Text" />
                <asp:ControlParameter ControlID="LastName" Name="lastname" PropertyName="Text" />
                <asp:ControlParameter ControlID="HiddenField1" Name="gender" PropertyName="Value" />
                <asp:ControlParameter ControlID="Address" Name="address" PropertyName="Text" />
                <asp:ControlParameter ControlID="State" Name="state" PropertyName="Text" />
                <asp:ControlParameter ControlID="Country" Name="country" PropertyName="Text" />
                
                <asp:ControlParameter ControlID="Phone" Name="newphone" PropertyName="Text" />
                <asp:ControlParameter ControlID="Birthday" Name="boa" PropertyName="Text" />
                <asp:ControlParameter ControlID="HiddenField2" Name="myID" PropertyName="Value" />
                <asp:ControlParameter ControlID="HiddenField3" Name="newEmail" PropertyName="Value" />
            </InsertParameters>
                <DeleteParameters>
                    <asp:ControlParameter ControlID="HiddenField2" Name="id" PropertyName="Value" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="HiddenField2" Name="id" PropertyName="Value" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="FirstName" Name="firstName" PropertyName="Text" />
                    <asp:ControlParameter ControlID="LastName" Name="lastName" PropertyName="Text" />
                    <asp:ControlParameter ControlID="HiddenField1" Name="gender" PropertyName="Value" />
                    <asp:ControlParameter ControlID="Address" Name="addr" PropertyName="Text" />
                    <asp:ControlParameter ControlID="State" Name="state" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Country" Name="country" PropertyName="Text" />
                    <asp:ControlParameter ControlID="HiddenField3" Name="Newemail" PropertyName="Value" />
                    <asp:ControlParameter ControlID="Phone" Name="newPhone" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Birthday" Name="boa" PropertyName="Text" />
                    <asp:ControlParameter ControlID="HiddenField2" Name="id" PropertyName="Value" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="HiddenField2" runat="server"  />
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
        <asp:Button ID="Button1" runat="server" Text="Complete" class="gbutton" OnClick="Button1_Click" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [User] WHERE ([Id]=@id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField2" Name="id" PropertyName="Value" />
            </SelectParameters>
            </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField3" runat="server" />
        </div>
        <asp:Panel runat="server" ID="MegBox" CssClass="container ontop" Visible="false" Font-Size="Large" Width="260px" Height="100px">
            <asp:Label ID="Meg" runat="server" Text="Label"></asp:Label><br /><br />
            <asp:Button ID="Button5" runat="server" Text="OK" class="gbutton" width="100px" OnClick="Button5_Click"/>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
