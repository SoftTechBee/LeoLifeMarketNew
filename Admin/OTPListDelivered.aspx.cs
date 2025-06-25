using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITTransaction;
using TripleITConnection;
public partial class User_TopUpWallet : System.Web.UI.Page
{
    clsfunction objfun = new clsfunction();
    clsAMD objamd = new clsAMD();
    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
    clsDashboard objDash = new clsDashboard();
    clsSMS objsms = new clsSMS();
    clsmail objmail = new clsmail();
    public List<clsaccount> objacclist = new List<clsaccount>();
    protected void Page_Load(object sender, EventArgs e)
    {
        
            if (!IsPostBack)
            {

            loadaccount();
            }
      

    }
    //for account
    public void loadaccount()
    {
        try
        {
            string sql = "select * from [tblsalebill] where stauts='Success'    and DeliveryStatus!='Pending' ";
            if (txtsearch.Text != "" )
            {
                sql += " and '" + txtsearch.Text + "' in (InvoiceNo,UserName,DeliveryOTP)";
            }
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {

                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            else
            {
                lbdanger.Text = "Opps! NO Data Found";
                danger.Visible = true;
            }


        }
        catch (Exception ex)
        {

        }


    }




    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            
            string DeliveryOTP = e.CommandArgument.ToString();
            Label lbusername = e.Item.FindControl("lbusername") as Label;
            Response.Redirect("OTPPurchaseMaster.aspx?Username=" + lbusername.Text + "&DeliveryOTP=" + DeliveryOTP);



        }
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {

        loadaccount();
    }
}