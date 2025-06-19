<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Home1.aspx.cs" Inherits="Member_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <script type="text/javascript">

         function myFunction() {

             var copyText = document.getElementById('ContentPlaceHolder1_myInput');

             copyText.select();
             copyText.setSelectionRange(0, 99999); /*For mobile devices*/
             /* Copy the text inside the text field */
             document.execCommand("copy");
             /* Alert the copied text */

             alert("Copied the referral link: " + copyText.value);

         }
        function myFunctionRight() {

            var copyText = document.getElementById('ContentPlaceHolder1_myInputRight');

             copyText.select();
             copyText.setSelectionRange(0, 99999); /*For mobile devices*/
             /* Copy the text inside the text field */
             document.execCommand("copy");
             /* Alert the copied text */

             alert("Copied the referral link: " + copyText.value);

         }
       


    </script>
    <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3">Dashboard</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Home</li>
							</ol>
						</nav>
					</div>
					
				</div>
				<!--end breadcrumb-->
     
    
          <!--end row-->
      
        <div class="row">
             
             <div class="col-12 col-lg-6 col-xxl-3 d-flex flex-column">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="d-flex align-items-center justify-content-between mb-3">
                <div>
                  <p class="mb-1">Referral Link</p>
                  <h3 class="mb-0">Left</h3>
                </div>
                <div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-grd-danger">
                  <span class="material-icons-outlined fs-5 text-white">shopping_cart</span>
                </div>
              </div>
              <div class="progress mb-0" style="height:20px; ">
                  &nbsp<asp:Label ID="lbreffsidLeft"  CssClass="text-success"  runat="server" Text="0"></asp:Label>
              </div>
              <div class="d-flex align-items-center mt-3 gap-2">
                <div class="card-lable bg-success bg-opacity-10">
                  <p class="text-warning mb-0"  onclick="script: myFunction();">Copy</p>
                </div>
                <p class="mb-0 font-13">copy for sharing..</p>
              </div>
            </div>
          </div>
          </div>
                         <div class="col-12 col-lg-6 col-xxl-3 d-flex flex-column">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="d-flex align-items-center justify-content-between mb-3">
                <div>
                  <p class="mb-1">Referral Link</p>
                  <h3 class="mb-0">Right</h3>
                </div>
                <div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-grd-danger">
                  <span class="material-icons-outlined fs-5 text-white">shopping_cart</span>
                </div>
              </div>
              <div class="progress mb-0" style="height:20px; ">
                  &nbsp<asp:Label ID="lbreffsidRight"  CssClass="text-success"  runat="server" Text="0"></asp:Label>
              </div>
              <div class="d-flex align-items-center mt-3 gap-2">
                <div class="card-lable bg-success bg-opacity-10">
                  <p class="text-warning mb-0"  onclick="script: myFunctionRight();">Copy</p>
                </div>
                <p class="mb-0 font-13">copy for sharing..</p>
              </div>
            </div>
          </div>
          </div>
            </div>
    <div class="row row-cols-1 row-cols-lg-2 row-cols-xl-4 g-3 mb-4">
            <div class="col">
              <div class="card rounded-4 mb-0 border">
                <div class="card-body">
                 
                  <div class="">
                    <h5 class="mb-0 fw-light"><asp:Label ID="lblDirectRefer" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></h5>
                    <p class="mb-0 text-danger">Sponsor Income</p>
                  </div>
                  <div class="d-flex align-items-center justify-content-end gap-1 mt-3">
                    <p
                      class="dash-lable d-flex align-items-center gap-1 rounded mb-0 bg-warning text-danger bg-opacity-10">
                      <a href="rptDirectReferIncome.aspx" >View</a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card rounded-4 mb-0 border">
                <div class="card-body">
                 
                  <div class="">
                    <h5 class="mb-0 fw-light"><asp:Label ID="lblMatchingBinary" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></h5>
                    <p class="mb-0 text-danger">Binary Income</p>
                  </div>
                  <div class="d-flex align-items-center justify-content-end gap-1 mt-3">
                    <p
                      class="dash-lable d-flex align-items-center gap-1 rounded mb-0 bg-warning text-danger bg-opacity-10">
                      <a href="rptMatchingBinaryIncome.aspx" >View</a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card rounded-4 mb-0 border">
                <div class="card-body">
                 
                  <div class="">
                    <h5 class="mb-0 fw-light"><asp:Label ID="lbrewardincome" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></h5>
                    <p class="mb-0 text-danger">Reward Income</p>
                  </div>
                  <div class="d-flex align-items-center justify-content-end gap-1 mt-3">
                    <p
                      class="dash-lable d-flex align-items-center gap-1 rounded mb-0 bg-warning text-danger bg-opacity-10">
                      <a href="rptRewardIncome.aspx" >View</a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          <div class="col">
              <div class="card rounded-4 mb-0 border">
                <div class="card-body">
                 
                  <div class="">
                    <h5 class="mb-0 fw-light"><asp:Label ID="lblSalary" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></h5>
                    <p class="mb-0 text-danger">Salary Income</p>
                  </div>
                  <div class="d-flex align-items-center justify-content-end gap-1 mt-3">
                    <p
                      class="dash-lable d-flex align-items-center gap-1 rounded mb-0 bg-warning text-danger bg-opacity-10">
                      <a href="rptSalaryIncome.aspx" >View</a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
           

          </div>
                <div class="row">
          <div class="col-xxl-12 d-flex align-items-stretch">
            <div class="card w-100 overflow-hidden rounded-4">
              <div class="card-body position-relative p-4">
                <div class="row">
                  <div class="col-12 col-sm-4">
                    <div class="d-flex align-items-center gap-3 ">
                      <img src='<%=SessionData.Get<string>("profilepic")%>' class="rounded-circle bg-grd-info p-1"  width="60" height="60" alt="user">
                      <div class="">
                        <p class="mb-0 fw-semibold"><%=SessionData.Get<string>("newuser")%></p>
                        <h4 class="fw-semibold mb-0 fs-4 mb-0"><%=SessionData.Get<string>("name")%></h4>
                      </div>
                    </div>
                  
                  </div>
                  <div class="col-12 col-sm-7">
                 <marquee onMouseOver="this.stop()" onMouseOut="this.start()">
                                        <h6 > 
                                       <span style="color:#fff" ><%--Update News :---%>
                                       <asp:Label ID="lbhead" Font-Bold="true" Font-Size="Larger" Font-Underline="true" runat="server" Text='<%#Eval("tittle")%>' ></asp:Label>
                                           : <asp:Label ID="lbnews"  Font-Bold="true" Font-Size="Larger"  runat="server" CssClass="text-white" Text='<%#Eval("news")%>'>
                                             </asp:Label></span></h6>

                                    </marquee>
                  </div>
                </div><!--end row-->
              </div>
            </div>
          </div>
              
                       
            
           
           <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
          <div class="card rounded-4 w-100">
            <div class="card-body">
              <div class="d-flex align-items-start justify-content-between mb-3">
                <div class="">
                  <h5 class="mb-0">Team Left/Right</h5>
                </div>
                <div class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle"
                    data-bs-toggle="dropdown">
                    <span class="material-icons-outlined fs-5">more_vert</span>
                  </a>
                

                </div>
              </div>
              <div class="table-responsive">
                <table class="table align-middle mb-0 table-striped">
                  <thead>
                    <tr>
                      <th class="fw-bold text-warning">Team</th>
                      <th class="fw-bold text-warning">Left</th>
                      <th class="fw-bold text-warning">Right</th>
                    </tr>
                  </thead>
                  <tbody>
                   <tr>
  <td>
    <div class="d-flex align-items-center flex-row gap-3">
      <div class="">
        <h6 class="mb-0">Total </h6>
        <p class="mb-0">Team</p>
      </div>
    </div>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbLeftTeam" runat="server" Text="0"></asp:Label></h5>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbRightTeam" runat="server" Text="0"></asp:Label></h5>
  </td>
</tr>
<tr>
  <td>
    <div class="d-flex align-items-center flex-row gap-3">
      <div class="">
        <h6 class="mb-0">Active</h6>
        <p class="mb-0">Team</p>
      </div>
    </div>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbActiveleftteam" runat="server" Text="0"></asp:Label></h5>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbActiveRightteam" runat="server" Text="0"></asp:Label></h5>
  </td>
</tr>
<tr>
  <td>
    <div class="d-flex align-items-center flex-row gap-3">
      <div class="">
        <h6 class="mb-0">Inactive</h6>
        <p class="mb-0">Team</p>
      </div>
    </div>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbInActiveLeftteam" runat="server" Text="0"></asp:Label></h5>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbInActiveRightteam" runat="server" Text="0"></asp:Label></h5>
  </td>
</tr>
<tr>
  <td>
    <div class="d-flex align-items-center flex-row gap-3">
      <div class="">
        <h6 class="mb-0">Total </h6>
        <p class="mb-0">Direct</p>
      </div>
    </div>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbTotalLeftDirect" runat="server" Text="0"></asp:Label></h5>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbTotalRightDirect" runat="server" Text="0"></asp:Label></h5>
  </td>
</tr>
<tr>
  <td>
    <div class="d-flex align-items-center flex-row gap-3">
      <div class="">
        <h6 class="mb-0">Active</h6>
        <p class="mb-0">Direct</p>
      </div>
    </div>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbActiveDirectLeft" runat="server" Text="0"></asp:Label></h5>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbActiveDirectRight" runat="server" Text="0"></asp:Label></h5>
  </td>
</tr>
<tr>
  <td>
    <div class="d-flex align-items-center flex-row gap-3">
      <div class="">
        <h6 class="mb-0">Inactive</h6>
        <p class="mb-0">Direct</p>
      </div>
    </div>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbinActiveDirectLeft" runat="server" Text="0"></asp:Label></h5>
  </td>
  <td>
    <h5 class="mb-0"><asp:Label ID="lbinActiveDirectRight" runat="server" Text="0"></asp:Label></h5>
  </td>
</tr>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
             <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h6 class="mb-0 fw-bold">Fund Info</h6>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle" data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                   
                  </div>
                 </div>

                  <ul class="list-group list-group-flush">
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-primary">
                         <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Self Business</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbtotalrepurchase"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-success"> <a href="PurchaseHistory.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-warning">
                           <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Total Income</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbTotalIncome1"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-danger"> <a href="account.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
                           <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Total Withdrawal</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbwithdrawapprove"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-success"> <a href="WithdrawRequestlist.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-warning">
                          <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Available Income</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbbalance"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-danger"> <a href="account.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                 <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-primary">
                          <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Deposit Fund</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbdeposit"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-danger"> <a href="Wallet.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                  <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
                          <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Available Fund</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbAvailabledeposit"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-danger"> <a href="Wallet.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
             <%--     <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-success">
                          <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Income to Fund</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbincometofund"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-danger"> <a href="Incometofundreport.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                     --%>
                            
                  </ul>

              </div>
            </div>
          </div>
           
            <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h6 class="mb-0 fw-bold">Total PV/Business</h6>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle" data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                   
                  </div>
                 </div>

                  <ul class="list-group list-group-flush">
                    <li class="list-group-item px-0 bg-transparent"> 
                         <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Left/Right PV</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="leftpv" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="rightpv" runat="server" Text="0"></asp:Label></p>
    </div>
  </div>
</li>

 <li class="list-group-item px-0 bg-transparent"> 
                         <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Left/Right Business</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="leftBV" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="rightBV" runat="server" Text="0"></asp:Label></p>
    </div>
  </div>
</li>



         </ul>

              </div>
            </div>
          </div> 
            <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h6 class="mb-0 fw-bold">Available PV/Business</h6>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle" data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                   
                  </div>
                 </div>

                  <ul class="list-group list-group-flush">
                    <li class="list-group-item px-0 bg-transparent"> 
                         <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Left/Right PV</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="Availableleftpv" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="Availablerightpv" runat="server" Text="0"></asp:Label></p>
    </div>
  </div>
</li>

 <li class="list-group-item px-0 bg-transparent"> 
                         <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Left/Right Business</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="AvailableleftBV" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="AvailablerightBV" runat="server" Text="0"></asp:Label></p>
    </div>
  </div>
</li>



         </ul>

              </div>
            </div>
          </div> 
             
      <div class="col-xl-6 col-xxl-6 d-flex align-items-stretch">
            <div class="card  w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h5 class="mb-0 fw-bold">About</h5>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle"
                      data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                    
                  </div>
                 </div>
                 <div class="full-info">
                  <div class="info-list d-flex flex-column gap-3">
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">account_circle</span><p class="mb-0">Member ID: <asp:Label ID="lbusername" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">code</span><p class="mb-0">Member Name: <asp:Label ID="lbname" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">send</span><p class="mb-0">Date Of Join: <asp:Label ID="lbDOJ" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">send</span><p class="mb-0">Date Of Active: <asp:Label ID="lbDOA" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">done</span><p class="mb-0">Acount Status: <asp:Label ID="lbstatus" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">code</span><p class="mb-0">Current Package: <asp:Label ID="lbpack" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">call</span><p class="mb-0">Mobile: <asp:Label ID="lbmobile" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>

                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">send</span><p class="mb-0">Email: <asp:Label ID="lbemail" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                  </div>
                </div>
              </div>
            </div>
            </div>
            <div class="col-xl-6 col-xxl-6 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                  <div class="d-flex align-items-start justify-content-between">
                    <div class="">
                      <h5 class="mb-0">Business</h5>
                    </div>
                    <div class="dropdown">
                      <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle"
                        data-bs-toggle="dropdown">
                        <span class="material-icons-outlined fs-5">more_vert</span>
                      </a>
                     
                    </div>
                  </div>
                <div class="d-flex align-items-center gap-3 mt-4">
                     
                  <div class="mb-4">
                    <h1 class="mb-0"><asp:Label runat="server" ID="lbtotalbusiness" Text="0.0"></asp:Label> <%=SessionData.Get<string>("Currency")%></h1>
                  </div>
                  <div class="d-flex align-items-center align-self-end gap-2">
                    <span class="material-icons-outlined text-success">trending_up</span>
                  </div>
                </div>
                <p class="mb-4">Total Business</p>
                <div class="d-flex flex-column gap-3">
                  <div class="mb-4">
                    <p class="mb-1">Left Side <span class="float-end"><asp:Label runat="server" ID="leftbusiness" Text="0.0"></asp:Label></span> Business</p>
                    <div class="progress" style="height: 5px;">
                      <div class="progress-bar bg-grd-primary" style="width: 100%"></div>
                    </div>
                  </div>
                  <div class="">
                    <p class="mb-1">Right Side <span class="float-end"><asp:Label runat="server" ID="rightbusiness" Text="0.0"></asp:Label></span> Business</p>
                    <div class="progress" style="height: 5px;">
                      <div class="progress-bar bg-grd-warning" style="width: 100%"></div>
                    </div>
                  </div>
                 
                </div>
              </div>
            </div>
                </div>
          
     


           
          
        </div>

     <input type="text" name="link" id="myInput" runat="server" value="" style="opacity: 0;">
     <input type="text" name="link" id="myInputRight" runat="server" value="" style="opacity: 0;">


</asp:Content>

