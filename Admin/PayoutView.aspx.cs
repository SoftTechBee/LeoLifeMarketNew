using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITConnection;
using System.IO;
using System.Text;

public partial class Admin_PayoutView : System.Web.UI.Page
{
    clsConnection objcon = new clsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Tid = Request.QueryString["Tid"].ToString();
            loadlist(Tid);

        }
    }

    public void loadlist(string Tid)
    {
        try {

            // string sql = "select * from TransferPayment where Tid='"+Tid+"' ";

            string sql = "select p.*,r.name,r.mobile,r.pan,r.aadhar,r.email,b.accno,b.branchname,b.bankname,b.ifsc,b.holdername from register r inner join  passbook1 p on r.username = p.username left join bankdetail b on r.username = b.username where p.tid='"+Tid+"'  ";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            



        }
        catch (Exception ex)
        {


        }


    }
   
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
       
        //Response.Clear();
        //Response.Buffer = true;
        //Response.AddHeader("content-disposition", "attachment;filename=Payout.xls");
        //Response.Charset = "";
        //Response.ContentType = "application/vnd.ms-excel";

        //System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        //System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        ////     Your Repeater Name Mine is "Rep"
        //Repeater1.RenderControl(htmlWrite);
        //Response.Write("<table>");
        //Response.Write(stringWrite.ToString());
        //Response.Write("</table>");
        //Response.End();
    }
}