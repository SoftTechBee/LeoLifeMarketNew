using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Net;
using System.Data.SqlClient;
using TripleITConnection;
using TripleITTransaction;
public partial class Admin_setnews : System.Web.UI.Page
{
    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
    clsValidation objValidation = new clsValidation();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                loadlist();
            

            }
            if (IsPostBack && FileUploadCertificate.PostedFile != null)
            {
                if (FileUploadCertificate.HasFile)
                {
                    string ext = Path.GetExtension(FileUploadCertificate.FileName).ToLower();

                    if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                    {
                        string imgPath = "../SoftImg/" + SessionData.Get<string>("Newuser") + "Img" + Path.GetFileName(FileUploadCertificate.FileName);
                        FileUploadCertificate.SaveAs(Server.MapPath(imgPath));

                        imgCertificate.Src = imgPath;
                        imgCertificate.Style["display"] = "block"; // Show image
                        pdfCertificate.Style["display"] = "none";  // Hide PDF viewer

                        Certificate.Value = imgPath;
                    }
                    else if (ext == ".pdf")
                    {
                        string pdfPath = "../SoftImg/" + SessionData.Get<string>("Newuser") + "Pdf" + Path.GetFileName(FileUploadCertificate.FileName);
                        FileUploadCertificate.SaveAs(Server.MapPath(pdfPath));

                        pdfCertificate.Src = pdfPath;
                        pdfCertificate.Style["display"] = "block"; // Show PDF
                        imgCertificate.Style["display"] = "none";  // Hide image

                        Certificate.Value = pdfPath;
                    }
                    else
                    {
                        // Optional error message
                        Response.Write("<script>alert('Only JPG, PNG, or PDF files are allowed.')</script>");

                         //lbdanger.Text = "Only JPG, PNG, or PDF files are allowed.";
                    }
                }


            }
            if (IsPostBack && FileUploadCatalogue.PostedFile != null)
            {
                if (FileUploadCatalogue.HasFile)
                {
                    string ext = Path.GetExtension(FileUploadCatalogue.FileName).ToLower();

                    if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                    {
                        string imgPath = "../SoftImg/" + SessionData.Get<string>("Newuser") + "Img" + Path.GetFileName(FileUploadCatalogue.FileName);
                        FileUploadCatalogue.SaveAs(Server.MapPath(imgPath));

                        imgCatalogue.Src = imgPath;
                        imgCatalogue.Style["display"] = "block"; // Show image
                        pdfCatalogue.Style["display"] = "none";  // Hide PDF viewer

                        Catalogue.Value = imgPath;
                    }
                    else if (ext == ".pdf")
                    {
                        string pdfPath = "../SoftImg/" + SessionData.Get<string>("Newuser") + "Pdf" + Path.GetFileName(FileUploadCatalogue.FileName);
                        FileUploadCatalogue.SaveAs(Server.MapPath(pdfPath));

                        pdfCatalogue.Src = pdfPath;
                        pdfCatalogue.Style["display"] = "block"; // Show PDF
                        imgCatalogue.Style["display"] = "none";  // Hide image

                        Catalogue.Value = pdfPath;
                    }
                    else
                    {
                        // Optional error message
                        Response.Write("<script>alert('Only JPG, PNG, or PDF files are allowed.')</script>");

                    }
                }


            }
            if (IsPostBack && FileUploadPlan.PostedFile != null)
            {
                if (FileUploadPlan.HasFile)
                {
                    string ext = Path.GetExtension(FileUploadPlan.FileName).ToLower();

                    if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                    {
                        string imgPath = "../SoftImg/" + SessionData.Get<string>("Newuser") + "Img" + Path.GetFileName(FileUploadPlan.FileName);
                        FileUploadPlan.SaveAs(Server.MapPath(imgPath));

                        imgPlan.Src = imgPath;
                        imgPlan.Style["display"] = "block"; // Show image
                        pdfPlan.Style["display"] = "none";  // Hide PDF viewer

                        Plan.Value = imgPath;
                    }
                    else if (ext == ".pdf")
                    {
                        string pdfPath = "../SoftImg/" + SessionData.Get<string>("Newuser") + "Pdf" + Path.GetFileName(FileUploadPlan.FileName);
                        FileUploadPlan.SaveAs(Server.MapPath(pdfPath));

                        pdfPlan.Src = pdfPath;
                        pdfPlan.Style["display"] = "block"; // Show PDF
                        Plan.Style["display"] = "none";  // Hide image

                        Plan.Value = pdfPath;
                    }
                    else
                    {
                        // Optional error message
                        Response.Write("<script>alert('Only JPG, PNG, or PDF files are allowed.')</script>");

                    }
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
            objcon.ExecuteSqlQuery("delete from tblGallery where id='" + id + "'");

            lbinfo.Text = "Delete Successfully";
            info.Visible = true;
            loadlist();
        }

    }
    private void loadlist()
    {
        try
        {
            string sql = "select * from tblGallery";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }
        catch (Exception ex)
        { }
    }
    protected void bntsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string date = objtime.returnStringServerMachTime();
            
            string sql = "insert into tblGallery(Certificate,[Plan],Catalogue,date)values('" + Certificate.Value + "','" + Plan.Value + "','" + Catalogue.Value + "','" + date + "')";
        int a= objcon.ExecuteSqlQuery(sql);
            if (a > 0)
            {
                lbinfo.Text = "Gallery Added Successfully";
                info.Visible = true;
                loadlist();
                Clear();

            }
            else
            {
                lbinfo.Text = "Gallery has not added Successfully";
                info.Visible = true;
                loadlist();
                Clear();

            }


        }
        catch (Exception ex)
        { }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "del")
        {
            string id = e.CommandArgument.ToString();

            objcon.ExecuteSqlQuery("delete from tblGallery where id='" + id + "'");

            lbinfo.Text = "Delete Successfully";
            info.Visible = true;
            loadlist();
        }
    }

    private void Clear()
    {
        try
        {
            //txtCatalogue.Text = "";
            //txtPlan.Text = "";
           // txtCertificate.Text = "";
        }
        catch (Exception ex)
        {

        }
    }
}