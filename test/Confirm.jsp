<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Thai Culture Night 2013: Tavipop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    </style>
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
    
    <script type="text/javascript">
    	function calTotal(){
    		var qty = document.getElementById('qty');
    		var total = document.getElementById('total');
    		//var price = document.getElementById('price');
    		var price = 12;
    		for(var i = 0; i < 20; i++){
    			if(qty.selectedIndex === i){
    				//alert(i + 1);
    				//alert(price);
    				total.value = (i + 1) * price;
    				total.value = "$" + total.value + ".00";
    			}
    		}
    	}
    	
    	function selfPickup(){
    		var pName = document.getElementById('pickup_name');
			var pEmail = document.getElementById('pickup_email');
			var bName = document.getElementById('buyer_name');
			var bEmail = document.getElementById('buyer_email');
    		if(document.getElementById('pickup').checked){
    			pName.value = bName.value;
    			pEmail.value = bEmail.value;
    			pName.readOnly = true;
    			pEmail.readOnly = true;
    		} else {
    			pName.readOnly = false;
    			pEmail.readOnly = false;
    		}
    	}
    	
    	function setPickupName(){
    		var pName = document.getElementById('pickup_name');
			var pEmail = document.getElementById('pickup_email');
			var bName = document.getElementById('buyer_name');
			var bEmail = document.getElementById('buyer_email');
			if(document.getElementById('pickup').checked){
    			pName.value = bName.value;
    			pEmail.value = bEmail.value;
    		} 
    	}
    </script>
  </head>

  <body background="img/bg.jpg">

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#" style="display:none">Thai Culture Night 2013</a>
          <div class="nav-collapse collapse">
		  <!--
            <p class="navbar-text pull-right">
              Logged in as <a href="#" class="navbar-link">Username</a>
            </p>
			-->
            <ul class="nav pull-right">
              <li ><a href="home.html">Home</a></li>
              <li ><a href="casts.html">Cast</a></li>
			  <li ><a href="ticket.html">Ticket & Direction</a></li>
			  <li ><a href="gallery.html">Gallery</a></li>
			  <li ><a href="pasttcn.html">Our Success</a></li>
			  <li class="active"><a href="about.html">About Us</a></li>
			  <li ><a href="support.html">Support Us</a></li>
			 </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
<img src="img/slide-01.jpg" width="100%" style="position:relative; top:-20px" >
	<div class="container-fluid">
        <div class="row-fluid">
			<div class="span1"></div>
			<div class="span10 well">
				<div class="row">
					<div class="span1"></div>
					<div class="span11">
					<h3>Order Confirmation</h3>
					<form class="form-inline" method="post" action="Complete">
						<input type=hidden name=PAYMENTREQUEST_0_PAYMENTACTION value="Sale">
						<input type=hidden name=token value="<%=session.getAttribute("token") %>">
						<h5>Order Details</h5>
						Ticket for Thai Culture Night 2013, by UCI Thai Club
						&nbsp;&nbsp;&nbsp;
						<div class="input-prepend">
							<span class="add-on">Quantity</span>
							<input class="uneditable-input input-mini" id="qty" name="qty" type="text" value=<%=session.getAttribute("qty") %> readOnly>
						</div>
						&nbsp; X &nbsp;
						<div class="input-prepend">
							<span class="add-on">Price</span>
							<input class="uneditable-input input-mini" id="price" name="price" type="text" value="$<%=session.getAttribute("price") %>" readOnly>
						</div>
				  		&nbsp; = &nbsp;	
				  		<div class="input-prepend">
				 			<span class="add-on">Total</span>
				  				<input class="uneditable-input input-mini" id="total" name="total" type="text" value="$<%=session.getAttribute("amount") %>" readOnly>
				  		</div>
				  		<hr>
						<h5>Billing Information</h5>
						Full name <input class="input-xlarge" type="text" id="buyer_name" value="<%=session.getAttribute("buyer_name") %>" readOnly></input>&nbsp;
						Email address <input class="input-xlarge" type="email" id="buyer_email" value="<%=session.getAttribute("buyer_email") %>" readOnly></input>
						<br>
						<hr>
						<h5>Pickup Information</h5>
						Full name <input class="input-xlarge" type="text" id="pickup_name" value="<%=session.getAttribute("pickup_name") %>" readOnly></input>&nbsp;
						Email address <input class="input-xlarge" type="email" id="pickup_email" value="<%=session.getAttribute("pickup_email") %>" readOnly></input>
						<br><br>
						Please click "Confirm Payment" to complete the transaction. Refund is not available after this point.
						<br><div style="padding-left:40%">
						<button type='button' class='btn' >Cancel</button>
						<input type='submit' class='btn btn-success' value="Confirm Payment" /><br />
						</div>
					</form>
					</div>
				</div>
			</div>
    	</div><!--/.fluid-container-->
	<hr>
	<footer class="pull-right">
       	<p>&copy; Thai Club @ UC Irvine 2012</p>
     </footer>
    </div><!--  /.container-fluid -->
	<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script>

  </body>
</html>
