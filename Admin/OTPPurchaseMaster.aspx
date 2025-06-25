<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="OTPPurchaseMaster.aspx.cs" Inherits="Admin_Accountmaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
     <!------Msgbox End---->
     <div class="box-body">
              <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>
              <div class="alert alert-info alert-dismissible" id="info" runat="server"  visible="false">
              
                <h4><i class="icon fa fa-info"></i> Alert!</h4>
               <asp:Label ID="lbinfo" runat="server" Text="ere is  some thing wrong........."></asp:Label>  
             
              </div>
              <div class="alert alert-warning alert-dismissible" id="warning" runat="server"  visible="false">
              
                <h4><i class="icon fa fa-warning"></i> Alert!</h4>
               <asp:Label ID="lbwarning" runat="server" Text=" Try Again............"></asp:Label> 
            
              </div>
              <div class="alert alert-success alert-dismissible" id="sccess" runat="server" visible="false" >
              
                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                  <asp:Label ID="lbsuccess" runat="server" Text="Successfully updated................"></asp:Label>  
              </div>
            </div>
    <!-----Alert End----->

           <div class="page-breadcrumb mb-2">
                <div class="row">
                    <div class="col-12 align-self-center">
                        <h4 class="page-title">OTP Purchase Wallet</h4>
                    </div>
                   
                </div>
            </div>
    <div class="container-fluid">
   
    <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                             <!----form start---->
                                     <div class=" form-group row">
                    
                
                          <label class="control-label col-lg-2">Action Type </label>
                          <div class="col-lg-10">
                              <asp:RadioButtonList ID="rdlist" CssClass="form-control"  RepeatDirection="Horizontal" runat="server">
                                  <%--<asp:ListItem>Credit</asp:ListItem>--%>
                                  <asp:ListItem  Selected="True">Debit</asp:ListItem>
                              </asp:RadioButtonList>
                        </div>
                          </div>
                            <div class=" form-group row">
                    
                
                          <label class="control-label col-lg-2">Enter Member </label>
                          <div class="col-lg-10">
                         <asp:TextBox ID="txtusername" ReadOnly="true" AutoPostBack="true" OnTextChanged="txtusername_TextChanged"  required="" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:Label runat="server" ID="lbname" CssClass="text text-danger" ></asp:Label>
             
                          </div>
                          </div>
                                     <div class=" form-group row">
                    
                
                          <label class="control-label col-lg-2">Enter Amount </label>
                          <div class="col-lg-10">
                         <asp:TextBox ID="txtAmount" ReadOnly="true"  required="" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>
                          </div>
                      <div class="form-group row">
                          <label class="control-label col-lg-2">Remarks </label>
                          <div class="col-lg-10">
                         <asp:TextBox ID="txtremarks" Text="Successful delivery recorded; payment deduction completed" required="" runat="server" CssClass="form-control"></asp:TextBox>
                              </div>
                          </div>
                   
                      </div>
                  </div>
             <div class="form-group row mb-4">
                  <div class="col-sm-4">
                      </div>
                  <div class="col-sm-4">

   <asp:Button ID="btnaction" runat="server" Text="Debit Now"  OnClick="Button1_Click" CssClass="btn btn-sm btn-warning btn-lg"/>
               

                  </div>
                          
              </div>
              </div>
          
       
      <asp:HiddenField runat="server" ID="hndbid" />
</div>    

</asp:Content>

