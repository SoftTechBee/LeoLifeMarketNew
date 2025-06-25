using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using TripleITTransaction;
using TripleITConnection;
using System.Configuration;
public partial class Admin_Accountmaster : System.Web.UI.Page
{
    clsDashboard objdash = new clsDashboard();
    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
    string OTP = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["newuser"] == null && Session["newuser"].ToString() == "")
            {
                Response.Redirect("Logout.aspx");
            }
            else
            {
                 OTP = Request.QueryString["DeliveryOTP"].ToString();
                string sql = "select bid,username,TotalAmt from tblsalebill where DeliveryOTP='" + OTP + "' and DeliveryStatus='Pending' ";
                DataTable dt = objcon.ReturnDataTableSql(sql);
                if (dt.Rows.Count > 0)
                {
                    hndbid.Value = dt.Rows[0]["bid"].ToString();
                    txtusername.Text = dt.Rows[0]["username"].ToString();
                    txtAmount.Text = dt.Rows[0]["TotalAmt"].ToString();
                    txtusername_TextChanged(sender, e);
                    danger.Visible = false;

                }
                else
                {
                    txtremarks.Text = "";
                    txtusername.Text = "";
                    txtAmount.Text = "";
                    lbdanger.Text = "Invalid OTP or This OTP has already been verified. Product was previously delivered.";
                    danger.Visible = true;
                    btnaction.Visible = false;
                }
                  
               
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("Logout.aspx");

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtusername.Text != "" && txtAmount.Text != "")
            {


                if (rdlist.SelectedItem.Text == "Debit")
                {
                    string sql = "insert into tblPurchasewallet(username,debit,DOI,type,remark)values('" + txtusername.Text + "','" + txtAmount.Text + "','" + objtime.returnStringServerMachTime() + "','PURCHASE','" + txtremarks.Text + "')";
                    int a = objcon.ExecuteSqlQuery(sql);
                    if (a > 0)
                    {
                        lbsuccess.Text = "OTP verified successfully. Product has been delivered";
                        sccess.Visible = true;
                        txtremarks.Text = "";
                        txtAmount.Text = "";
                        txtusername.Text = "";
                        lbname.Text = "";
                        txtusername.Focus();
                        string sql1 = "update tblsalebill set DeliveryStatus='Delivered',DeliveredDate=getdate()  where bid='" + hndbid.Value + "' and  DeliveryOTP='" + OTP + "' and DeliveryStatus='Pending'";
                        int a1 = objcon.ExecuteSqlQuery(sql1);
                    }
                    else
                    {
                        lbsuccess.Text = "Transaction has not  Successed";
                        sccess.Visible = true;
                        txtremarks.Text = "";
                        txtAmount.Text = "";
                        txtusername.Text = "";
                        lbname.Text = "";
                        txtusername.Focus();
                    }
                }
               
            }
        }
        catch (Exception ex)
        { }
    }

    protected void txtusername_TextChanged(object sender, EventArgs e)
    {
        string name = objdash.RetrunName(txtusername.Text);
        if (name != "0")
        {

            lbname.Text = name;
        }
        else
        {
            lbname.Text = "Invaild ID";
            txtusername.Text = "";
            txtusername.Focus();

        }
    }
}