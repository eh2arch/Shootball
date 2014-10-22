using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class InTheEnd : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Server=ARCH; database=demo; uid=sa;pwd=sql");
    protected void Page_Load(object sender, EventArgs e)
    {
        fillgrid();
    }

    void fillgrid()
    {
        try
        {
            string q = "select team AS TEAM,sum(total) AS TOTAL from defenders where captain='YES' group by team , captain order by sum(total) DESC;";
            DataSet ds = getset(q);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('No teams qualified!');</script>");
        }

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


}