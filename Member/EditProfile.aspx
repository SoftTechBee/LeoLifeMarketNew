<%@ Page Title="" Language="C#" MasterPageFile="~/member/MasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="User_EditProfile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <!-- Content body -->
         	<div class="row">
		<div class="col-12">
 <style type="text/css">
     #ContentPlaceHolder1_bntsubmit {  
  border-radius: 25px;    
     }
      #ContentPlaceHolder1_btncencel {  
  border-radius: 25px;    
     }
 </style>
       
     <style>
        .TxtBoxError {
         border:1px solid red;
         width:250px;
         height:30px;
        }
        .form-group{
            margin-bottom:10px!important;
        }

    </style>
    <script type="text/javascript">
        function Validate() {
            var isChecked = false;
           <%-- var rb = document.getElementById("<%=rdSex.ClientID%>");
            var radio = rb.getElementsByTagName("input");
            
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            if (!isChecked) {
                document.getElementById("ContentPlaceHolder1_rdSex").className = "TxtBoxError";
            }--%>
            <%--var rb = document.getElementById("<%=rdMaritalStatus.ClientID%>");
          var radio = rb.getElementsByTagName("input");
          var isChecked = false;
          for (var i = 0; i < radio.length; i++) {
              if (radio[i].checked) {
                  isChecked = true;
                  break;
              }
          }

          if (!isChecked) {
              document.getElementById("ContentPlaceHolder1_rdMaritalStatus").className = "TxtBoxError";
          }--%>
          if (document.getElementById("ContentPlaceHolder1_txtName").value == "") {
              document.getElementById("ContentPlaceHolder1_txtName").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_txtName").className = "form-control";
          }
          if (document.getElementById("ContentPlaceHolder1_txtFName").value == "") {
              document.getElementById("ContentPlaceHolder1_txtFName").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_txtFName").className = "form-control";
          }
          if (document.getElementById("ContentPlaceHolder1_txtDOB").value == "") {
              document.getElementById("ContentPlaceHolder1_txtDOB").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_txtDOB").className = "form-control";
          }
          if (document.getElementById("ContentPlaceHolder1_txtAddress").value == "") {
              document.getElementById("ContentPlaceHolder1_txtAddress").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_txtAddress").className = "form-control";
          }
          if (document.getElementById("ContentPlaceHolder1_txtpincode").value == "") {
              document.getElementById("ContentPlaceHolder1_txtpincode").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_txtpincode").className = "form-control";
          }
          if (document.getElementById("ContentPlaceHolder1_drpstate").value == "Select State") {
              document.getElementById("ContentPlaceHolder1_drpstate").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_drpstate").className = "form-control";
          }
          if (document.getElementById("ContentPlaceHolder1_drpCity").value == "Select City") {
              document.getElementById("ContentPlaceHolder1_drpCity").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_drpCity").className = "form-control";
          }
          if (document.getElementById("ContentPlaceHolder1_txtMobile").value == "") {
              document.getElementById("ContentPlaceHolder1_txtMobile").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_txtMobile").className = "form-control";
          }
          if (document.getElementById("ContentPlaceHolder1_txtEmail").value == "") {
              document.getElementById("ContentPlaceHolder1_txtEmail").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_txtEmail").className = "form-control";
          }
          if (document.getElementById("ContentPlaceHolder1_txtpan").value == "") {
              document.getElementById("ContentPlaceHolder1_txtpan").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_txtpan").className = "form-control";
          }
          if (document.getElementById("ContentPlaceHolder1_txtaadhar").value == "") {
              document.getElementById("ContentPlaceHolder1_txtaadhar").className = "TxtBoxError";

          }
          else {

              document.getElementById("ContentPlaceHolder1_txtaadhar").className = "form-control";
          }
          return isChecked;
      }
</script>
        <!------Msgbox End---->
     <div class="card-body">
             
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
            
            </div>
    
      
        <div class="row">
             <div class="col-lg-3">
                  <div class="card  card-success ">
                 <div class="card-header with-border">
                     <h5 class=" card-title"> Admission Detail</h5>
                 </div>
                 <!----form start---->
                 <div class="form-horizontal">
                     <div class="card-body">
                        
              <div class="form-group row">
                <label class="col-lg-12">Member ID</label>
                 <div class="col-lg-12">
                      <asp:Label ID="lbUserName" runat="server" Text="" CssClass="form-control"></asp:Label>   
                </div>
                  </div>
                          <div class="form-group row">
                <label class="col-lg-12">Sponsor ID</label>
                 <div class="col-lg-12">
                 <asp:Label ID="lbSponser" runat="server" Text="" CssClass="form-control"></asp:Label>          
                 </div>
                  <center> <asp:Label runat="server" ID="lbSponserName" Text="" CssClass="label label-info label-success"></asp:Label>
                </center>  

                          </div>
                           <div class="form-group">
                <label class="col-lg-12">Your Side</label>
                 <div class="col-lg-12">
                   <asp:Label ID="lbside" runat="server" Text="" CssClass="form-control"></asp:Label>   
                   <center> <asp:Label runat="server" ID="lbmsg" Text="" CssClass="label  label-danger"></asp:Label>
                 </div>
                  </div>
                          <%-- <div class="form-group">
                <label class="col-lg-12">Select Upline</label>
                 <div class="col-lg-12">
                   <asp:Label ID="lbUpline" runat="server" Text="" CssClass="form-control"></asp:Label>  
                      <center> <asp:Label runat="server" ID="lbuplineName" Text="" CssClass="label label-info label-success"></asp:Label>
                </center> 


                 </div>
                  </div>
                         
                         <div class="form-group">
                <label class="col-lg-12">Joining Date</label>
                 <div class="col-lg-12">
                   <asp:Label ID="lbDOJ" runat="server" Text="" CssClass="form-control"></asp:Label>   
                  
                 </div>
                  </div>--%>
                          <div class="form-group row">
                <label class="col-lg-12">Account Status</label>
                 <div class="col-lg-12">
                   <asp:Label ID="lbStatus" runat="server" Text="" CssClass="form-control"></asp:Label>   
                  
                 </div>
                  </div>
                </div>
                     <div class="card-footer"></div>
                
                     </div>
                      </div>
                 
             </div>
             <div class="col-lg-9">
            <div class="card ">
                 <div class="card-header with-border">
                     <h5 class=" card-title">Personal Detail</h5>
                 </div>
                 <!----form start---->
                 <div class="form-horizontal">
                     <div class="card-body">
                         <div class="form-group row">
                           
                             <div class="col-lg-6">
                  <label class="control-label  ">Full Name</label>

                   <asp:TextBox ID="txtName" runat="server"  ReadOnly="true" class="form-control" placeholder="Enter  Full Name"></asp:TextBox>              
                </div>
                             <div class="col-lg-6">
                              <label class="control-label  ">Father/Husband Name</label>

                   <asp:TextBox ID="txtFName" runat="server"  class="form-control" placeholder="Enter Father/Husband Name"></asp:TextBox>              
                </div>
                </div>
                         <div class="form-group row">
                           
                             <div class="col-lg-6">
                  <label class="control-label ">Date of Birth</label>

                   <asp:TextBox ID="txtDOB" runat="server"  class="form-control" Type="date" placeholder="Enter  DateOFBirth"></asp:TextBox>              
                     
                                   </div>
                             <div class="col-lg-6">
                              <label class="control-label  ">Gender</label>

                   <asp:RadioButtonList ID="rdSex" runat="server" CssClass="form-control iradio_minimal-red"  RepeatDirection="Horizontal">
                     <asp:ListItem Value="0">Male</asp:ListItem>
                     <asp:ListItem Value="1">Female</asp:ListItem>
                   </asp:RadioButtonList>              
                </div>
                </div>
              
                  
                         <div class="form-group row">
                           
                             <div class="col-lg-6">
                  <label class="control-label  ">Mobile </label>

                   <asp:TextBox ID="txtMobile" runat="server"  ReadOnly="true" MaxLength="10" class="form-control" placeholder="Enter Mobile"></asp:TextBox>              
                </div>
                             <div class="col-lg-6">
                                <label class="control-label  "> PinCode</label>

                           <asp:TextBox ID="txtpincode" ReadOnly="true" runat="server"  MaxLength="6" class="form-control" placeholder="Enter PinCode"></asp:TextBox>        
                </div>
                </div>
                         <div class="form-group row">

                             
                             <div class="col-lg-6">
                      <label class="control-label  ">Email </label>

                   <asp:TextBox ID="txtEmail" ReadOnly="true" runat="server" type="email"   class="form-control" placeholder="Enter Email"></asp:TextBox>              
                </div>          
               <div class="col-lg-6">
                      <label class="control-label  ">State </label>

                   <asp:TextBox ID="txtState" runat="server"   class="form-control" placeholder="Enter State"></asp:TextBox>              
                </div>          
                </div>
                       <div class="form-group row">
                           
                             <div class="col-lg-6">
                  <label class="control-label  ">Nominee Name</label>

                   <asp:TextBox ID="txtNName" runat="server"  class="form-control" placeholder="Enter Nominee Name"></asp:TextBox>              
                </div>
                             
                             <div class="col-lg-6">
                              <label class="control-label">Nominee Relation</label>

                                   <asp:TextBox ID="txtNRelation" runat="server"  class="form-control"  placeholder="Enter Nominee Mobile"></asp:TextBox>              
                   
                          
                </div>
                </div>
                        
                  <div class="form-group row">
                           
                             <div class="col-lg-12">
                  <label class="control-label  "> Delivery Address</label>

                   <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" required="" Height="100px"  class="form-control" placeholder="Enter Address"></asp:TextBox>              
                </div>
                           
                </div>
                         <p style="color: red; ">
  Note: Your address information will be used to deliver products to you in the future. 
  Thus, be sure to have the correct address (pincode).
</p>

                          
                          <div class="card-footer">
                              <center>
                 <asp:Button ID="bntsubmit" OnClick="bntsubmit_Click" OnClientClick="return Validate();" runat="server" Text="Submit" CssClass="btn  btn-success text-center btn-sm"  />  
               
                      <asp:Button ID="btncencel" runat="server" OnClick="btncencel_Click" Text="Cancel" CssClass="btn  btn-secondary text-center btn-sm"  />  
               
                      </center>          
                </div>
                
                 </div>
             
          
                       
            </div>

        </div>
        </div>
        </div>    
           
        </div>
      
        </div>
     

</asp:Content>


