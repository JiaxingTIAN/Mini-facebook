<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Profilepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
     <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" style="background-color:#66CCFF;border-color:#66CCFF;text-align:center;padding-bottom:10px">
        <asp:Label ID="Label1" runat="server" Text="Welcome to Connect BU" Font-Bold="True" Font-Size="XX-Large" Font-Names="Arial Black" ForeColor="White"></asp:Label><br />
        <asp:Button ID="SignOut" runat="server" Text="Sign Out" class="head" OnClick="SignOut_Click" ForeColor="White" Font-Bold="True"/>
        <asp:Button ID="Delete" runat="server" Text="Delete Profile" class="head" ForeColor="White" Font-Bold="True" OnClick="Delete_Click"/>
        <asp:Button ID="Edit" runat="server" Text="Eidt Profile" class="head" ForeColor="White" Font-Bold="True" OnClick="Edit_Click"/>
        
        <asp:Button ID="Create" runat="server" Text="Create Profile" class="head" ForeColor="White" Font-Bold="True" OnClick="Create_Click"/>
        <asp:Button ID="DeleteA" runat="server" Text="Delete Account" class="head" ForeColor="White" Font-Bold="True" OnClick="DeleteA_Click"/>
        <asp:Button ID="SignIn" runat="server" Text="Sign In/Create Account" class="head" ForeColor="White" Font-Bold="True" OnClick="SignIn_Click"/>
    </div>
    <div class="general">
        <div class="container" style="float:left;width:150px;text-align:center">

            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="email" DataValueField="userID" Width="150px" Height="415px" Font-Names="Berlin Sans FB"></asp:ListBox>
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Display Profile" class ="gbutton" OnClick="Button1_Click"/>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Profile]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Profile] WHERE ([userID] = @myId)" DeleteCommand="DELETE FROM Profile WHERE ([userID] = @id)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="HiddenField1" Name="id" PropertyName="Value" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField2" Name="myId" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [User] WHERE ([Id] = @Id)" DeleteCommand="DELETE FROM [User] WHERE ([Id] = @myid)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="HiddenField1" Name="myid" PropertyName="Value" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" Name="Id" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:HiddenField ID="action" runat="server" />
        <asp:HiddenField ID="HiddenField2" runat="server" />
        <div class="container" style="margin-left:220px;width:630px" >
            <asp:Label ID="Label2" runat="server" Text="Label" Font-Size="X-Large"></asp:Label><br /><br />
            <asp:Label ID="Label7" runat="server" Text="Label" Width="100px" >First Name:</asp:Label>
        <asp:TextBox ID="FirstName" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" ReadOnly="True"></asp:TextBox><br /><br />
        <asp:Label ID="Label8" runat="server" Text="Label" Width="100px">Last Name:</asp:Label>
        <asp:TextBox ID="LastName" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" ReadOnly="True"></asp:TextBox><br /><br />
        <asp:Label ID="Label9" runat="server" Text="Label" Width="100px">Gender:</asp:Label>
        <asp:TextBox ID="Gender" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" ReadOnly="True"></asp:TextBox><br /><br />
        <asp:Label ID="Label14" runat="server" Text="Label" Width="100px">Birthday:</asp:Label>
        <asp:TextBox ID="Birthday" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" ReadOnly="True"></asp:TextBox><br /><br />
        <asp:Label ID="Label10" runat="server" Text="Label" Width="100px" >Contry:</asp:Label>
        <asp:TextBox ID="Country" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" ReadOnly="True"></asp:TextBox><br /><br />
        <asp:Label ID="Label11" runat="server" Text="Label" Width="100px">State:</asp:Label>
        <asp:TextBox ID="State" runat="server" Width="100px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" ReadOnly="True"></asp:TextBox><br /><br />
        <asp:Label ID="Label12" runat="server" Text="Label" Width="100px" >Address Line:</asp:Label>
        <asp:TextBox ID="Address" runat="server" Width="200px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" ReadOnly="True"></asp:TextBox><br /><br />
        <asp:Label ID="Label13" runat="server" Text="Label" Width="100px">Phone:</asp:Label>
        <asp:TextBox ID="Phone" runat="server" Width="200px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" ReadOnly="True"></asp:TextBox><br /><br />
        <asp:Label ID="Label3" runat="server" Text="Label" Width="100px">Email:</asp:Label>
        <asp:TextBox ID="Email" runat="server" Width="200px" style="border-radius:5px;padding:5px;border: 1px solid #CCC;" ReadOnly="True"></asp:TextBox><br /><br />
        
        </div>
        <asp:Panel runat="server" ID="MegBox" CssClass="container ontop" Visible="false" Font-Size="Large" Width="260px" Height="100px">
        <asp:Label ID="Meg" runat="server" Text="Label"></asp:Label><br /><br />
        <asp:Button ID="Button5" runat="server" Text="OK" class="gbutton" width="100px" OnClick="Button5_Click"/>
            <asp:Button ID="Button6" runat="server" Text="Cancel" class="gbutton" style="margin-left:20px" Width="100px" OnClick="Button6_Click"/>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
