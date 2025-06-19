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
    clsAMD objamd = new clsAMD();
    clsValidation objValidation = new clsValidation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
  
                loadlist(); loadPackage();



        }
        if (IsPostBack && FileUploadChaque.PostedFile != null)
        {
            if (FileUploadChaque.PostedFile.ContentLength > 1000000)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')", true);
            }

            else if (FileUploadChaque.PostedFile.FileName.Length < 1000000)
            {
                if (FileUploadChaque.HasFile)
                {
                    if (!objValidation.IsExtenstion(FileUploadChaque, "Image"))
                    {
                        string UploadedImageType = FileUploadChaque.PostedFile.ContentType.ToString().ToLower();
                        string UploadedImageFileName = FileUploadChaque.PostedFile.FileName;

                        //Create an image object from the uploaded file
                        System.Drawing.Image UploadedImage = System.Drawing.Image.FromStream(FileUploadChaque.PostedFile.InputStream);

                        string ThumbnailImage = System.IO.Path.GetFileName(FileUploadChaque.PostedFile.FileName);
                        string extenion = System.IO.Path.GetExtension(FileUploadChaque.PostedFile.FileName);
                        string imgurl = SessionData.Get<string>("Newuser") + "product";
                        imgurl += ThumbnailImage;
                        string imgPath = "../SoftImg/Product/" + imgurl;
                        FileUploadChaque.SaveAs(Server.MapPath(imgPath.Trim()));
                        ImgChaque.Src = imgPath;
                        hndcheque.Value = imgPath;


                    }
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (hndlid.Value != "")
            {
                int a = objamd.ProductDetails(Convert.ToInt32(hndlid.Value), Convert.ToInt32( drpPacktype.SelectedValue), Convert.ToString(drpPacktype.SelectedItem.Text), txtproductname.Text, Convert.ToDecimal(lbproductamt.Text), Convert.ToDecimal(txtmrp.Text), Convert.ToDecimal(lbdiscount.Text), Convert.ToDecimal(txtbv.Text), txtdesc.Text,hndcheque.Value, "U");
                if (a > 0)
                {
                    lbsuccess.Text = " Pruduct Update  Successed";
                    sccess.Visible = true;
                    loadlist();
                }
                else
                {
                    lbsuccess.Text = "Pruduct Update has not  Successed";
                    sccess.Visible = true;
                   
                }
            }
            else
            {
                int a = objamd.ProductDetails(0, Convert.ToInt32(drpPacktype.SelectedValue), Convert.ToString(drpPacktype.SelectedItem.Text), txtproductname.Text,  Convert.ToDecimal(lbproductamt.Text), Convert.ToDecimal(txtmrp.Text), Convert.ToDecimal(lbdiscount.Text), Convert.ToDecimal(txtbv.Text), txtdesc.Text, hndcheque.Value, "N");
                if (a > 0)
                {
                    lbsuccess.Text = " Pruduct Add  Successed";
                    sccess.Visible = true;
                    loadlist();
                }
                else
                {
                    lbsuccess.Text = "Product Not added Successed";
                    sccess.Visible = true;

                }
            }
           

        }
        catch (Exception ex)
        { }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "Delete")
        {
            string id = e.CommandArgument.ToString();
            objcon.ExecuteSqlQuery("delete from [TblProductDetails] where pid='" + id + "'");

            lbinfo.Text = "Remove Successfully";
            info.Visible = true;
            loadlist();
        }
        else if (e.CommandName == "Edit")
        {
            Label name = e.Item.FindControl("lbname") as Label;
            Label lbpack = e.Item.FindControl("lbpack") as Label;
            Label lbmrp = e.Item.FindControl("lbmrp") as Label;
            Label lbbv = e.Item.FindControl("lbbv") as Label;
            Label lbdirect = e.Item.FindControl("lbdirect") as Label;
            Label lbdesc = e.Item.FindControl("lbdesc") as Label;
            Label lbimg = e.Item.FindControl("lbimg") as Label;
           
           // txtdirect.Text = lbdirect.Text;
            txtproductname.Text = name.Text;
            lbproductamt.Text = lbmrp.Text;
            drpPacktype.SelectedItem.Text = lbpack.Text;
            txtbv.Text = lbbv.Text;
            txtdesc.Text = lbdesc.Text;
            //string url = lbimg.Text; ;
            //ImgChaque.Src = url;
            //hndcheque.Value = url;
            btnaction.Text = "Update";
            hndlid.Value = e.CommandArgument.ToString();
            loadlist();
        }

    }
    private void loadlist()
    {
        try
        {
            string sql = "select * from [TblProductDetails]";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();



        }
        catch (Exception ex)
        { }
    }

   
    public void loadPackage()
    {

        DataTable dt1 = objcon.ReturnDataTableSql("select pid,product from TblProductMaster");
        drpPacktype.DataSource = dt1;
        drpPacktype.DataBind();
        //drpPacktype.Items.Insert(0, "Select Package");

    }
    protected void lbproductamt_TextChanged(object sender, EventArgs e)
    {
        decimal MRP = Convert.ToDecimal( txtmrp.Text)- Convert.ToDecimal(lbproductamt.Text) ;
        lbdiscount.Text = MRP.ToString();
    }
}