<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="setgalery.aspx.cs" Inherits="Admin_setnews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
             
              <div class="alert alert-info alert-dismissible" id="info" runat="server"  visible="false">
              
                <h4><i class="icon fa fa-info"></i> Alert!</h4>
               <asp:Label ID="lbinfo" runat="server" Text="Already Inserted........."></asp:Label>  
             
              </div>
            
 
           <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                                    <h3>Set Gallery  </h3>
                                    <div class="form-group row">

               
                                  <div class="col-lg-3"></div>
<div class="col-lg-6">
    <div class="form-group has-success">
        <label class="control-label text-warning" for="inputSuccess">
            <i class="fa fa-check"></i>Certificate<p style="color:red;font-size:10px">(Only JPG, PNG, or PDF files are allowed.)</p>
        </label>
        <hr />
        <asp:FileUpload ID="FileUploadCertificate" runat="server" ClientIDMode="Static" onchange="this.form.submit()" />
        <input type="hidden" runat="server" id="Certificate" />

        <div class="col-lg-12">
            <!-- Image Preview -->
            <img src="../images/PhotoDemi.jpg" runat="server" id="imgCertificate" style="width:50%; display: none;" />

            <!-- PDF Preview -->
            <iframe id="pdfCertificate" runat="server" style=" display: none;" frameborder="0"></iframe>
        </div>
    </div>
</div>
</div>

                                      <div class="form-group row">

               
                                  <div class="col-lg-3"></div>
<div class="col-lg-6">
    <div class="form-group has-success">
        <label class="control-label text-warning" for="inputSuccess">
            <i class="fa fa-check"></i>Catalogue<p style="color:red;font-size:10px">(Only JPG, PNG, or PDF files are allowed.)</p>
        </label>
          <hr />
        <asp:FileUpload ID="FileUploadCatalogue" runat="server" ClientIDMode="Static" onchange="this.form.submit()" />
        <input type="hidden" runat="server" id="Catalogue" />

        <div class="col-lg-12">
            <!-- Image Preview -->
            <img src="../images/PhotoDemi.jpg" runat="server" id="imgCatalogue" style="width:50%; display: none;" />

            <!-- PDF Preview -->
            <iframe id="pdfCatalogue" runat="server" style=" display: none;" frameborder="0"></iframe>
        </div>
    </div>
</div>
</div>
                                      <div class="form-group row">

               
                                  <div class="col-lg-3"></div>
<div class="col-lg-6">
    <div class="form-group has-success">
        <label class="control-label text-warning" for="inputSuccess">
            <i class="fa fa-check"></i>Plan <p style="color:red;font-size:10px">(Only JPG, PNG, or PDF files are allowed.)</p>
        </label>
          <hr />
        <asp:FileUpload ID="FileUploadPlan" runat="server" ClientIDMode="Static" onchange="this.form.submit()" />
        <input type="hidden" runat="server" id="Plan" />

        <div class="col-lg-12">
            <!-- Image Preview -->
            <img src="../images/PhotoDemi.jpg" runat="server" id="imgPlan" style="width:50%; display: none;" />

            <!-- PDF Preview -->
            <iframe id="pdfPlan" runat="server" style=" display: none;" frameborder="0"></iframe>
        </div>
    </div>
</div>
</div>
                
       <div class="form-group row">
             <div class="col-lg-3"> <div class="form-group has-success"></div>
                 </div>

                   <div class="col-md-6">   
             <asp:Button ID="bntsubmit" runat="server" Text="Save" CssClass="btn btn-block btn-facebook" OnClick="bntsubmit_Click" />
                           
              </div>
             
         </div>

                  
           
       
              <div class="  form-group row">
        <div class="col-lg-12">
           
                
                      <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">

                         <HeaderTemplate>
                              <table class="table table-bordered table-hover table-responsive">
                          <tr><th>#</th>
                              <th>Certificate</th>
                              <th>Catalogue</th>
                              <th>Plan</th>
                              <th>Delete</th>
                          </tr>


                         </HeaderTemplate>
                          <ItemTemplate>
                              <tr>
                              <td><%# Container.ItemIndex+1 %></td>
                                  <td>
                                      <a href='https://leolife.live/<%#Eval("certificate") %>' >View</a>
                                      </td>
                                <td>
                                      <a href='https://leolife.live/<%#Eval("Catalogue") %>' >View</a>
                                      </td>
                                <td>
                                      <a href='https://leolife.live/<%#Eval("Plan") %>' >View</a>
                                      </td>
                          
                                  <td> <asp:Button ID="Button2" runat="server" Text="Delete" CommandArgument='<%#Eval("id") %>' CommandName="Delete" CssClass="btn btn-block btn-danger" /></td>
                          
                              </tr>
                            
                          </ItemTemplate>
                          <FooterTemplate>
                               </table>
                          </FooterTemplate>
                      </asp:Repeater>
                          
                     
                  </div>
              </div>        
                       
                    </div>
            </div>
                </div>
            </div>
            </div>
        </div>
</asp:Content>

