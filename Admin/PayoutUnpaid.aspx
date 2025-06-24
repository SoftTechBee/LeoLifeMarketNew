<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="PayoutUnpaid.aspx.cs" Inherits="Admin_PayoutUnpaid" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                                    <h4>Payout UnPaid Payout   </h4>
                                    <div class="form-group row">
                   

 <div class=" col-sm-offset-4 col-sm-4">
                   <asp:Button ID="btnExportToExcel" CssClass="btn btn-block btn-success" Text="ExportToExcel" OnClick="btnExportToExcel_Click"  runat="server"/>
                  <%-- <asp:Button ID="btnexportpdf" CssClass="btn btn-block btn-success" Text="ExportToPDF" OnClick="btnExportToExcel_Click1"  runat="server"/>
              --%>
              
     </div>
                 </div>

         
             <div class="form-group row">
                     <div class=' col-lg-offset-1 col-lg-4'>
        <div class="form-group">
            <label class="control-label col-lg-4">FromDate</label>
            <div class="input-group date col-lg-8" id='datetimepicker6'>
                <asp:TextBox ID="txtfromdate" class="form-control"  type="date" runat="server" placeholder="DD-MM-YYYY" ></asp:TextBox>
                 <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
    <div class='col-lg-4'>
        <div class="form-group row ">
            <label class="control-label col-lg-4">ToDate</label>
            <div class="input-group date col-lg-8" id="datetimepicker7">
                 <asp:TextBox ID="txttodate" class="form-control"  type="date" runat="server" placeholder="DD-MM-YYYY" ></asp:TextBox>
               <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
                 <div class="col-lg-2" >
        <div class="form-group row ">
             <div class=" col-lg-offset-4 col-lg-8 " >
            <asp:Button ID="btngenrate" runat="server" Text="Search" CssClass="btn btn-block btn-success"   OnClick="btngenrate_Click"/>
</div>
        </div></div>
                   
                     </div>




         
             <div class="form-group row">
                 
                    <div class="col-sm-12" style="overflow:auto;">
                          <table class="table table-bordered table-hover table-responsive table-striped" >
                 <tr>
                           <th>#</th>
                        
                            <th>UserName</th>
                            <th>Name</th>
                            <th>Mobile</th>
                            <th>Pan</th>
                     
                          <th>Bank</th>
                         
                           <th>IFSC</th>
                           <th>AccNo</th>
                           <th>AccHolder</th>
                       <th>Branch</th>
                           <th>Total Income</th>

                       <th>Admin Charge 13%</th>
                     <th>TDS 2%</th>
                       <th>PayOut</th>
                     
                   
                   
                         
                       </tr>
                         <asp:Repeater ID="Repeater1" runat="server">
                           
                           <ItemTemplate>
                           <tr>
                           <td><%# Container.ItemIndex+1 %></td>
                   
                          <td><%#Eval("username") %></td>
                          <td><%#Eval("name") %></td>
                          <td>'<%#Eval("Mobile") %></td>
                          <td>'<%#Eval("PanNumber") %></td>
                                <td><%#Eval("bankname") %></td>
                      
                           <td><%#Eval("ifsc") %></td>
                           <td>'<%#Eval("AccountNumber") %></td>
                           <td><%#Eval("AccountHolderName") %></td>
                                    <td><%#Eval("branchname") %></td>
          <td> <%#Eval("total") %></td>

                                   <td> <%#Eval("AdminCharge") %></td>
              <td> <%#Eval("TDS") %></td>
          
         
             
                                <td> <%#Eval("Payout") %></td>

             
                       
                           
                         
                             </tr>
                           </ItemTemplate>
                             <FooterTemplate>
                                  </FooterTemplate>
                       </asp:Repeater>
                             
                                 <tr>
                                     <td></td>
                                  <td></td>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                  
                                    
                                      <td class=" text text-bold ">Total</td>
                                     <td class=" text text-bold "><asp:Label ID="lbTotal" runat="server" Text="0"></asp:Label></td>

                                      <td class=" text text-bold "><asp:Label ID="lbadminchrge" runat="server" Text="0"></asp:Label></td>
                                    
                                      <%-- <td class=" text text-bold "><asp:Label ID="lbtds" runat="server" Text="0"></asp:Label></td>
                                   --%> <td class=" text text-bold "><asp:Label ID="lbtradecharge" runat="server" Text="0"></asp:Label></td>
                                      <td class=" text text-bold "><asp:Label ID="lbpayout" runat="server" Text="0"></asp:Label></td>
                                   
                                     <%--<td class=" text text-bold "><asp:Label ID="lbbankpayout" runat="server" Text="0"></asp:Label></td>
                                     --%>


                                 </tr>
                                 
  </table>
                            
                     
                 
                </div>

                 <!---table end----->
             </div>
                      <!---group end----->
                 </div>
                 <!---box form end----->

               
            </div>
                 <!---box body end----->

            </div>
         <!---box  end----->

     

    <!---container end----->

    
         

</asp:Content>


