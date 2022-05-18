using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class admin_addadmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //add admin
    protected void btn_addadmin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spAdminRegisterinsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@admin_name", txt_adminame.Text);
                cmd.Parameters.AddWithValue("@email", txt_admiemail.Text);
                cmd.Parameters.AddWithValue("@password", txt_adminpass.Text);
                try
                {
                    con.Open();
                    int value = (int)cmd.ExecuteScalar(); // as procedure return number
                    if (value == 1)
                    {
                        Response.Redirect("~/admin/Index.aspx");
                    }
                    else
                    {
                        txt_adminame.Focus();
                        panel_addamin_warning.Visible = true;
                        lbl_addaminwarning.Text = "Bu Email zaten kullanılıyor";
                    }

                }
                catch (Exception ex)
                {
                    txt_admiemail.Focus();
                    panel_addamin_warning.Visible = true;
                    lbl_addaminwarning.Text = "Bir şeyler yanlış gitti" + ex.Message;
                }
            }
        }
        else
        {
            txt_admiemail.Focus();
            panel_addamin_warning.Visible = true;
            lbl_addaminwarning.Text = "Tüm gerekli alanları doldurunuz";
        }
    }
}