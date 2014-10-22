using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Result : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Server=ARCH; database=demo; uid=sa;pwd=sql");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            filllist();
        }
    }
    protected void disp()
    {
        button_result.Visible = false;
    }

    protected DataSet getset(string query)
    {
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        return ds;
    }

    protected void getnonquery(string query)
    {
        con.Open();
        SqlCommand cmd=new SqlCommand(query,con);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    protected void button_result_Click(object sender, EventArgs e)
    {
        Response.Redirect("InTheEnd.aspx");
    }

    protected void button_proceed_Click(object sender, EventArgs e)
    {
        bool flag = false;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox ch = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("CheckBox1");
            if (ch.Checked)
            {
                flag = true;
                string query = "update defenders set total=2*total where pl_name='" + GridView1.Rows[i].Cells[1].Text+ "'";
                string q="update defenders set captain='YES' where team="+Drop_team.SelectedValue+"";
                getnonquery(q);
                getnonquery(query);
                Drop_team.Items.Remove(Drop_team.SelectedItem);
                if (Drop_team.Items.Count > 0)
                    fillgrid();
                else
                {
                    Drop_team.Visible = false;
                    GridView1.Visible = false;
                    button_proceed.Visible = false;
                    Label_captain.Visible = false;
                    button_result.Visible = true;
                }
            }
        }
        if (flag == false)
            Response.Write("<script>alert('Select a player!');</script>");
    }

    void filllist()
    {
        string q = "select team from defenders group by team having count(*)=15 and team is not null intersect select team from defenders where pl_pos='S' group by team having count(pl_pos)>=2 intersect select team from defenders where pl_pos='G' group by team having count(pl_pos)>=1 intersect select team from defenders where pl_pos='D' group by team having count(pl_pos)>=4 intersect select team from defenders where pl_pos='M' group by team having count(pl_pos)>=4 intersect select team from defenders where captain is NULL and team is not NULL group by team;";
        DataSet ds = getset(q);

        if (ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow d in ds.Tables[0].Rows)
            {
                ListItem add = new ListItem("Team " + d[0].ToString(), d[0].ToString());
                Drop_team.Items.Add(add);
            }
            fillgrid();

        }
        else
        {
            Drop_team.Visible = false;
            GridView1.Visible = false;
            Label_captain.Visible = false;
            button_proceed.Visible = false;
            button_result.Visible = true;

        }
    }

    void fillgrid()
    {
        try
        {
            string q = "select pl_name,club,pl_pos,cost from defenders where team='" + int.Parse(Drop_team.SelectedValue) + "'";
            DataSet ds = getset(q);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error!');</script>");
        }
        
    }

    protected void check_changed(object sender, EventArgs e)
    {
        int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
        CheckBox cb = (CheckBox)GridView1.Rows[selRowIndex].FindControl("CheckBox1");
        if (cb.Checked)
            {
                for (int j = 0; j < GridView1.Rows.Count; j++)
                {
                    CheckBox cg = (CheckBox)GridView1.Rows[j].Cells[0].FindControl("CheckBox1");
                    if (cg.Checked && j!=selRowIndex)
                    {
                        cg.Checked = false;
                        break;
                    }
                }
                cb.Checked = true;
            }
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Drop_team_SelectedIndexChanged(object Sender, EventArgs e)
    {
        fillgrid();
    }
}