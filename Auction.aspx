<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Auction.aspx.cs" Inherits="Auction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<style type="text/css">
        .style2
        {
            width: 736px;
        }
    </style>--%>
    <style type="text/css">
    td
    {
        font-family:'Open Sans';
        font-size:x-large;
    }

    td .l
    {
        line-height:4.2em;
        text-align:center;
        width:50%;
        height:20%;
        color:Teal;
    }
    .tcent
    {
        height:70%;margin-top:6%
    }
 
    ::-webkit-input-placeholder 
    {
        padding-right:5px;
        padding-bottom:1px;
        font-size:larger;
       text-align: right;
 
    }
 
    :-moz-placeholder 
    {
        padding-bottom:1px;
        font-size:larger;
        padding-right:5px;
       text-align: right;
 
    }
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<div class="table-responsive container">--%>

    <center><table class="table table-condensed table-responsive table-striped table-hover" style="width:50%;background-color:rgba(255,255,255,0.8);height:500px;">
       <tbody>
        <tr>
            <td class="l" style="line-height:4em;">POSITION
            </td>
            <td style="padding-right:20px">
                <asp:DropDownList ID="Drop_Pos" cssclass="form-control" style="height:60%;margin-top:8%;color:Teal"  runat="server" AutoPostBack="True" 
                    onselectedindexchanged="Drop_Pos_SelectedIndexChanged" >
                    <asp:ListItem>Select Position</asp:ListItem>
                    <asp:ListItem Value="M">Midfielder</asp:ListItem>
                    <asp:ListItem Value="S">Striker</asp:ListItem>
                    <asp:ListItem Value="D">Defender</asp:ListItem>
                    <asp:ListItem Value="G">Goalkeeper</asp:ListItem>
                </asp:DropDownList>
            
            </td>
        </tr>
        <tr>
            <td class="l" style="line-height:4em;">
                PLAYER</td>
            <td style="padding-right:20px">
                <asp:DropDownList ID="Drop_Player" style="height:60%;margin-top:8%;color:Teal"  cssclass="form-control" runat="server">
                    <asp:ListItem>Select Player</asp:ListItem>
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td class="l" style="line-height:4em;">
                TEAM</td>
            <td style="padding-right:20px">
                <asp:DropDownList style="height:60%;margin-top:8%;color:Teal" cssclass="form-control" ID="Drop_Team" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="Drop_Team_SelectedIndexChanged">
                    <asp:ListItem>Select Team</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Label_Team" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="l" style="line-height:4em;">
                COST</td>
            <td style="padding-right:20px">
                <asp:TextBox ID="Text_Cost" style="margin-top:9%;color:Teal"  runat="server"  AutoPostBack="True" 
                    CausesValidation="True" ontextchanged="Text_Cost_TextChanged" placeholder="million ₤"
                    CssClass="form-control"></asp:TextBox>
                <asp:Label ID="Label_Cost" runat="server" 
                    Text="Please enter a number between 1 and 100" Visible="False" style="font-size:medium"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-right:20px"><div style="text-align:right">
                <asp:Button ID="Button_Player_Add" runat="server" style="margin-top:3%;height:45px;text-align:center;font-size:medium"  class="btn btn-success"
                    onclick="Button_Player_Add_Click" Text="Add Player" required autofocus />
                   </div>
            </td>   
            <td style="padding-left:20px;" >
                <asp:Button ID="Button_Reset" style="margin-top:3%;height:45px;width:90px;font-size:medium"  runat="server" class="btn btn-danger" onclick="Button_Reset_Click" 
                    Text="Reset" />
                <br />
            </td>
        </tr>
       </tbody>
    </table>
    </center>
    </div>
</asp:Content>

