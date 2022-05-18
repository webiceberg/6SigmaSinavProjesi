using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class admin_resetpass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_resetpass_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update admin set admin_password= @adminpass where admin_password = @adminoldpassword", con);
                cmd.Parameters.AddWithValue("@adminpass", txt_adminewpass.Text);
                cmd.Parameters.AddWithValue("@adminoldpassword", txt_admipresentpass.Text);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/admin/index.aspx");
                    }
                    else
                    {
                        txt_admipresentpass.Focus();
                        panel_resetpass_warning.Visible = true;
                        lbl_resetpasswarning.Text = "Bir şeyler yanlış gitti.";
                    }
                }
                catch (Exception ex)
                {
                    txt_admipresentpass.Focus();
                    panel_resetpass_warning.Visible = true;
                    lbl_resetpasswarning.Text = "Bir şeyler yanlış gitti." + ex.Message;
                }
            } // end of using 
        }
        else
        {
            txt_admipresentpass.Focus();
            panel_resetpass_warning.Visible = true;
            lbl_resetpasswarning.Text = "Tüm gerekli alanları doldurmalısınız.";
        }
    }
}