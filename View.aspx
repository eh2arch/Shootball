 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 407px;
        }
        .style3
        {
            height: 26px;
        }
        
        .gr
        {
            text-align:center;
            margin-left:100%;
        }
        
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
    <asp:DropDownList ID="Drop_teamview" AutoPostBack="True" runat="server" 
            CssClass="form-control" style="font-size:larger;padding-left:80px;" 
            onselectedindexchanged="Drop_teamview_SelectedIndexChanged">
                        <asp:ListItem>Team 1</asp:ListItem>
                        <asp:ListItem>Team 2</asp:ListItem>
                        <asp:ListItem>Team 3</asp:ListItem>
                        <asp:ListItem>Team 4</asp:ListItem>
                        <asp:ListItem>Team 5</asp:ListItem>
                        <asp:ListItem>Team 6</asp:ListItem>
                        <asp:ListItem>Team 7</asp:ListItem>
                        <asp:ListItem>Team 8</asp:ListItem>


    </asp:DropDownList>
    </div>
    <center>





  <div style="font-family:Open Sans;font-size:xx-large;opacity:0.8"><span class="label label-info" >

            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
            <asp:Literal ID="Literal3" runat="server"></asp:Literal>
            <asp:Literal ID="Literal4" runat="server"></asp:Literal>
    
    </span><p>
    </div> 
    
   
    
     
             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" 
                GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                PageSize="5" onpageindexchanging="GridView1_PageIndexChanging"
                style="width:50%;margin-top:20px;background-color:rgba(255,255,255,0.8);"
                 CssClass="table table-condensed table-responsive table-striped table-hover l">
                <%--<AlternatingRowStyle BackColor="White" />--%>
                <Columns>
               
                    <asp:BoundField DataField="pl_name" HeaderText="NAME">
                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Club" HeaderText="CLUB" />
                    <asp:BoundField DataField="pl_pos" HeaderText="POSITION" />
                    <asp:BoundField DataField="cost" HeaderText="COST" />
                </Columns>
                <PagerStyle HorizontalAlign="Center" Font-Size="25px"/>
                <%--<EditRowStyle BackColor="#2461BF" />--%>
                 <FooterStyle HorizontalAlign="Center"/>
                 <HeaderStyle HorizontalAlign="Center" Font-Bold="false" CssClass="gr"/>
               <%-- <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>--%>
                <%--<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />--%>
                <%--<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />--%>
               <%-- <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />--%>
            </asp:GridView>
    </center>


<%--

    <table style="height: 198px; width: 110%">
    <tr>
        <td rowspan="2" class="style2">

            <asp:Panel ID="Teams" runat="server" Width="273px" GroupingText="Teams" 
                Height="182px">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Width="260px" 
                    Height="160px" onselectedindexchanged="ListBox1_SelectedIndexChanged">
                    <asp:ListItem>Team 1</asp:ListItem>
                    <asp:ListItem>Team 2</asp:ListItem>
                    <asp:ListItem>Team 3</asp:ListItem>
                    <asp:ListItem>Team 4</asp:ListItem>
                    <asp:ListItem>Team 5</asp:ListItem>
                    <asp:ListItem>Team 6</asp:ListItem>
                    <asp:ListItem>Team 7</asp:ListItem>
                    <asp:ListItem>Team 8</asp:ListItem>
                </asp:ListBox>
            </asp:Panel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td class="style3">
            <%--<asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
            <asp:Literal ID="Literal3" runat="server"></asp:Literal>
            <asp:Literal ID="Literal4" runat="server"></asp:Literal>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;
            <div class="table-responsive container">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                PageSize="5" onpageindexchanging="GridView1_PageIndexChanging"
                class="table table-responsive table-hover"
                
                >
            </div>
        </td>
    </tr>
    </table>--%>


<center><div style="padding-top:100px;opacity:0.8">
     <asp:Label ID="Label_nopl" class="alert alert-danger" style="width :40%;text-align:center;font-family:Open Sans;font-size:large;" text="Oops! You have not selected any players yet!" runat="server" Visible="false"></asp:Label></div></center>

</asp:Content>

