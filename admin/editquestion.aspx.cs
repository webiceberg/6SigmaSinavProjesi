using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

public partial class admin_editquestion : System.Web.UI.Page
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
            get_editexamquestion(Convert.ToInt32(qid));
            get_editexamdrp();
            // get_editsubjectdrp();
        }
    }

    string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

    protected void btn_editquestion_Click(object sender, EventArgs e)
    {
        byte[] bytes = null;
        HttpPostedFile postedFile = soru_pic.PostedFile;
        string filename = Path.GetFileName(postedFile.FileName);
        string fileextension = Path.GetExtension(postedFile.FileName);
        int filesize = postedFile.ContentLength;

        if(fileextension.ToLower() == ".jpg"  || fileextension.ToLower() == ".jpeg" || fileextension.ToLower() == ".png")
        {
            Stream stream = postedFile.InputStream;
            BinaryReader biaryreader = new BinaryReader(stream);
            bytes = biaryreader.ReadBytes((int)stream.Length);
        }
        else
        {

        }
      
        if (IsValid)
        {
            string denistir = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(denistir))
            {
                SqlCommand cmd = new SqlCommand("usp_ImportImage", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PicName", filename);
                cmd.Parameters.AddWithValue("@ImageFolderPath", postedFile);
                cmd.Parameters.AddWithValue("@Filename", fileextension);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/admin/question.aspx");
                    }
                    else
                    {
                        txt_editquestionname.Focus();
                        panel_editquestion_warning.Visible = true;
                        lbl_editquestionwarning.Text = "Bir şeyler yanlış gitti. ";
                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    txt_editquestionname.Focus();
                    panel_editquestion_warning.Visible = true;
                    lbl_editquestionwarning.Text = "Bir şeyler yanlış gitti. " + ex.Message;
                }
            } 
        }
        else
        {
            
        }

        string qid = Request.QueryString["qid"];
        if (IsValid)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spEditquestion", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@questionid", Convert.ToInt32(qid));
                cmd.Parameters.AddWithValue("@questionname", txt_editquestionname.Text);
                cmd.Parameters.AddWithValue("@optionone", txt_editoptionone.Text);
                cmd.Parameters.AddWithValue("@optiontwo", txt_editoptiontwo.Text);
                cmd.Parameters.AddWithValue("@optionthree", txt_edtoptionthree.Text);
                cmd.Parameters.AddWithValue("@optionfour", txt_editoptionfour.Text);
                cmd.Parameters.AddWithValue("@questionanswer", rdo_editcorrectanswer.SelectedValue);
                cmd.Parameters.AddWithValue("@examfid", drp_editexam.SelectedValue);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/admin/question.aspx");
                    }
                    else
                    {
                        txt_editquestionname.Focus();
                        panel_editquestion_warning.Visible = true;
                        lbl_editquestionwarning.Text = "Bir şeyler yanlış gitti. ";
                    }
                }
                catch (Exception ex)
                {
                    txt_editquestionname.Focus();
                    panel_editquestion_warning.Visible = true;
                    lbl_editquestionwarning.Text = "Bir şeyler yanlış gitti. " + ex.Message;
                }
            } // end of using 
        }
        else
        {
            txt_editquestionname.Focus();
            panel_editquestion_warning.Visible = true;
            lbl_editquestionwarning.Text = "Tüm gerekli alanları doldurunuz. ";
        }
    }
    //method for editfill
    public void get_editexamquestion(int id)
    {

        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("spEditquestionfill", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@questionid", id);
            try
            {
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    txt_editquestionname.Text = rd["question_name"].ToString();
                    txt_editoptionone.Text = rd["option_one"].ToString();
                    txt_editoptiontwo.Text = rd["option_two"].ToString();
                    txt_edtoptionthree.Text = rd["option_three"].ToString();
                    txt_editoptionfour.Text = rd["option_four"].ToString();

                }
            }
            catch (Exception ex)
            {
                panel_editquestion_warning.Visible = true;
                lbl_editquestionwarning.Text = "Bir şeyler yanlış gitti. " + ex.Message;
            }
        }
    }
    //method for category dropdown
    public void get_editexamdrp()
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("select * from exam", con);
            try
            {
                con.Open();
                drp_editexam.DataSource = cmd.ExecuteReader();
                drp_editexam.DataBind();
                ListItem li = new ListItem("Ders Seçiniz", "-1");
                drp_editexam.Items.Insert(0, li);
            }
            catch (Exception ex)
            {
                txt_editquestionname.Focus();
                panel_editquestion_warning.Visible = true;
                lbl_editquestionwarning.Text = "Bir şeyler yanlış gitti." + ex.Message;
            }
        }
    }



}