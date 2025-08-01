﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using TripleITTransaction;
using TripleITConnection;

public partial class Admin_rptAccount : System.Web.UI.Page
{
    clsList objlist = new clsList();
    clsConnection objcon = new clsConnection();
    clsAccount objacc = new clsAccount();
    public List<clsaccount> objacclist = new List<clsaccount>();
    BussinessLayer ob = new BussinessLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadlist();
        }
    }
    protected void btngenrate_Click(object sender, EventArgs e)
    {
        loadlist();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            string username = e.CommandArgument.ToString();
            Response.Redirect("AccountUserwise.aspx?username=" + username );
        }
    }
    private void loadlist()
    {
        try
        {
            //ROUND(CAST(748.58 AS decimal(6, 2)), -3);
            string sql = "select r.name,r.dateofjoin,a.username,Round(sum(cast (a.credit as real))-sum(cast (a.debit as real)),1) as totalincome from register r , dbo.account a where r.username= a.username ";

            if (txtfromdate.Text != "" && txttodate.Text != "")
            {
                sql += "and a.date between '" + txtfromdate.Text + "' and '" + txttodate.Text + "'";
            }
            if (txtusername.Text != "" )
            {
                sql += "and a.username= '" + txtusername.Text + "' ";
            }
            sql += "group by r.name,r.dateofjoin,a.username order by r.name";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                double total = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    total += Math.Round(Convert.ToDouble(dt.Rows[i]["totalincome"].ToString()),2);


                }
                lbtotal.Text = Math.Round( total,2).ToString();
                danger.Visible = false;
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
}