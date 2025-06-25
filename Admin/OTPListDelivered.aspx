<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="OTPListDelivered.aspx.cs" Inherits="User_TopUpWallet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
          
 
         <div class="alert alert-danger dark alert-dismissible fade show" role="alert" id="danger"  runat="server"  visible="false">
         
          <p>  
              <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> </p>
                    <button class="btn-close" type="button" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
              
                <div class="row">
                    <div class="col-12 align-self-center">
                        <h5 class="page-title">Success Delivered</h5>
                    </div>
                 
                </div>

 
        
       
   
        <div class="container-fluid">
       <div class="row">
<div  class="col-lg-12">
           <div class="card " >
      
                            <div class="card-body">
            
   <asp:Label ID="lbname" runat="server" Text="" Visible="false"></asp:Label>
           
<div class="form-group row">
     <label class="control-label col-lg-4">UserName / InvoiceNo / DeliveryOTP</label>
            <div class="input-group date col-lg-8" >
           <asp:TextBox ID="txtsearch" CssClass="form-control" runat="server" placeholder="Enter UserName / InvoiceNo / DeliveryOTP"></asp:TextBox>
               
          <asp:Button ID="btnsearch" OnClick="btnsearch_Click" runat="server" Text="Search!" CssClass="btn btn-info btn-flat btn-sm"  />
                    
                   
              </div>
              </div>
<div class="form-group row">
            <div class="col-lg-12" style="overflow:auto">
                <table id="example1" class="table table-bordered table-striped table-hover " style="cellspacing:0;width:100%">
                <thead>
                <tr>
                    <th >#</th>
                      <th>Delivery Status</th>
                      <th>Delivery OTP</th>
                  <th>UserName</th>
                  <th>InvoiceDate</th>
                   <th>InvoiceNumber</th>
                   <th>Total Product</th>
                   <th>Total Amount</th>
                   <th>Delivery Time</th>
                   <%-- <th>Total DP</th>
                    <th>Total Discount</th>
                      <th>Total PV</th>--%>
                   <%--   <th>Action</th>--%>
                  
                  
                </tr>
                </thead>
                <tbody>
<asp:Repeater ID="Repeater1" runat="server"  OnItemCommand="Repeater1_ItemCommand">
   
    <ItemTemplate>
        <tr>
            <td> <%# Container.ItemIndex+1 %></td>
               <td > <asp:label ID="Label1" CssClass ="btn btn-sm btn-success  " runat="server" Text='<%#Eval("DeliveryStatus") %>'></asp:label>  </td>
               <td> <%#Eval("DeliveryOTP") %></td>

                 <td><asp:label ID="lbusername" runat="server" Text='<%#Eval("UserName") %>'></asp:label></td>
              <td><%#DataBinder.Eval(Container.DataItem, "DOI", "{0:dd/MMM/yyyy}")%></td>
             <td> <%#Eval("InvoiceNo") %></td>
             <td> <%#Eval("qty") %></td>

             <td> <%#Eval("TotalAmt") %></td>
              <td><%#DataBinder.Eval(Container.DataItem, "DeliveredDate", "{0:dd/MM/yyyy hh:mm:ss}")%></td>

            <%-- <td> <%#Eval("PaidAmt") %></td>
               <td> <%#Eval("DiscountAmt") %></td>
               <td> <%#Eval("TotalBV") %></td>--%>
          <%--   <td> <asp:Button ID="Button1" runat="server" Text="Debit" CssClass="btn  btn-sm btn-danger" CommandArgument='<%#Eval("DeliveryOTP") %>' CommandName="View" /> </td>
           --%>
        </tr>
    </ItemTemplate>

</asp:Repeater>
         </tbody>
               
              </table> 
                
                  
            
                
            </div>
    </div>
                                
                 
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
           
</div>


    

<!-- page script -->
      
</asp:Content>


