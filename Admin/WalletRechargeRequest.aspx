﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="WalletRechargeRequest.aspx.cs" Inherits="Admin_WalletRechargeRequest" %>

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
              <div class="alert alert-success alert-dismissible" id="sccess" runat="server"  visible="false">
              
                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                  <asp:Label ID="lbsuccess" runat="server" Text="Successfully updated................"></asp:Label>  
              </div>
            
         
 
    <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                                    <h3>Wallet Recharge Request  </h3>
                                    <div class="form-group row">
                   

    <%-- <div class=" form-group">
                    <label class="col-lg-2">FromDate</label>
                    <div class="col-lg-4">
                        <asp:TextBox ID="txtfromdate" required="" Type="date" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                         <label class="col-lg-2">ToDate</label>
                    <div class="col-lg-4">
                        <asp:TextBox ID="txttodate" Type="date" required="" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>--%>
               
                 
                
               
                    
                                   
                <div class="col-lg-12" style="overflow:auto;">
<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
    <HeaderTemplate>
   <table id="example1" class="table table-bordered table-striped table-hover" >
                <thead>
                <tr>
                  <tr>   <th >#</th>
                  <th>UserName</th>
                 
                  <th>Amount</th>
                <%--  <th>TCX COIN</th>--%>
                 <th>Status</th>
                        <th>Pyment Mode</th>
                 <th>UTR. No</th>
                      <th>Receipt</th>
                      <th>View</th>
                  <th>Date Of Request</th>
                   
                     <th>Approved</th>
                       <th>Reject</th>
                </tr>
                </thead>
                <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td> <%#Container.ItemIndex+1 %> </td>           
            
             <td>
          <asp:Label ID="lbname" runat="server" Text='<%#Eval("UserName") %>'></asp:Label> </td>
                <td>
          <asp:Label ID="lbamount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label> </td>
      <%-- <td>    <asp:Label ID="lbtcx" runat="server" Text='<%#Eval("remark") %>'></asp:Label> </td>--%>
         
             <td> <%#Eval("[Status]") %></td>
              <td> <asp:Label ID="lbpaymentmode" runat="server" Text='<%#Eval("PaymentMode") %>'></asp:Label> </td>
             <td> <asp:Label ID="lbutr" runat="server" Text='<%#Eval("ClientRemark") %>'></asp:Label></td>
           <td> <img src='<%#Eval("Receipt") %>' height="50" width="100" /></td>
            <td><a href='<%#Eval("Receipt") %>'>View</a></td>
             <td><%#DataBinder.Eval(Container.DataItem, "DOR", "{0:dd/MM/yyyy}")%></td>
          
            <td>
    <asp:Button ID="Button1"  runat="server" CssClass="btn btn-flat btn-success" OnClientClick="return confirmAction();" Text="Approved" CommandName="Approved"  CommandArgument='<%#Eval("RID")%>'/></td>
         <td>
    <asp:Button ID="Button2"  runat="server" CssClass="btn btn-flat btn-danger" OnClientClick="return confirmReject();" Text="Reject" CommandName="Reject"  CommandArgument='<%#Eval("RID")%>'/></td>
       
            </tr>
    </ItemTemplate>
<FooterTemplate>

     </tbody>
               
              </table>
</FooterTemplate>
</asp:Repeater>
             </div> 
                
            </div>
               
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
     <script>
        // The function below will start the confirmation dialog
        function confirmAction() {
            let confirmAction = confirm("Are you Sure to Approved this Request?");

            if (confirmAction) {
                // alert("Action Successfully executed");
                Processclick();

                return true;
            }
            else {
               // alert("Action Cancelled");
                return false;
            }
        }
        function confirmReject(){
            let confirmAction = confirm("Are you Sure to Reject this Request?");

            if (confirmAction) {
                // alert("Action Successfully executed");
                Processclick();
                return true;
            }
            else {
              //  alert("Action Cancelled");
                return false;
            }
        }
         function Processclick() {
             swal({
                 title: "Processing.......!",
                 text: "Note: Do Not press back or close the app? It will close in few seconds.",
                 imageUrl: "../SoftImg/refresh.gif",
                 timer: 2000000,
                 showConfirmButton: false
             });
         }
        
     </script>
    

<!-- page script -->
      
</asp:Content>




