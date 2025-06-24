<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="PayoutView.aspx.cs" Inherits="Admin_PayoutView" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                                    <h3>Payout Master View  </h3>
                                    <div class="form-group row">
                   
<div class=" col-lg-8">
    </div>
 <div class=" col-lg-4">
                   <asp:Button ID="btnExportToExcel" CssClass="btn btn-block btn-success" Text="ExportToExcel" OnClick="btnExportToExcel_Click"  runat="server"/>
                </div>
                 </div>

         
             <div class="form-group row">
                 
                    <div class="col-sm-12" style="overflow:auto;">
                          <asp:Repeater ID="Repeater1" runat="server">
                              <HeaderTemplate>
                   <table class="table table-bordered table-hover table-responsive table-striped" >
                       <tr>
                           <th>#</th>
                           <th>UserName</th>
                            <th>Name</th>
                             <th>Mobile</th>
                             <th>Pancard</th>
                            <th>Bank</th>
                           <th>Brench</th>
                           <th>IFSC</th>
                           <th>AccNo</th>
                           <th>AccHolder</th>
                           <th>IncomeType</th>
                          <%-- <th>Acc Type</th>--%>
                           <th>PayOut</th>
                            <th>AdmCharge</th>
                            <th>TDS</th>
                           <%-- <th>Advance</th>--%>
                            <th>Total</th>                         
                           <th>Date</th>
                         
                       </tr></HeaderTemplate>
                    
                     
                           <ItemTemplate>
                           <tr>
                           <td><%# Container.ItemIndex+1 %></td>
                           <td><%#Eval("username") %></td>
                          <td><%#Eval("name") %></td>
                          <td><%#Eval("mobile") %></td>
                          <td><%#Eval("pan") %></td>                         
                           <td><%#Eval("bankname") %></td>
                           <td><%#Eval("branchname") %></td>
                           <td><%#Eval("ifsc") %></td>
                           <td><%#Eval("accno") %></td>
                           <td><%#Eval("holdername") %></td>
                          <%-- <td><%#Eval("acctype") %></td>--%>
                               <td> <%#Eval("Type") %></td>
                           <td><%#Eval("PayOut") %></td>
                          <td><%#Eval("AdminCharge") %></td>
                          <td><%#Eval("TDS") %></td>
                               <%--<td><%#Eval("Wallet") %></td>--%>
                          <td><%#Eval("Total") %></td>
                          
                          <td><%#DataBinder.Eval(Container.DataItem, "date", "{0:dd-MM-yyyy}")%> </td>
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

            </div>
         <!---box  end----->

        </div>

    <!---container end----->

    
         

</asp:Content>

