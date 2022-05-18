using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usermaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack || !IsPostBack)
        {
            HttpCookie usercookie = Request.Cookies["user_cookies"];
            if(Session["Useremail"] != null || usercookie != null)
            {
                link_loginout.Text = "Çıkış Yap";
            }
            else
            {
                link_loginout.Text = "Giriş Yap";
            }
        }
    }
 
    //for clicking the log in out button
    protected void link_loginout_Click(object sender, EventArgs e)
    {
        if(link_loginout.Text == "Çıkış Yap")
        {
            Response.Cookies["user_cookies"].Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Clear();
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
        else if(link_loginout.Text == "Çıkış Yap")
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}
