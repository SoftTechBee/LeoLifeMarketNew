<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="PayOutReport.aspx.cs" Inherits="User_payout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
           <div class="card ">
                            <div class="card-body">
              <h3> Member Payout</h3>
          
<div class="form-group row">
                     
           <div class=" col-lg-10">
               </div>

 <div class=" col-lg-1">
                   <asp:Button ID="btnExportToExcel" CssClass="btn btn-sm   btn-warning" Text="ExportToExcel" OnClick="btnExportToExcel_Click"  runat="server"/>
                  </div>
                 </div>

         <hr />
             <div class="form-group raw">
                 
                    <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="overflow:auto;">
                         <asp:Repeater ID="Repeater1" runat="server">
                             <HeaderTemplate>
                   <table class="table table-bordered table-hover table-responsive table-striped" >
                       <tr>
                           <th>#</th>
                           <th>Member</th>
                            <th>Name</th>
                             <th>Mobile</th>
                             <%--<th>IncomeType</th>--%>
                             <th>DateOfPayout</th>
                             <th>Bank</th>
                           <th>Brench</th>
                           <th>IFSC</th>
                           <th>AccNo</th>
                           <th>AccHolder</th>
                           <%--  <th>Pancard</th>
                            <th>Aadhar Card</th>
                          
                         <th>Acc Type</th>--%>
                           <th>Total Income</th>
                     <th>TDS 2%</th>
                     <th>Admin Charge 13%</th>
                    <%-- <th>Trading Charge 10%</th>--%>
                     <th>PayOut</th>
                  <%--   <th>BM-Wallet</th>--%>
                    <th>Bank Payout</th>      
                          
                        <th>Status </th>  
                       </tr>
                     
                      </HeaderTemplate>
                           <ItemTemplate>
                           <tr>
                           <td><%# Container.ItemIndex+1 %></td>
                           <td><%#Eval("username") %></td>
                          <td><%#Eval("name") %></td>
                          <td><%#Eval("mobile") %></td>
                          <%--<td><%#Eval("Type") %></td>--%>
                                 <td><%#DataBinder.Eval(Container.DataItem, "date", "{0:dd/MM/yyyy}")%></td>
         
                       <%--   <td><%#Eval("pan") %></td>   
                           <td><%#Eval("aadhar") %></td>                      
                          
                           
                         <%--  <td><%#Eval("acctype") %></td>--%>
                                <td><%#Eval("bankname") %></td>
                           <td><%#Eval("branchname") %></td>
                           <td><%#Eval("ifsc") %></td>
                           <td>'<%#Eval("AccountNumber") %></td>
                               <td><%#Eval("AccountHolderName") %></td>
                            <td> <%#Eval("total") %></td>
              <td> <%#Eval("TDS") %></td>
              <td> <%#Eval("AdminCharge") %></td>
                                     <%-- <td> <%#Eval("Wallet") %></td>--%>
              <td> <%#Eval("Payout") %></td>
       
              <td> <%#Eval("BankPayment") %></td>
                      <td> <%#Eval("status") %></td>     
                             </tr>
                           </ItemTemplate>
                             <FooterTemplate>
  </table>
                             </FooterTemplate>
                       </asp:Repeater>
                     
                 
                </div>

                 <!---table end----->
             </div>
                      <!---group end----->
                 </div>
                 <!---box form end----->

               
            </div>
                 <!---box body end----->

         <!---box  end----->

       
    <!---container end----->

    
         

</asp:Content>
