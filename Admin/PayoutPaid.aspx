<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="PayoutPaid.aspx.cs" Inherits="Admin_PayoutPaid" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
            <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                                    <h4 class="card-title">Paid Payout  </h4>
                 <!----form start---->
                            <div class=" form-group row">
                                <div class="col-lg-12">
             <div  style="float:right">
                    
                   <asp:Button ID="btnExportToExcel" CssClass="btn btn-block btn-success" Text="ExportToExcel" OnClick="btnExportToExcel_Click"  runat="server"/>
                
                </div>
            </div>
                                </div>
            
                    
                 <div class=" form-group row">
                     <div class=' col-lg-offset-1 col-lg-4'>
        <div class="form-group row">
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
        <div class="form-group row">
            <label class="control-label col-lg-4">FromDate</label>
            <div class="input-group date col-lg-8" id="datetimepicker7">
                 <asp:TextBox ID="txttodate" class="form-control"  type="date" runat="server" placeholder="DD-MM-YYYY" ></asp:TextBox>
               <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
                 <div class="col-lg-2" >
        <div class="form-group row">
             <div class=" col-lg-offset-4 col-lg-8 " >
            <asp:Button ID="btngenrate" runat="server" Text="Search" CssClass="btn btn-block btn-danger"   OnClick="btngenrate_Click"/>
</div>
        </div></div>
                   
                     </div>


         
             <div class="form-group row">
                 
                    <div class="col-sm-12" style="overflow:auto;">
                         <table class="table table-bordered table-hover table-responsive table-striped" >
                 
                        <tr>
                             
                           <th>#</th>
                            <th>Un-Paid</th>
                          <th>UserName</th>
                            <th>Name</th>
                           <th>Total Income</th>
                     <th>TDS 5%</th>
                     <th>Admin Charge 5%</th>
                   <%--  <th>Trade Charge 10%</th>--%>

                     <th>PayOut</th>
              
                    <th>Net Payout</th>      
                    <th>IncomeType</th>      
                          
                             <%--<th>Mobile</th>
                          
                            <th>Adhar Card</th>--%>
                            <th>Bank</th>
                           <th>Branch</th>
                           <th>IFSC</th>
                           <th>AccNo</th>
                           <th>AccHolder</th>
                      <%--     <th>Acc Type</th>--%>
                           
                          
                         
                       </tr>
                         <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                             
                           <ItemTemplate>
                           <tr>
                           <td><%# Container.ItemIndex+1 %></td>
                                  <td>
                              <asp:Button ID="Button1" runat="server" Text="Un-Paid" CssClass="btn btn-block btn-danger"   CommandName="Update" CommandArgument='<%#Eval("id") %>' /></td>
                     
                           
                        
                          <td><%#Eval("username") %></td>   
                          <td><%#Eval("name") %></td>
                     <td> <%#Eval("total") %></td>
        <%--      <td> <%#Eval("TDS") %></td>--%>
              <td> <%#Eval("AdminCharge") %></td>
         <%--     <td> <%#Eval("Wallet") %></td>--%>
              <td> <%#Eval("Payout") %></td>
         
              <td> <%#Eval("BankPayment") %></td>
              <td> <%#Eval("Type") %></td>
                         <%-- <td><%#Eval("mobile") %></td>
                        
                           <td><%#Eval("aadhar") %></td>  --%>                      
                           <td><%#Eval("bankname") %></td>
                           <td><%#Eval("branchname") %></td>
                           <td><%#Eval("ifsc") %></td>
                           <td>'<%#Eval("accno") %></td>
                           <td><%#Eval("holdername") %></td>
                         <%--  <td><%#Eval("acctype") %></td>--%>

                           
                         
                             </tr>
                           </ItemTemplate>
                             <FooterTemplate>
                                  </FooterTemplate>
                       </asp:Repeater>
                                 <tr>
                                     <td></td>
                                  
                                      <td class=" text text-bold ">Total</td>
                                     
                                      <td class=" text text-bold  "><asp:Label ID="lbTotal" runat="server" Text="0"></asp:Label></td>
                                <%--     <td class=" text text-bold "><asp:Label ID="lbtds" runat="server" Text="0"></asp:Label></td>
                                --%>     <td class=" text text-bold"><asp:Label ID="lbadminchrge" runat="server" Text="0"></asp:Label></td>
                                     <td class=" text text-bold"><asp:Label ID="lbTRadecharge" runat="server" Text="0"></asp:Label></td>
                                     <td class=" text text-bold"><asp:Label ID="lbpayout" runat="server" Text="0"></asp:Label></td>
                                    
                                     <td class=" text text-bold "><asp:Label ID="lbbankpayout" runat="server" Text="0"></asp:Label></td>
                                     
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                      <td></td>
                                      <td></td>


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

        </div>

    <!---container end----->

    
         

</asp:Content>


