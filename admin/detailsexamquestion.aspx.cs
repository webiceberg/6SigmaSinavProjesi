using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class admin_detailsexamquestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string qid = Request.QueryString["qid"];
        if (!IsPostBack)
        {

            if (qid == null)
            {
                Response.Redirect("~/admin/question.aspx");
            }
            getexamquestiondetails(Convert.ToInt32(qid));
        }
    }
    //method for getting question for the exam id
    public void getexamquestiondetails(int id)
    {
        string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("spExamquestion", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@questionid", id);
            try
            {
                con.Open();
                using (SqlDataAdapter ad = new SqlDataAdapter())
                {
                    ad.SelectCommand = cmd;
                    using (DataTable tb = new DataTable())
                    {
                        ad.Fill(tb);
                        gridview_examdetails.DataSource = tb;
                        gridview_examdetails.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                panel_examdetails_warning.Visible = true;
                lbl_examdetailswarning.Text = "Bir şeyler yanlış gitti." + ex.Message;
            }

        }
    }
}