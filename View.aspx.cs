using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class View : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Server=ARCH; database=demo; uid=sa;pwd=sql");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            fillgrid();
    }
    void fillgrid()
    {
        Label_nopl.Visible = false;
        con.Open();
        string query = "select sum(Total) from defenders group by team having team='" + (int)(Drop_teamview.SelectedIndex + 1) + "'";
        string query2 = "select sum(cost) from defenders group by team having team='" + (int)(Drop_teamview.SelectedIndex + 1) + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        int ans, ans2;
        try
        {
            ans = (int)cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
            ans = 0;
        }
        SqlCommand cmd2 = new SqlCommand(query2, con);
        try
        {
            ans2 = (int)cmd2.ExecuteScalar();
        }
        catch (Exception ex)
        {
            ans2 = 0;
        }
        Literal1.Text = "Team " + (int)(Drop_teamview.SelectedIndex + 1) + " stats :";
        //Literal2.Text = "Total Points: " + ans;
        Literal3.Text = "Total Balance: " + (int)(100 - ans2) + " million ₤";
        //Literal4.Text="Goalkeepers: "+(int)
        string q = "select pl_name,club,pl_pos,cost from defenders where team='" + (int)(Drop_teamview.SelectedIndex + 1) + "'";
        SqlDataAdapter da = new SqlDataAdapter(q, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        if (ds.Tables[0].Rows.Count==0)
        {
            Label_nopl.Visible = true;
        }
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillgrid();
    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fillgrid();
    }
    protected void Drop_teamview_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillgrid();
    }
}