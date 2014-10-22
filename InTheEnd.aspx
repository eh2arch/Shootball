<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InTheEnd.aspx.cs" Inherits="InTheEnd" %>

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

<center>
<div style="font-family:Open Sans;font-size:xx-large;opacity:0.8"><span class="label label-info" >
Scoreboard!          
    </span><p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="width:30%;margin-top:60px;background-color:rgba(255,255,255,0.8);font-size:25px;text-align=middle"
                 CssClass="table table-responsive table-condensed table-striped table-hover l" 
        GridLines="None">
            <Columns>
                <asp:BoundField DataField="TEAM"  HeaderText="TEAM"/>
                <asp:BoundField DataField="TOTAL" HeaderText="POINTS" />
            </Columns>
            <HeaderStyle HorizontalAlign="Center" />
            
        </asp:GridView>
    </div>
    </center>

</asp:Content>

