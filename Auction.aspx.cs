using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Auction : System.Web.UI.Page
{
    static int flag = 1;
    SqlConnection con = new SqlConnection("Server=ARCH; database=demo; uid=sa;pwd=sql");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            init();
        }
    }
    public void init()
    {
        Label_Cost.ForeColor = System.Drawing.Color.Red;
        Label_Team.ForeColor = System.Drawing.Color.Red;
        for (int i = 0; i < 8; i++)
        {
            Drop_Team.Items.Add("Team " + (int)(i + 1));
        }
    }
    public void reset()
    {
        Drop_Pos.SelectedIndex = 0;
        Drop_Player.Items.Clear();
        Drop_Player.Items.Add("Select Player");
        Drop_Team.SelectedIndex = 0;
        Text_Cost.Text = "";
        Label_Cost.Visible = false;
        Label_Team.Visible = false;
        Drop_Team.Focus();
        
    }

    public void error_team(string err)
    {
        Label_Team.Font.Size = System.Web.UI.WebControls.FontUnit.Medium;
        Label_Team.Text = err;
        Label_Team.Visible = true;
        Label_Cost.Visible = false;
    }
    public bool initcost()
    {
        bool val = false;
        con.Open();
        if (Drop_Team.SelectedIndex == 0)
        {
            error_team("Please select a Team");
        }
        else
        {
            Label_Team.Visible = false;
            string query = "select sum(cost) from defenders group by team having team='" + Drop_Team.SelectedIndex + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            int cost;
            try
            {
                cost = (int)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                cost = 0;
            }
            con.Close();
            val=checkCost(cost);
        }
        return val;
        
    }

    public void error_cost(string err)
    {
        Label_Team.Font.Size = System.Web.UI.WebControls.FontUnit.Medium;
        Label_Cost.Visible = true;
        Label_Cost.Text = err; 
    }
    public bool checkCost(int cost)
    {
        bool cond = false;
            try
            {
                int x = int.Parse(Text_Cost.Text.ToString());
                if (x < 1 || x > 100 || Text_Cost.Text.ToString()=="")
                {
                    error_cost("Please enter a number between 1 and 100");
                    Text_Cost.Focus();
                }
                else if (x + cost > 100)
                {
                    Text_Cost.Text = x.ToString();
                    error_cost("You are overshooting your budget!");
                    Text_Cost.Focus();
                }
                else
                {
                    Label_Cost.Visible = false;
                    cond=true;
                    Text_Cost.Text = x.ToString();
                }
            }
            catch (Exception ex)
            {
                error_cost("Please enter a number between 1 and 100");
                Text_Cost.Focus();
                cond = false;
            }
            return cond;
        }


    protected void Text_Cost_TextChanged(object sender, EventArgs e)
    {
        initcost();    
    }
    protected void Drop_Pos_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Drop_Pos.SelectedIndex != 0)
        {
            con.Open();
            string query = "select pl_name from defenders where pl_pos='" + Drop_Pos.SelectedValue + "' and team is null and pl_name is not null order by pl_name";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Drop_Player.Items.Clear();
            foreach (DataRow d in ds.Tables[0].Rows)
            {
                Drop_Player.Items.Add(d[0].ToString());
            }
            con.Close();
            flag = 0;
        }
        else
        {
            flag = 1;
            Drop_Player.Items.Clear();
            Drop_Player.Items.Add("Select Player");
            
        }
    }

    
    protected void Drop_Team_SelectedIndexChanged(object sender, EventArgs e)
    {
        Text_Cost.Text = "";
    }


    public bool valid()
    {
        if (Drop_Pos.SelectedIndex != 0 && Drop_Team.SelectedIndex != 0 && initcost() == true)
            return true;
        return false;
    }

    public bool checktno()
    {
        con.Open();
        string team_no = "select count(*) from defenders group by team having team=" + Drop_Team.SelectedIndex;
        SqlCommand cmd = new SqlCommand(team_no, con);
        int t_no;

        try
        {

            t_no = int.Parse(cmd.ExecuteScalar().ToString());
        }
        catch (Exception ex)
        {
            t_no = 0;
        }
        con.Close();
        if (t_no < 15)
            return true;
        return false;
    }

    protected void Button_Player_Add_Click(object sender, EventArgs e)
    {
        if (valid()==false)
            Response.Write("<script>alert('Please fill the fields properly');</script>");
        else if(checktno()==false)
        {
            Response.Write("<script>alert('You already have 15 players!');</script>");
            reset();
        }
        else
        {
            con.Open();
            string insert="update defenders set team='"+Drop_Team.SelectedIndex+"', cost="+int.Parse(Text_Cost.Text.ToString())+" where pl_name='"+Drop_Player.SelectedValue.ToString()+"'";
            SqlCommand cmd = new SqlCommand(insert, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Your response has been recorded.');</script>");

            reset();
        }
    }
    protected void Button_Reset_Click(object sender, EventArgs e)
    {
        reset();
    }
}