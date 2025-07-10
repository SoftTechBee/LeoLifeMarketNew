using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripleITConnection;
using TripleITTransaction;

public partial class Member_MasterPage : System.Web.UI.MasterPage
{
    clsDashboard objdashboard = new clsDashboard();
    clsConnection objcon = new clsConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        {
            if (SessionData.Get<string>("UserType") != "User")
            {
                Response.Redirect("logout.aspx");
                return;
            }
            if (SessionData.Get<string>("Newuser") == null)
            {
                Response.Redirect("logout.aspx");
            }
            else
            {
                PopupLoad();

                try
                {
                    string sql = "select * from tblGallery";
                    DataTable dt = objcon.ReturnDataTableSql(sql);

                    if (dt.Rows.Count > 0)
                    {
                        hrefCatalogue.HRef = dt.Rows[0]["Catalogue"].ToString();
                        hrefPlan.HRef = dt.Rows[0]["Plan"].ToString();
                        hrefCertificate.HRef = dt.Rows[0]["Certificate"].ToString();
                    }

                    }
                catch (Exception ex)
                { }
            }
        }
    }

    private void PopupLoad()
    {
        try
        {
            if (SessionData.Get<string>("PopUp") != "Closed")
            {
              PopImg.Src = objdashboard.ReturnPopImg();
               btnClose.Visible = true;
            }
            else
            {
                popupWrapper.Visible = false;
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        SessionData.Put("PopUp", "Closed");
        PopupLoad();
    }
}
