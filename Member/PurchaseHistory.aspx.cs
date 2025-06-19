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
        if (SessionData.Get<string>("Newuser") == null && SessionData.Get<string>("Newuser") == "")
        {
            Response.Redirect("Logout.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                loadTotal(SessionData.Get<string>("Newuser"));
                loadaccount(SessionData.Get<string>("Newuser"));
                txtbalance.Text = objDash.TotalWallectBlance(SessionData.Get<string>("Newuser"));
                txtcoupanbalance.Text = objDash.CoupanWallectBlance(SessionData.Get<string>("Newuser"));

                calcu();

            }
        }

    }
    public void calcu()
    {
        try
        {
            decimal GrandTotal = 0, CoupanBalne = 0, HalfAmount = 0, coupnaShow = 0, Coreprise = 0;

            // Parse the input values
            GrandTotal = Convert.ToDecimal(lbgrandtotal.Text);
            //CoupanBalne = Convert.ToDecimal(txtcoupanbalance.Text);

            //// Perform calculations
            //HalfAmount = GrandTotal / 2;
            //if (HalfAmount >= CoupanBalne)
            //{
            //    coupnaShow = CoupanBalne;
            //}
            //else if (CoupanBalne >= HalfAmount)
            //{
            //    coupnaShow = HalfAmount;
            //}
            //else
            //{
            //    coupnaShow = 0;
            //}

            //decimal mainAmount = GrandTotal - coupnaShow;
            decimal mainAmount = GrandTotal ;

            lbfundwallet.Text = mainAmount.ToString();
            //lbcoupanwallet.Text = coupnaShow.ToString();

        }
        catch (Exception ex)
        {

        }


    }
    //for account
    public void loadaccount(string username)
    {
        try
        {
            string sql = "select   cast (qty as int) as qty ,* from [tblproductsale] where username='" + username + "' and status='Pending'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {

                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                hndpack.Value = dt.Rows[0]["product"].ToString();
                hndpackeg.Value = dt.Rows[0]["Pack"].ToString();
                //hndpackid.Value = dt.Rows[0]["Packid"].ToString();
                lbpackeg.Text = hndpackeg.Value;
                if (hndpackeg.Value == " Starter Package")
                {
                    hndpv.Value = "1";
                }
                else if (hndpackeg.Value == "Distributor Package")
                {
                    hndpv.Value = "2";
                }
               else if (hndpackeg.Value == "Leader Package")
                {
                    hndpv.Value = "4";
                }
               else if (hndpackeg.Value == "Success Package")
                {
                    hndpv.Value = "8";
                }
               else if (hndpackeg.Value == "Success Pro Package")
                {
                    hndpv.Value = "16";
                }
                
            }
            else
            {
                //lbdanger.Text = "Opps! NO Data Found";
                //danger.Visible = true;
            }


        }
        catch (Exception ex)
        {

        }


    }


    public void loadTotal(string username)
    {
        try
        {
            string sql = "select sum(mrp) as MRP,SUM(CAST(qty AS INT)) AS qty,sum(price) as DP,sum(bv) as BV,sum(discount) as Discount ,sum(GrandToatal) as GrandToatal from [tblproductsale] where username='" + username + "' and status='Pending'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
              
                lbgrand.Text = dt.Rows[0]["GrandToatal"].ToString();
                lbqty.Text = dt.Rows[0]["qty"].ToString();
                totalbv.Text = dt.Rows[0]["BV"].ToString();
              totaldiscount.Text = dt.Rows[0]["Discount"].ToString();
                totaldp.Text = dt.Rows[0]["DP"].ToString();
               totalmrp.Text = dt.Rows[0]["MRP"].ToString();
                Decimal TotalBV = Convert.ToDecimal(totalbv.Text);
                Decimal qty = Convert.ToDecimal(lbqty.Text);

                lbtotalBV.Text = (TotalBV ).ToString();


                if (TotalBV >= 1 && TotalBV <= 500)
                {
                    lbgrandtotal.Text = lbgrand.Text;
                    lbshipping.Text = "Free";
                    lbtotalpayout.Text = (Convert.ToDecimal(lbgrand.Text) + 0).ToString();
                }
                else if (TotalBV >= 501 && TotalBV <= 999)
                {
                    lbgrandtotal.Text = lbgrand.Text;
                    lbshipping.Text = "Free";
                    lbtotalpayout.Text = (Convert.ToDecimal(lbgrand.Text) + 0).ToString();
                }
                else
                {
                    lbshipping.Text = "Free";
                    lbtotalpayout.Text = Convert.ToDecimal(lbgrand.Text).ToString();
                    lbgrandtotal.Text = lbgrand.Text;
                }
            }
            else
            {
                //lbdanger.Text = "Opps! NO Data Found";
                //danger.Visible = true;
            }


        }
        catch (Exception ex)
        {

        }


    }


    public string OTPGenerate()
    {
        string fullValue = SessionData.Get<string>("Newuser");

        string lastThree = string.IsNullOrEmpty(fullValue) || fullValue.Length < 3
            ? fullValue
            : fullValue.Substring(fullValue.Length - 3);

        string capta = "";
        string newuser = "";
        for (int i = 1; i <= 100; i++)
        {
            var chars = "0123456789";
            var stringChars = new char[3];
            var random = new Random();

            for (int ik = 0; ik < stringChars.Length; ik++)
            {
                stringChars[ik] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            capta = Convert.ToString(finalString);
            newuser = lastThree + capta;
            DataTable dt1 = objcon.ReturnDataTableSql("select username from TblSaleBill where DeliveryOTP='" + newuser + "'");
            if (dt1.Rows.Count > 0)
            {

            }
            else
            {
                i = 120;
            }
        }
        return newuser;

    }


    protected void btncheckout_Click(object sender, EventArgs e)
    {
        try

        {

            decimal widamount = 0, Price = 0, BV = 0, Qty = 0, coupan = 0, Discount = 0, PVLimit = 0;
            string date = objtime.returnStringServerMachTime();
            string PackType = hndpack.Value;
            string id = SessionData.Get<string>("Newuser");
            decimal finalamount = Convert.ToDecimal(txtbalance.Text.Trim());

            Price = (Convert.ToDecimal(totaldp.Text.Trim()));
            BV = (Convert.ToDecimal(totalbv.Text.Trim()));
            PVLimit = (Convert.ToDecimal(hndpv.Value.Trim()));
            Qty = (Convert.ToDecimal(lbqty.Text.Trim()));
            // Discount = (Convert.ToDecimal(totaldiscount.Text.Trim()));
            //  coupan = (Convert.ToDecimal(lbcoupanwallet.Text.Trim()));

            if (PVLimit == BV)
            {

                string OTP = OTPGenerate();


                if (finalamount >= Price)
                {


                    int a = objamd.ActiveMember(id, Price, coupan, PackType,  SessionData.Get<string>("Newuser"), "N");
                    if (a > 0)
                    {

                        int b = objamd.PRODUCTBILL(0, OTP, SessionData.Get<string>("Newuser"), "", "", Qty, Price, Discount, Price, BV, Price, 0, 0, 0, "", "C");
                        if (b > 0)
                        {
                            danger.Visible = false;
                            warning.Visible = false;
                            danger.Visible = false;
                            sccess.Visible = true;
                            info.Visible = false;
                        lbsuccess.Text = "Your Payment Has Been Succesully .! Please Check Out In Invoice List";
                        //string Username = SessionData.Get<string>("newuser");
                        //Response.Redirect("Billview.aspx?username=" + Username);

                        loadTotal(SessionData.Get<string>("Newuser"));
                            loadaccount(SessionData.Get<string>("Newuser"));
                            txtbalance.Text = objDash.TotalWallectBlance(SessionData.Get<string>("Newuser"));
                        txtcoupanbalance.Text = objDash.CoupanWallectBlance(SessionData.Get<string>("Newuser"));

                        SessionData.Put("StatusCSS", "text-success");
                        calcu();
                       string Name = objDash.RetrunName(SessionData.Get<string>("Newuser"));
                       string Email = objDash.ReturnEmail(SessionData.Get<string>("Newuser"));

                        objmail.ProductBuy(Name, SessionData.Get<string>("Newuser"),  Price.ToString(), OTP, Email);

                    }
                    else if (b == -1)
                        {


                            danger.Visible = true;

                            lbdanger.Text = "You have already insert Member...!";
                        }
                        else
                        {

                            lbdanger.Text = "Data is not insert successfully";
                            danger.Visible = true;


                        }


                    }
                    else if (a == -1)
                    {

                        warning.Visible = false;
                        danger.Visible = false;
                        sccess.Visible = false;

                        info.Visible = true;
                        lbinfo.Text = "You have already Payment ";
                    }
                }
                else
                {

                    warning.Visible = false;
                    danger.Visible = false;
                    sccess.Visible = false;
                    info.Visible = false;
                    info.Visible = true;
                    lbinfo.Text = "Less Then Balance! ";
                }
            }
            else
            {

                warning.Visible = false;
                danger.Visible = false;
                sccess.Visible = false;
                info.Visible = true;
                lbinfo.Text = "PV Should Be "+ PVLimit + " For Package: "+lbpackeg.Text+" ";
            }
        }





        catch (Exception ex)
        {



        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "remove")
        {
            string id = e.CommandArgument.ToString();
            objcon.ExecuteSqlQuery("delete from [tblproductsale] where pid='" + id + "'");

            lbinfo.Text = "Product remove Successfully";
            info.Visible = true;
            loadTotal(SessionData.Get<string>("Newuser"));
            loadaccount(SessionData.Get<string>("Newuser"));
            txtbalance.Text = objDash.TotalWallectBlance(SessionData.Get<string>("Newuser"));
            calcu();





        }
    }
}