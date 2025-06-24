<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="PayoutUnpaidtoPaid.aspx.cs" Inherits="Admin_PayoutUnpaidtoPaid" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- jQuery 3 -->
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="../../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="../../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
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
 <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                                     <h4>Paid Now</h4>
                 <!----form start---->
                            <div class=" form-group row">

                       <div class=' col-lg-12'>
              
             <div  style="float:right">
                    
                   <asp:Button ID="btnExportToExcel" CssClass="btn btn-block btn-success" Text="ExportToExcel" OnClick="btnExportToExcel_Click"  runat="server"/>
                
                </div>
            </div>
                                </div>
          
                 <div class=" form-group row ">
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
        <div class="form-group">
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
        <div class="form-group">
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
                            <th>Paid</th>
              
                            <th>Name</th>
                            <th>UserName</th>
                           <th>Total Income</th>
                     <th>TDS 2%</th>
                     <th>Admin Charge 13%</th>
                     <th>PayOut</th>
                     
              
                 <%--   <th>Net Payout</th>   --%>   
                          
                             <%--<th>Mobile</th>--%>
                          
                            <th>PAN</th>
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
                              <asp:Button ID="Button1" runat="server" Text="Paid" CssClass="btn btn-block btn-success"   CommandName="Update" CommandArgument='<%#Eval("id") %>' /></td>
                     
                           
                        
                        
                          <td><%#Eval("username") %></td>
                          <td><%#Eval("name") %></td>
                     <td> <%#Eval("total") %></td>
              <td> <%#Eval("TDS") %></td>
              <td> <%#Eval("AdminCharge") %></td>
              <td> <%#Eval("Payout") %></td>
      
            <%--  <td> <%#Eval("BankPayment") %></td>--%>
                         <%-- <td><%#Eval("mobile") %></td>   --%>  
                        
                              <td><%#Eval("PanNumber") %></td>                     
                           <td><%#Eval("bankname") %></td>
                           <td><%#Eval("branchname") %></td>
                           <td><%#Eval("ifsc") %></td>
                            <td>'<%#Eval("AccountNumber") %></td>
                           <td><%#Eval("AccountHolderName") %></td>
                         <%--  <td><%#Eval("acctype") %></td>--%>

                           
                         
                             </tr>
                           </ItemTemplate>
                             <FooterTemplate>
                                  </FooterTemplate>
                       </asp:Repeater>
                                 <th>
                                     <td></td>
                                  
                                      <td class=" text text-bold ">Total</td>
                                     <td></td>
                                      <td class=" text text-bold "><asp:Label ID="lbTotal" runat="server" Text="0"></asp:Label></td>
                                     <td class=" text text-bold "><asp:Label ID="lbtds" runat="server" Text="0"></asp:Label></td>
                                     <td class=" text text-bold "><asp:Label ID="lbadminchrge" runat="server" Text="0"></asp:Label></td>
                                     <td class=" text text-bold "><asp:Label ID="lbpayout" runat="server" Text="0"></asp:Label></td>
                                    
                                     <%--<td class=" text text-bold "><asp:Label ID="lbbankpayout" runat="server" Text="0"></asp:Label></td>--%>
                                     
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                      <td></td>
                                      <td></td>


                                 </th>
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
        

    
         

</asp:Content>


