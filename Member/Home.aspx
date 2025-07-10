<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Member_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
    .kyc-box {
      border-top: 5px solid orange;
      background-color: #fff;
      border-radius: 10px;
      padding: 15px 20px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      display: flex;
      align-items: center;
      font-family: Arial, sans-serif;
    }

    .kyc-icon {
      color: red;
      font-size: 24px;
      margin-right: 15px;
    }

    .kyc-text {
      display: flex;
      flex-direction: column;
    }

    .kyc-text span {
      font-size: 14px;
      color: #555;
    }

    .kyc-text .status {
      color: red;
      font-weight: bold;
      font-size: 16px;
    }
  </style>
    
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<!-- Timer value from server -->
<span id="timerDate" runat="server" style="display: none;"></span>

<!-- Countdown Display -->


<script>
    // Get date from span tag by ID
    var timerEndDate = document.getElementById("ContentPlaceHolder1_timerDate").innerText.trim();
    var endDate = new Date(timerEndDate.replace(' ', 'T'));

    var timerInterval = setInterval(function () {
        var now = new Date().getTime();
        var distance = endDate.getTime() - now;
        if (distance < 0) {
            clearInterval(timerInterval);
            document.getElementById("countdown").innerHTML = "⏰ Time's Up!";
            return;
        }

        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        document.getElementById("countdown").innerHTML =
            `⏳ ${days}d ${hours}h ${minutes}m ${seconds}s`;
    }, 1000);
</script>


    <div class="row">

        <div class="col-12 col-lg-6 col-xxl-3 d-flex flex-column mb-3">
            <div class="card rounded-4 w-100">
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between mb-1">
                        <div>
                            <p class="mb-1">Referral Link-Left</p>

                        </div>
                        <%--    <div class="wh-42 d-flex align-items-center justify-content-center rounded-circle bg-grd-danger">
                  <span class="material-icons-outlined fs-5 text-white">shopping_cart</span>
                </div>--%>
                    </div>
                    <div class="progress mb-0" style="height: 20px;">
                        &nbsp<asp:Label ID="lbreffsidLeft" CssClass="text-success" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="d-flex align-items-center mt-3 gap-2">

                        <p class="mb-0 font-13">copy for sharing..</p>

                        <div class="card-lable">

                            <span class="badge badge-sm text-bg-info " onclick="script: myFunction();">Copy</span>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-6 col-xxl-3 d-flex flex-column">
            <div class="card rounded-4 w-100">
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between mb-1">
                        <div>
                            <p class="mb-1">Referral Link-Right</p>

                        </div>

                    </div>

                    <div class="progress mb-0" style="height: 20px;">
                        &nbsp<asp:Label ID="lbreffsidRight" CssClass="text-success" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="d-flex align-items-center mt-3 gap-2">

                        <p class="mb-0 font-13">copy for sharing..</p>
                        <div class="card-lable">

                            <span class="badge badge-sm text-bg-info " onclick="script: myFunctionRight();">Copy</span>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="row align-items-center">

        <div class="col-12 col-lg mb-4">
            <h4 class="fw-normal mb-0 text-secondary">Welcome back,  <%=SessionData.Get<string>("name")%> (<%=SessionData.Get<string>("newuser")%>)</h4>
           
        </div>
  
    </div>
    <marquee onmouseover="this.stop()" onmouseout="this.start()">
        <h6>
            <span style="color: #4800ff">Updated News :-
                                       <asp:Label ID="lbhead" Font-Bold="true" Font-Size="Larger" Font-Underline="true" runat="server" Text='<%#Eval("tittle")%>'></asp:Label>
                :
                <asp:Label ID="lbnews" Font-Bold="true" Font-Size="Larger" runat="server" CssClass="text-secondary" Text='<%#Eval("news")%>'>
                </asp:Label></span></h6>

    </marquee>
     <div class="kyc-box">
    <div class="kyc-icon">
  <%--  <i runat="server" id="icnss" class="fas fa-times-circle" style="color:red; "></i>

        <i runat="server" id="icnSuccess" class="fas fa-check-circle" style="color:green;"></i>--%>

        <i runat="server" id="iconcss" class="fas fa-hourglass-half" style="color:orange; "></i>

    </div>
    <div class="kyc-text">
      <span>KYC STATUS</span>
      <span class="status"><asp:Label runat="server" ID="lbkycstatus" Text="Pending"></asp:Label></span>
    </div>
  </div>
    <br />
    <div class="row">
        <div class="col-12 col-lg-6 col-xl-6 mb-4">
            <div class="card adminuiux-card position-relative overflow-hidden bg-theme-1 h-100">
                <div class="position-absolute top-0 start-0 h-100 w-100 z-index-0 coverimg opacity-50">
                    <img src="../assets/img/modern-ai-image/flamingo-4.jpg" alt="">
                </div>
                <div class="card-body z-index-1">
                    <div class="row align-items-center justify-content-center h-100 py-4">
                        <div class="col-11">
                            <div runat="server" id="activetitle" visible="true">
                            <h4  class="fw-normal text-warning">Activation Time Left</h4>
                            <div id="countdown"  style="font-size: 30px; font-weight: bold; color:white;"></div>
                  </div>
                                <hr />    <%--     <h4 class="fw-normal">Your Available Income</h4>
                            <h1 class="mb-3">₹<asp:Label ID="lbbalance" runat="server" Text="0"></asp:Label></h1>--%>
                            <p>Date Of Join: <span class="badge  badge-sm text-bg-warning">
                                <asp:Label ID="lbDOJ" runat="server" Text="N/A"></asp:Label></span></p>
                            <p>Acount Status: <span class="badge badge-sm text-bg-warning">
                                <asp:Label ID="lbstatus" runat="server" Text="N/A"></asp:Label></span></p>
                            <p>Current Package: <span class="badge badge-sm text-bg-warning">
                                <asp:Label ID="lbpack" runat="server" Text="N/A"></asp:Label></span></p>
                            <p>Mobile: <span class="badge badge-sm text-bg-warning">
                                <asp:Label ID="lbmobile" runat="server" Text="N/A"></asp:Label></span></p>
                            <p>Email: <span class="badge badge-sm text-bg-warning">
                                <asp:Label ID="lbemail" runat="server" Text="N/A"></asp:Label></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-6 col-xl-6 mb-4">
            <div class="card adminuiux-card">
                <div class="row gx-0">
                    <div class="col-12 col-xl-12">
                        <div class="card-header">
                            <h6>E-WALLETS</h6>
                        </div>
                        <div class="card-body pb-0">
                            <div class="card adminuiux-card bg-theme-1 mb-3">
                                <div class="card-body">
                                    <h5 class="text-white mb-2"><img src="../assets/images/apps/wallet.png" alt="icon" style="height:30px; width:30px;" class="me-1" />Fund Wallet</h5>
                                    <h4 class="fw-medium">₹<asp:Label ID="lbAvailabledeposit" runat="server" Text="0"></asp:Label>
                                        <span class="text-white fs-14">
                                            <i class="bi bi-arrow-up-short me-1"> Available</i>
                                        </span>
                                    </h4>
                                </div>
                            </div>
                            <div class="card adminuiux-card bg-theme-1-subtle mb-3">
                                <div class="card-body">
                                    <h5 class="text-secondary mb-2"> <img src="../assets/images/apps/wallet.png" alt="icon" style="height:30px; width:30px;" class="me-1" />Coupan Wallet</h5>
                                    <h4 class="fw-medium">₹<asp:Label ID="lbcoupanbalnc" runat="server" Text="0"></asp:Label>
                                        <span class="text-success fs-14">
                                            <i class="bi bi-arrow-up-short me-1">Available</i>
                                        </span>
                                    </h4>
                                </div>
                            </div>
                              <div class="card adminuiux-card bg-theme-1-subtle mb-3">
                                <div class="card-body">
                                    <h5 class="text-secondary mb-2"><img src="../assets/images/apps/wallet.png" alt="icon" style="height:30px; width:30px;" class="me-1" />Purchase Wallet</h5>
                                    <h4 class="fw-medium">₹<asp:Label ID="lbpurchasewallet" runat="server" Text="0"></asp:Label><span class="text-success fs-14">
                                        <i class="bi bi-arrow-up-short me-1"> Total</i>
                                    </span></h4>
                                </div>
                            </div>
                            
                          <%--  <div class="card adminuiux-card bg-theme-1-subtle mb-3">
                                <div class="card-body">
                                    <p class="text-secondary mb-2">Deposit Fund</p>
                                    <h4 class="fw-medium">₹<asp:Label ID="lbdeposit" runat="server" Text="0"></asp:Label><span class="text-success fs-14">
                                        <i class="bi bi-arrow-up-short me-1"> Total</i>
                                    </span></h4>
                                </div>
                            </div>--%>
                        </div>
                    </div>

                </div>
            </div>
        </div>

   <%--     <div class="row">
            <div class="col-12 col-sm-6 col-md-6">
                <div class="card adminuiux-card mb-4">
                    <div class="card-body z-index-1">
                        <div class="row">
                            <div class="col-auto">
                                <div class="avatar avatar-60 bg-success-subtle text-success rounded">
                                    <i class="bi bi-graph-down-arrow h4"></i>
                                </div>
                            </div>
                            <div class="col">
                                <h4 class="fw-medium">₹<asp:Label ID="lbtotalrepurchase" runat="server" Text="0"></asp:Label></h4>
                                <p class="text-secondary">
                                    Investment <span class="text-success fs-14">
                                        <i class="bi bi-arrow-up"></i>₹
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6">
                <div class="card adminuiux-card mb-4">
                    <div class="card-body z-index-1">
                        <div class="row">
                            <div class="col-auto">
                                <div class="avatar avatar-60 bg-danger-subtle text-danger rounded">
                                    <i class="bi bi-graph-up-arrow h4"></i>
                                </div>
                            </div>
                            <div class="col">
                                <h4 class="fw-medium">₹<asp:Label runat="server" ID="lbTotalIncome" Text="0.0"></asp:Label></h4>
                                <p class="text-secondary">
                                    Total Income <span class="text-success fs-14">
                                        <i class="bi bi-arrow-up"></i>₹
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-lg-6">
                <div class="card adminuiux-card mb-4">
                    <div class="card-body z-index-1">
                        <div class="row">
                            <div class="col-auto">
                                <div class="avatar avatar-60 bg-theme-1-subtle text-theme-1 rounded">
                                    <i class="bi bi-bank h4"></i>
                                </div>
                            </div>
                            <div class="col">
                                <h4 class="fw-medium">₹<asp:Label runat="server" ID="lbDirectBusiness" Text="0.0"></asp:Label></h4>
                                <p class="text-secondary">
                                    Direct Business <span class="text-success fs-14">
                                        <i class="bi bi-arrow-up"></i>₹
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="card adminuiux-card mb-4">
                    <div class="card-body z-index-1">
                        <div class="row">
                            <div class="col-auto">
                                <div class="avatar avatar-60 bg-theme-1-subtle text-theme-1 rounded">
                                    <i class="bi bi-cash-coin h4"></i>
                                </div>
                            </div>
                            <div class="col">
                                <h4 class="fw-medium">
                                    <asp:Label ID="lbwithdrawapprove" runat="server" Text="0"></asp:Label></h4>
                                <p class="text-secondary">
                                   Total Withdraw<span class="text-success fs-14"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="col-xl-6 col-xxl-6 d-flex align-items-stretch mb-3">
            <div class="card adminuiux-card  rounded-4 w-100">
                <div class="card-body">
                    <div class="d-flex align-items-start justify-content-between mb-3">
                        <div class="">
                            <h5 class="mb-0">Team Left/Right</h5>
                        </div>
                        <div class="dropdown">
                            <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle"
                                data-bs-toggle="dropdown"></a>


                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-middle mb-0">
                            <thead>
                                <tr>
                                    <th class="fw-bold text-info">Team <i class="me-1 bi   bi-person-add"></i></th>
                                    <th class="fw-bold text-info">Left <i class="me-1 bi   bi-person-add"></i></th>
                                    <th class="fw-bold text-info">Right <i class="me-1 bi   bi-person-add"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Total Team </h6>
                                          
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbLeftTeam" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbRightTeam" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Active Team</h6>
                                              
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbActiveleftteam" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbActiveRightteam" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Inactive Team</h6>
                                             
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbInActiveLeftteam" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbInActiveRightteam" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Total Direct </h6>
                                     
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbTotalLeftDirect" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbTotalRightDirect" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Active Direct</h6>
                                           
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbActiveDirectLeft" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbActiveDirectRight" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Inactive Direct</h6>
                                            
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbinActiveDirectLeft" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="lbinActiveDirectRight" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="col-xl-6 col-xxl-6 d-flex align-items-stretch mb-3">
            <div class="card adminuiux-card  rounded-4 w-100">
                <div class="card-body">
                    <div class="d-flex align-items-start justify-content-between mb-3">
                        <div class="">
                            <h5 class="mb-0">Summary</h5>
                        </div>
                        <div class="dropdown">
                            <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle"
                                data-bs-toggle="dropdown"></a>


                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-middle mb-0">
                            <thead>
                                <tr>
                                    <th class="fw-bold text-info">PV'S <i class="me-1 bi   bi-person-add"></i></th>
                                    <%--<th class="fw-bold text-info">Left <i class="me-1 bi   bi-person-add"></i></th>--%>
                                    <th class="fw-bold text-info">Total <i class="me-1 bi bi-graph-up"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Total Left PV </h6>
                                       
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="leftpv" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                 
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Total Right PV</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="rightpv" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                               
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Today Left PV</h6>
                                              
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="todayLeftpv" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Today Right PV</h6>
                                              
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="todayrightpv" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Left Carry Forward PV</h6>
                                              
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="Availableleftpv" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center flex-row gap-3">
                                            <div class="">
                                                <h6 class="mb-0">Right Carry Forward PV</h6>
                                              
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="mb-0">
                                            <asp:Label ID="Availablerightpv" runat="server" Text="0"></asp:Label></h5>
                                    </td>
                                
                                </tr>
                               
                         
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-sm-3 col-lg-3 col-xl-3 mb-4">
                <div class="card adminuiux-card">
                    <div class="card-body border-top rounded-1 border-warning border-5 ">
                        <h3 class="text-secondary small mb-1"><img src="../assets/images/apps/salary.png" alt="icon" style="height:30px; width:30px;" class="me-1" /> Direct Sponsor Bonus</h3>
                        <h4 class="mb-2">
                            <asp:Label ID="lblDirectRefer" runat="server" Text="0"></asp:Label>
                            <%=SessionData.Get<string>("Currency")%></h4>
                        <span class="badge badge-light text-bg-primary">
                            <a href="rptDirectIncome.aspx"><i class="me-1 bi bi-list-check "></i>View</a>

                        </span>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-3 col-lg-3 col-xl-3 mb-4">
                <div class="card adminuiux-card">
                    <div class="card-body border-top rounded-1 border-warning border-5 ">
                        <h3 class="text-secondary small mb-1"> <img src="../assets/images/apps/salary.png" alt="icon" style="height:30px; width:30px;" class="me-1" />Matching  Bonus</h3>
                        <h4 class="mb-2">
                            <asp:Label ID="lblMatchingBinary" runat="server" Text="0"></asp:Label>
                            <%=SessionData.Get<string>("Currency")%></h4>
                        <span class="badge badge-light text-bg-primary">
                            <a href="rptMatchingBinaryIncome.aspx"><i class="me-1 bi bi-list-check "></i>View</a>

                        </span>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-3 col-lg-3 col-xl-3 mb-4">
                <div class="card adminuiux-card">
                    <div class="card-body border-top rounded-1 border-warning border-5 ">
                        <h3 class="text-secondary small mb-1"> <img src="../assets/images/apps/salary.png" alt="icon" style="height:30px; width:30px;" class="me-1" />Refral Matching Bonus</h3>
                        <h4 class="mb-2">
                            <asp:Label ID="lblDirectMatchingBonus" runat="server" Text="0"></asp:Label>
                            <%=SessionData.Get<string>("Currency")%></h4>
                        <span class="badge badge-light text-bg-primary">
                            <a href="rptDirectReferIncome.aspx"><i class="me-1 bi bi-list-check "></i>View</a>

                        </span>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-3 col-lg-3 col-xl-3 mb-4">
                <div class="card adminuiux-card">
                    <div class="card-body border-top rounded-1 border-warning border-5 ">
                        <h3 class="text-secondary small mb-1"><img src="../assets/images/apps/salary.png" alt="icon" style="height:30px; width:30px;" class="me-1" />Total Reward Bonus</h3>
                        <h4 class="mb-2">
                            <asp:Label ID="lbrewardincome" runat="server" Text="0"></asp:Label>
                            <%=SessionData.Get<string>("Currency")%></h4>
                        <span class="badge badge-light text-bg-primary">
                            <a href="rptRewardIncome.aspx"><i class="me-1 bi bi-list-check "></i>View</a>

                        </span>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-3 col-lg-3 col-xl-3 mb-4">
                <div class="card adminuiux-card">
                    <div class="card-body border-top rounded-1 border-warning border-5 ">
                        <h3 class="text-secondary small mb-1"> <img src="../assets/images/apps/salary.png" alt="icon" style="height:30px; width:30px;" class="me-1" />Salary  Bonus</h3>
                        <h4 class="mb-2">
                            <asp:Label ID="lblSalary" runat="server" Text="0"></asp:Label>
                            <%=SessionData.Get<string>("Currency")%></h4>
                        <span class="badge badge-light text-bg-primary">
                            <a href="rptSalaryIncome.aspx"><i class="me-1 bi bi-list-check "></i>View</a>

                        </span>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-3 col-lg-3 col-xl-3 mb-4">
                <div class="card adminuiux-card">
                    <div class="card-body border-top rounded-1 border-warning border-5 " >
                        <h3 class="text-secondary small mb-1"><img src="../assets/images/apps/salary.png" alt="icon" style="height:30px; width:30px;" class="me-1" />Total  Income</h3>
                        <h4 class="mb-2">
                            <asp:Label ID="lbTotalIncome" runat="server" Text="0"></asp:Label>
                            <%=SessionData.Get<string>("Currency")%></h4>
                        <span class="badge badge-light text-bg-primary">
                            <a href="rptSalaryIncome.aspx"><i class="me-1 bi bi-list-check "></i>View</a>

                        </span>
                    </div>
                </div>
            </div>
           <%-- <div class="col-12 col-sm-3 col-lg-3 col-xl-3 mb-4">
                <div class="card adminuiux-card">
                    <div class="card-body border-top rounded-1 border-warning border-5 ">
                        <h3 class="text-secondary small mb-1"><img src="../assets/images/apps/salary.png" alt="icon" style="height:30px; width:30px;" class="me-1" />Total Withdraw</h3>
                        <h4 class="mb-2">
                            <asp:Label ID="lbwithdrawapprove" runat="server" Text="0"></asp:Label>
                            <%=SessionData.Get<string>("Currency")%></h4>
                        <span class="badge badge-light text-bg-primary">
                            <a href="rptSalaryIncome.aspx"><i class="me-1 bi bi-list-check "></i>View</a>

                        </span>
                    </div>
                </div>
            </div>--%>
               <%--<div class="col-12 col-sm-3 col-lg-3 col-xl-3 mb-4">
                <div class="card adminuiux-card">
                    <div class="card-body">
                        <p class="text-secondary small mb-2">Total Business</p>
                        <h4 class="mb-3">
                            <asp:Label ID="lbtotalbusiness" runat="server" Text="0"></asp:Label></h4>
                        <span class="badge badge-light text-bg-primary">Current
                        </span>
                    </div>
                </div>
            </div>
              <div class="col-12 col-sm-3 col-lg-3 col-xl-3 mb-4">
                <div class="card adminuiux-card">
                    <div class="card-body">
                        <p class="text-secondary small mb-2">Left Side Business </p>
                        <h4 class="mb-3">
                            <asp:Label ID="leftbusiness" runat="server" Text="0"></asp:Label></h4>
                        <span class="badge badge-light text-bg-success">Current
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-3 col-lg-3 col-xl-3 mb-4">
                <div class="card adminuiux-card">
                    <div class="card-body">
                        <p class="text-secondary small mb-2">Right Side Business</p>
                        <h4 class="mb-3">
                            <asp:Label ID="rightbusiness" runat="server" Text="0"></asp:Label></h4>
                        <span class="badge badge-light text-bg-success">Current
                        </span>
                    </div>
                </div>
            </div>--%>

        </div>



<%--        <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
                <div class="card-body">
                    <div class="d-flex align-items-start justify-content-between mb-3">
                        <div class="">
                            <h6 class="mb-0 fw-bold">Total PV/Business</h6>
                        </div>

                    </div>

                    <ul class="list-group list-group-flush">
                 
                       

                        <li class="list-group-item px-0 bg-transparent">
                            <div class="d-flex align-items-center gap-3">
                                <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
                                    <img src="../assets/images/favicon.png" width="32" alt="">
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-0">Left/Right Business</h6>
                                </div>
                                <div class="d-flex align-items-center gap-3">
                                    <p class="mb-0">
                                        <asp:Label ID="leftBV" runat="server" Text="0"></asp:Label>
                                    </p>
                                    /
                              <p class="mb-0">
                             <asp:Label ID="rightBV" runat="server" Text="0"></asp:Label>
                                     </p>
                                </div>
                            </div>
                        </li>



                    </ul>

                </div>
            </div>
        </div>--%>
 <%--       <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
                <div class="card-body">
                    <div class="d-flex align-items-start justify-content-between mb-3">
                        <div class="">
                            <h6 class="mb-0 fw-bold">Available PV/Business</h6>
                        </div>

                    </div>

                    <ul class="list-group list-group-flush">
                        <li class="list-group-item px-0 bg-transparent">
                            <div class="d-flex align-items-center gap-3">
                                <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
                                    <img src="../assets/images/favicon.png" width="32" alt="">
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-0">Left/Right PV</h6>
                                </div>
                                <div class="d-flex align-items-center gap-3">
                                    <p class="mb-0">
                                        <asp:Label ID="Availableleftpv" runat="server" Text="0"></asp:Label>
                                    </p>
                                    /
                             <p class="mb-0">
                            <asp:Label ID="Availablerightpv" runat="server" Text="0"></asp:Label>
                                    </p>
                                </div>
                            </div>
                        </li>

                        <li class="list-group-item px-0 bg-transparent">
                            <div class="d-flex align-items-center gap-3">
                                <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
                                    <img src="../assets/images/favicon.png" width="32" alt="">
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-0">Left/Right Business</h6>
                                </div>
                                <div class="d-flex align-items-center gap-3">
                                    <p class="mb-0">
                                        <asp:Label ID="AvailableleftBV" runat="server" Text="0"></asp:Label>
                                    </p>
                                    /
                            <p class="mb-0">
                         <asp:Label ID="AvailablerightBV" runat="server" Text="0"></asp:Label>
                                     </p>
                                </div>
                            </div>
                        </li>



                    </ul>

                </div>
            </div>
        </div>--%>

    </div>
    <style>

    </style>
   
    <input type="text" name="link" id="myInput" runat="server" value="" style="opacity: 0;">
    <input type="text" name="link" id="myInputRight" runat="server" value="" style="opacity: 0;">
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


</asp:Content>

