using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITConnection;
public partial class Admin_PayoutUnpaidtoPaid : System.Web.UI.Page
{
    clsConnection objcon = new clsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            loadlist();

        }
    }

    public void loadlist()
    {
        try
        {
            double tds = 0, total = 0, payout = 0, admchrge = 0, bank = 0, advance = 0;
            string sql = "select p.*,r.name,r.mobile,b.PanNumber,r.aadhar,r.email,b.AccountNumber,b.branchname,b.bankname,b.ifsc,b.AccountHolderName from register r inner join  passbook1 p on r.username=p.username left join TblKYC b on r.username=b.username where p.[Status]='Pending' and p.BankPayment!='0'  ";

            //   string sql = "select p.Tid,p.date,r.pan,b.accno,b.branchname,b.bankname,b.ifsc,b.holdername ,sum(cast (p.payout as numeric(18,2))) as payout,sum(cast (p.TDS as numeric(18,2))) as TDS,sum(cast (p.AdminCharge as numeric(18,2))) as AdminCharge,sum(cast (p.Total as numeric(18,2))) as Total,sum(cast (p.BankPayment as numeric(18,2))) as BankPayment from register r inner join  passbook1 p on r.username=p.username left join bankdetail b on r.username=b.username where p.[Status]='Pending' ";
            if (txtfromdate.Text != "" && txttodate.Text != "")
            {
                sql += "and p.date between '" + txtfromdate.Text + "' and '" + txttodate.Text + "'";
            }
          //  sql += "group by r.pan,b.accno,b.branchname,b.bankname,b.ifsc,b.holdername ,p.Tid,p.date";

            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    tds += dt.Rows[i]["tds"].ToString() == "" ? 0 : Convert.ToDouble(dt.Rows[i]["tds"].ToString());
                    admchrge += dt.Rows[i]["AdminCharge"].ToString() == "" ? 0 : Convert.ToDouble(dt.Rows[i]["AdminCharge"].ToString());
                    total += dt.Rows[i]["Total"].ToString() == "" ? 0 : Convert.ToDouble(dt.Rows[i]["Total"].ToString());
                    payout += dt.Rows[i]["Payout"].ToString() == "" ? 0 : Convert.ToDouble(dt.Rows[i]["Payout"].ToString());
                    //advance+= dt.Rows[i]["Wallet"].ToString() == "" ? 0 : Convert.ToDouble(dt.Rows[i]["Wallet"].ToString());
                   // bank += dt.Rows[i]["bankpayment"].ToString() == "" ? 0 : Convert.ToDouble(dt.Rows[i]["bankpayment"].ToString());


                }
            }
           lbtds.Text = tds.ToString();
            lbTotal.Text = total.ToString();
            //  lbadvance.Text = advance.ToString();
            lbpayout.Text = payout.ToString();
            //lbbankpayout.Text = bank.ToString();
            lbadminchrge.Text = admchrge.ToString();

            Repeater1.DataSource = dt;
            Repeater1.DataBind();






        }
        catch (Exception ex)
        {


        }


    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        try
        {


            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=UnPaidPayout.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            //     Your Repeater Name Mine is "Rep"
            Repeater1.RenderControl(htmlWrite);
            Response.Write("<table>");
            Response.Write(stringWrite.ToString());
            Response.Write("</table>");
            Response.End();

        }
        catch (Exception ex)
        { }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            string id = e.CommandArgument.ToString();
          //  Label username = e.Item.FindControl("lbUsername") as Label;
            string query = "update passbook1 set [status]='Success'  where id='" + id + "' ";
            int a = objcon.ExecuteSqlQuery(query);
            if (a > 0)
            {

                warning.Visible = false;
                danger.Visible = false;
                sccess.Visible = false;
                info.Visible = false;
                info.Visible = true;
                lbinfo.Text = "You have Paid Payment successfully";
                loadlist();


            }
            else
            {
                warning.Visible = false;
                danger.Visible = true;
                sccess.Visible = false;
                info.Visible = false;
                info.Visible = false;
                lbdanger.Text = "You have not Paid Payment successfully";
                loadlist();

            }

        }
    }
    protected void btngenrate_Click(object sender, EventArgs e)
    {
        loadlist();
    }
}