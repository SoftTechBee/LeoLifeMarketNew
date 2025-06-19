<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="shop - Copy.aspx.cs" Inherits="User_Default" %>

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

                           
                                 <p class="page-title"><b>Products</b></p>
                       <div class="notification-box" style="text-align:right">
                          <a href="PurchaseHistory.aspx"><b>My Cart</b> <i class="fa fa-cart-plus text-danger  " ></i></a>
                           <span id="lbcart" runat="server" class="dot-animated"></span>

                       </div>
                      
                           
                            </div>
             <div class="row">
                  <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
      
         <ItemTemplate>
                    <div class="col-xl-4 col-lg-6 col-sm-6 mb-4">
                        <div class="card" style="border: 1px solid black;">
                            <div class="card-body">
                                <div class="new-arrival-product">
                                    <div class="new-arrivals-img-contnent" style="border: 1px solid red">
                                        <img class="img-fluid" src='<%#Eval("ImgUrl") %>' alt="">
                                    </div>
                                    <div class="new-arrival-content mt-3">
                                        <h5 class=" text-danger"><b><asp:Label ID="lbproduct" runat="server" Text='<%#Eval("Product") %>'></asp:Label>
                                          </b><br /></h5>
                                      
                                        <span class="price">Amount: <b class="text-primary ">₹<asp:Label ID="lbDP" runat="server"  CssClass="bold text-primary " Text='<%#Eval("DP") %>'></asp:Label></b></span><br />
                                        <span class="price">Capping: <b >₹<asp:Label ID="lbcapping" runat="server"  CssClass="bold  " Text='<%#Eval("DirectCommision") %>'></asp:Label></b></span><br />
                                        <span class="price">PV: <b><asp:Label ID="lbbv" runat="server" Text='<%#Eval("Soldrate") %>'></asp:Label></b></span>
                                    </div>
                                    
                                        <span class="price d-none">MRP: <b class="text-danger text-decoration-line-through">₹<asp:Label ID="lbmrp"  runat="server" Text='<%#Eval("MRP") %>'></asp:Label></b></span><br />
                                        <span class="price d-none">Save: <b class="text-success">₹<%#Eval("Discount") %></b></span><br />
                                       
                                    <div class="p-0 text-center">
                                          <td> <asp:Button ID="Button1" runat="server" Text="+ Add To Cart" CssClass="btn btn-warning " CommandArgument='<%#Eval("pid") %>' CommandName="Click" /> </td>
											</div>
                                </div>
                            </div>
                        </div>
                    </div>
              </ItemTemplate>
      
    </asp:Repeater>
					</div>
					</div>
					</div>
		
</asp:Content>

