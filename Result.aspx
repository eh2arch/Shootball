<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


<style type="text/css">

  .l
        {
            font-family:'Open Sans';
            font-size:x-large;
            line-height:4em;
            text-align:center;
            color:Teal;
        } 
        
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="table-responsive container" style="text-align:center;width:20%;padding-bottom:30px" >
    <asp:DropDownList ID="Drop_team" AutoPostBack="True" runat="server" 
            CssClass="form-control" style="font-size:larger;padding-left:80px;" 
            onselectedindexchanged="Drop_team_SelectedIndexChanged">
    </asp:DropDownList>
</div>

<center><div style="opacity:0.8">
     <asp:Label ID="Label_captain" class="alert alert-info" 
         style="width:40%;text-align:center;font-family:Open Sans;font-size:large;" 
         text="Please select your Captain!" runat="server"></asp:Label></div></center>

<center>
    <asp:GridView ID="GridView1" runat="server" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        AutoGenerateColumns="False" style="width:50%;margin-top:20px;background-color:rgba(255,255,255,0.8);padding-bottom:30px"
                 CssClass="table table-responsive table-striped table-hover l" 
        GridLines="None"  >
                 
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="check_changed" autopostback="true"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Name" DataField="pl_name">
            </asp:BoundField>
            <asp:BoundField HeaderText="Club" DataField="Club" />
            <asp:BoundField HeaderText="Position" DataField="pl_pos" />
            <asp:BoundField HeaderText="Cost" DataField="cost" />
        </Columns>
    </asp:GridView>
<asp:Button ID="button_result" runat="server" class="btn btn-lg btn-danger" 
        style="margin-top:140px;height:80px;width:320px;font-family:Open Sans;font-size:xx-large;opacity:0.8" 
        Text="Check out Result!" onclick="button_result_Click" 
        onclientclick="button_result_Click" Visible="false" />
<asp:Button ID="button_proceed" runat="server" class="btn btn-lg btn-primary" 
        style="height:80px;width:320px;font-family:Open Sans;font-size:xx-large;opacity:0.8" 
        Text="Proceed!" onclick="button_proceed_Click" 
        onclientclick="button_proceed_Click" />

</center>








</asp:Content>

