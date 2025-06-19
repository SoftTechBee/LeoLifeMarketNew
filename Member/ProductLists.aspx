<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="ProductLists.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="page-body">
          <!-- Container-fluid starts-->
          <div class="container-fluid dashboard-default-sec">
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
               <div class="alert alert-success dark alert-dismissible fade show" role="alert" id="sccess"  runat="server"  visible="false">
         
          <p>  
              <asp:Label ID="lbsuccess" runat="server" Text="There is  some thing wrong........."></asp:Label> </p>
                    <button class="btn-close" type="button" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
             
             
             
           </div>
                 <div class="alert alert-light  dark ">

                           
                           <p class="page-title"><b> <asp:label ID="lbpack"     runat="server"  CssClass="text-danger" Text="0" ></asp:label> Product Details</b></p>
                       <div class="notification-box" style="text-align:right">
                          <a href="PurchaseHistory.aspx"><b>My Cart</b> <i class="fa fa-cart-plus text-danger  " ></i></a>
                           <span id="lbcart" runat="server" class="dot-animated"></span>

                       </div>
                      
                           
                            </div>



              <div class="form-group row">
            <div class="col-lg-12" style="overflow:auto">
                <table id="example1" class="table table-bordered table-striped table-hover " style="cellspacing:0;width:100%">
                <thead>
                <tr>
                    <th >#</th>
                  <th>Product </th>
                  <th>Product Name</th>
                   <th>MRP</th>
                    <th> DP</th>
                    <th> Discount</th>
                      <th> PV</th>
                      <th> Qty</th>
                      <th>View</th>
                  
                  
                </tr>
                </thead>
                <tbody>
 <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
    <ItemTemplate>
        <tr>
            <td> <%# Container.ItemIndex+1 %></td>
              <td>
    <img id="lbimg" runat="server" src='<%#Eval("Imgurl") %>' height="50" width="50" 
         class="img-thumbnail" style="cursor:pointer" data-bs-toggle="modal" data-bs-target="#imageModal" onclick="showImage(this.src)" /></td>
              <td><asp:Label ID="lbproduct" runat="server" Text='<%#Eval("Product") %>'></asp:Label></td>
             <td> <asp:Label ID="lbmrp"  runat="server" Text='<%#Eval("MRP") %>'></asp:Label></td>
             <td> <asp:Label ID="lbDP" runat="server"  CssClass="bold text-primary " Text='<%#Eval("DP") %>'></asp:Label></td>

             <td> <%#Eval("Discount") %></td>
             <td><asp:Label ID="lbbv" runat="server" Text='<%#Eval("Soldrate") %>'></asp:Label></td>
             <td><asp:Dropdownlist ID="lbqty" runat="server"  CssClass="form-control">
                 <asp:ListItem >1</asp:ListItem>
                 <asp:ListItem >2</asp:ListItem>
                 <asp:ListItem >3</asp:ListItem>
                 <asp:ListItem >4</asp:ListItem>
                 <asp:ListItem >5</asp:ListItem>
                 <asp:ListItem >6</asp:ListItem>
                 <asp:ListItem >7</asp:ListItem>
                 <asp:ListItem >8</asp:ListItem>
                 <asp:ListItem >9</asp:ListItem>
                 <asp:ListItem >10</asp:ListItem>

                 </asp:Dropdownlist>

             </td>
            
              
             <td> <asp:Button ID="Button1" runat="server" Text="+ Add" CssClass="btn btn-warning " CommandArgument='<%#Eval("pid") %>' CommandName="Click" /> </td>
           
        </tr>
    </ItemTemplate>

</asp:Repeater>
         </tbody>
               
              </table> 
                
                  
            
                
            </div>
    </div>
                                
            
					</div>
					</div>
    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-body text-center">
        <img id="modalImage" src="" class="img-fluid" />
      </div>
    </div>
  </div>
</div>
		<script>
            function showImage(src) {
                document.getElementById("modalImage").src = src;
            }
        </script>

    <asp:HiddenField runat="server" ID="hndpackid" />
</asp:Content>

