using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using TripleITConnection;
using TripleITTransaction;
public partial class Member_Default : System.Web.UI.Page
{
    clsConnection objcon = new clsConnection();
    clsDashboard objdashboard = new clsDashboard();
    clsList objlist = new clsList();
    //clsListNew objlistnew = new clsListNew();
    clsAMD objamd = new clsAMD();
    clsTimeZone objtime = new clsTimeZone();
    CoinPayments objcoin = new CoinPayments();
    clsmail objmail = new clsmail();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (SessionData.Get<string>("Newuser") != null)
        {
            try
            {




                loadlist();
                loadDownLineBusniess();
                loadBuiness();
                loadTeam();
                string username = SessionData.Get<string>("Newuser");

                myInput.Value = "https://leolife.live/register.aspx?Sponsor=" + username + "&Side=Left";
                myInputRight.Value = "https://leolife.live/register.aspx?Sponsor=" + username + "&Side=Right";
                lbreffsidLeft.Text = "https://leolife.live/register.aspx?Sponsor=" + username + "&Side=Left";
                lbreffsidRight.Text = "https://leolife.live/register.aspx?Sponsor=" + username + "&Side=Right";
                lbTotalIncome.Text = objdashboard.TotalIncome(username);
                //lbbalance.Text = objdashboard.TotalBlance(username);



                lbAvailabledeposit.Text = objdashboard.TotalWallectBlance(username);
                lbcoupanbalnc.Text = objdashboard.CoupanWallectBlance(username);
                lbpurchasewallet.Text = objdashboard.PurchaseWallectBlance(username);
                // lbincometofund.Text = objdashboard.TotalIncometoFundTransfer(username);
               // lbdeposit.Text = objdashboard.DepositCredit(username, "Payment");
                //  lbWithdrawdeposit.Text = objdashboard.DepositDebit(username, "Main Wallet");

                //lbtotalrepurchase.Text = objdashboard.SelfBusiness(username);


                lbwithdrawapprove.Text = objdashboard.WithdrawType(username, "Approved", "INCOME");


                lblDirectRefer.Text = objdashboard.IncomeType(username, "DIRECT");
                lblDirectMatchingBonus.Text = objdashboard.IncomeType(username, "Directmatching");
                lbrewardincome.Text = objdashboard.IncomeType(username, "REWARD");
                lblSalary.Text = objdashboard.IncomeType(username, "SALARY");
                lblMatchingBinary.Text = objdashboard.IncomeType(username, "MATCHING");

            }
            catch (Exception ex)
            { }
        }
        else
        {
            Response.Redirect("logout.aspx");
        }

    }

    private void loadDownLineBusniess()
    {
        try
        {
            string sql = "select doa,reward,rankname,mobile,status,username,email,dateofjoin,name,rankname,joinAmount,country,PackType from register  where username='" + SessionData.Get<string>("Newuser") + "'";
            DataTable dt = objcon.ReturnDataTableSql(sql);

            if (dt.Rows.Count > 0)
            {

                lbDOJ.Text = Convert.ToDateTime(dt.Rows[0]["dateofjoin"].ToString()).ToShortDateString();
              //  lbDOA.Text = Convert.ToDateTime(dt.Rows[0]["doa"].ToString()).ToShortDateString();
               // lbname.Text = dt.Rows[0]["name"].ToString();
                // lbcountry.Text = dt.Rows[0]["country"].ToString();
                lbmobile.Text = dt.Rows[0]["mobile"].ToString();
               // lbusername.Text = dt.Rows[0]["username"].ToString();
                lbemail.Text = dt.Rows[0]["email"].ToString();
                //lbrank.Text = dt.Rows[0]["rankname"].ToString();
            //    // lbreward.Text = dt.Rows[0]["reward"].ToString();
                   lbpack.Text = dt.Rows[0]["PackType"].ToString();
                //lbtotalrepurchase.Text = dt.Rows[0]["joinAmount"].ToString();

                lbstatus.Text = dt.Rows[0]["status"].ToString();




            }

        }
        catch (Exception ex)
        { }
    }

    private void loadTeam()
    {
        try
        {


            string sql = "EXEC [dbo].[BinaryTeam]@UserName ='" + SessionData.Get<string>("Newuser") + "'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                lbTotalLeftDirect.Text = dt.Rows[0]["LeftDirect"].ToString();
                lbTotalRightDirect.Text = dt.Rows[0]["RightDirect"].ToString();

                lbActiveDirectLeft.Text = dt.Rows[0]["LeftActiveDirect"].ToString();
                lbActiveDirectRight.Text = dt.Rows[0]["RightActiveDirect"].ToString();

                lbinActiveDirectLeft.Text = dt.Rows[0]["LeftInActiveDirect"].ToString();
                lbinActiveDirectRight.Text = dt.Rows[0]["RightInActiveDirect"].ToString();

                lbLeftTeam.Text = dt.Rows[0]["LeftTeam"].ToString();
                lbRightTeam.Text = dt.Rows[0]["RightTeam"].ToString();

                lbActiveleftteam.Text = dt.Rows[0]["LeftActiveTeam"].ToString();
                lbActiveRightteam.Text = dt.Rows[0]["RightActiveTeam"].ToString();

                lbInActiveLeftteam.Text = dt.Rows[0]["LeftInactiveTeam"].ToString();
                lbInActiveRightteam.Text = dt.Rows[0]["RightInactiveTeam"].ToString();


            }

        }
        catch (Exception ex)
        { }
    }
    private void loadBuiness()
    {
        try
        {


            string sql = "EXEC [dbo].[BinaryBusiness]@UserName ='" + SessionData.Get<string>("Newuser") + "'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                //lbtotalbusiness.Text = dt.Rows[0]["BusinessTotal"].ToString();
                //leftbusiness.Text = dt.Rows[0]["BusinessLeft"].ToString();
                //rightbusiness.Text = dt.Rows[0]["BusinessRight"].ToString();
            //    AvailableleftBV.Text = dt.Rows[0]["BVLeftBalance"].ToString();
               // leftBV.Text = dt.Rows[0]["BVLeftTotal"].ToString();
               // AvailablerightBV.Text = dt.Rows[0]["BVRightBalance"].ToString();
                //rightBV.Text = dt.Rows[0]["BVRightTotal"].ToString();
                Availableleftpv.Text = dt.Rows[0]["PVLeftBalance"].ToString();
                leftpv.Text = dt.Rows[0]["PVLeftTotal"].ToString();
                rightpv.Text = dt.Rows[0]["PVRightTotal"].ToString();
               Availablerightpv.Text = dt.Rows[0]["PVRightBalance"].ToString();
                todayrightpv.Text = dt.Rows[0]["PVRightToday"].ToString();
                todayLeftpv.Text = dt.Rows[0]["PVLeftToday"].ToString();

            }

        }
        catch (Exception ex)
        { }
    }
    private void loadlist()
    {
        try
        {


            string sql = "select news,tittle from tblnews order by id desc";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            // repNews.DataSource = dt;
            // repNews.DataBind();
            lbnews.Text = dt.Rows[0]["news"].ToString();
            lbhead.Text = dt.Rows[0]["tittle"].ToString();


        }
        catch (Exception ex)
        { }
    }
}