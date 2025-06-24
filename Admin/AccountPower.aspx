<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AccountPower.aspx.cs" Inherits="Admin_Accountmaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
       <div class="page-body">
          <!-- Container-fluid starts-->
         <%-- <div class="container-fluid dashboard-default-sec">--%>
     <div class="box-body">
             
               <div class="alert alert-danger dark alert-dismissible fade show" role="alert" id="danger"  runat="server"  visible="false">
         
          <p>  
              <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> </p>
                    <button class="btn-close" type="button" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
          <div class="alert alert-info dark alert-dismissible fade show" role="alert" id="info"  runat="server"  visible="false">
         
          <p>  
              <asp:Label ID="lbinfo" runat="server" Text="There is  some thing wrong........."></asp:Label> </p>
                    <button class="btn-close" type="button" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
               <div class="alert alert-warning dark alert-dismissible fade show" role="alert" id="warning"  runat="server"  visible="false">
         
          <p>  
              <asp:Label ID="lbwarning" runat="server" Text="There is  some thing wrong........."></asp:Label> </p>
                    <button class="btn-close" type="button" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
             
              <div class="alert alert-success dark alert-dismissible fade show" id="sccess" runat="server"  visible="false">
          
                <p><i class="icon fa fa-check"></i> Alert!
                  <asp:Label ID="lbsuccess" runat="server" Text="Successfully updated................"></asp:Label>  
                    </p>
                        <button type="button" class="btn-close" data-dismiss="alert" aria-hidden="true"></button>
              </div>
             
           
            </div>
       
     <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center">
                        <h2 class="page-title">Power Adding</h2>
                    </div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="Home.aspx">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Power Adding</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
       
    <div class="container-fluid">
 
   
    <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                             <!----form start---->
                                     <div class=" form-group row">
                    
                
                          <label class="control-label col-lg-2">Select PlanType </label>
                          <div class="col-lg-6">
                              <asp:RadioButtonList ID="rdplantype" CssClass="form-control"  RepeatDirection="Horizontal" runat="server">
                                  <asp:ListItem Value="PV" Selected="True">PV</asp:ListItem>
                                 <%-- <asp:ListItem Value="BV">BV</asp:ListItem>
                                  <asp:ListItem Value="SV">SV</asp:ListItem>--%>
                              </asp:RadioButtonList>
                        </div>
                          </div>
                                    <div class=" form-group row">
                    
                
                          <label class="control-label col-lg-2">Side Type </label>
                          <div class="col-lg-6">
                              <asp:RadioButtonList ID="rdlist" CssClass="form-control"  RepeatDirection="Horizontal" runat="server">
                                  <asp:ListItem>Left</asp:ListItem>
                                  <asp:ListItem>Right</asp:ListItem>
                              </asp:RadioButtonList>
                        </div>
                          </div>
                                    <br />
                            <div class=" form-group row">
                    
                
                          <label class="control-label col-lg-2">Enter Member </label>
                          <div class="col-lg-6">
                         <asp:TextBox ID="txtusername" AutoPostBack="true" placeholder="Enter UserID For Power" OnTextChanged="txtusername_TextChanged"  required="" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:Label runat="server" ID="lbname" CssClass="text text-danger" ></asp:Label>
             
                          </div>
                          </div>
                                    <br />
                                     <div class=" form-group row">
                    
                
                          <label class="control-label col-lg-2">Total Power</label>
                          <div class="col-lg-6">
                         <asp:TextBox ID="txtAmount" placeholder="Enter Power in PV. For Member"  required="" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>
                          </div>
                                    <br />
                    <%--  <div class="form-group row">
                          <label class="control-label col-lg-2">Remarks </label>
                          <div class="col-lg-6">
                         <asp:TextBox ID="txtremarks" placeholder="Enter Remarks For Member"  required="" runat="server" CssClass="form-control"></asp:TextBox>
                              </div>
                          </div>
                                   --%>
                   
                      </div>
                  </div> <br />
             <div class="form-group row">
                  <div class="col-sm-3">
                      </div>
                  <div class="col-sm-4">

   <asp:Button ID="btnaction" runat="server" Text="Submit"  OnClick="Button1_Click" CssClass="btn btn-block btn-warning btn-lg"/>
               

                  </div>
                          
              </div>
              </div>
          
       
      
</div>    
                                    </div>
                        
                       

</asp:Content>

