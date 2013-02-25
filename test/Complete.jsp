<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Thai Culture Night 2013: Tavipop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/print.css" type="text/css" media="print" />
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
    
    <script>  
    function getXmlHttpRequestObject() {
    	if (window.XMLHttpRequest) {
    		return new XMLHttpRequest(); //To support the browsers IE7+, Firefox, Chrome, Opera, Safari
    	} else if(window.ActiveXObject) {
    		return new ActiveXObject("Microsoft.XMLHTTP"); // For the browsers IE6, IE5
    	} else {
    		alert("Error due to old verion of browser upgrade your browser");
    	}
    }

    var xmlhttp = new getXmlHttpRequestObject();  
  
    function sendReceipt() {  
    	var email = document.getElementById('toEmail');
    	if(email.value == "")
    		alert("Please provide email address");
    	else{
    		xmlhttp.onreadystatechange=callback;  
            xmlhttp.open("GET", "SendReceipt?toEmail=" + email.value, true);  
            //xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xmlhttp.send(null); //Posting txtname to Servlet
            //alert("sent!!");  
    	}
    }  
  
    function callback() {  
        //alert("in call back");  
        var email = document.getElementById('toEmail');
    	if (xmlhttp.readyState==4 && xmlhttp.status==200) {  
            alert("Receipt has been sent to " + email.value);
        	document.getElementById("dataDiv").innerHTML="<h4>Receipt has been sent!</h4>";  
        } else {  
            //document.getElementById("dataDiv").innerHTML="<h3>CHANGE HASN'T COME</h3>";  
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
<img src="img/slide-01.jpg" width="100%" style="position:relative; top:-20px" class="noPrint" >
<div id="wrapper" class="container-fluid">
	<div class="row-fluid">
		<div class="span1"></div>
		<div class="span10 well">
			<div class="row span12">
				<div style="text-align:center;">
				<form class="form-inline noPrint">
				<input type="email" name="toEmail" id="toEmail" placeholder="Email Address" required></input>
				<button type="Button" class="btn btn-primary" onclick="sendReceipt()">Send Receipt</button>  
				<button type="Button" class="btn btn-link" onclick="javascript:window.print()"><i class="icon-print" ></i> Print Receipt</button>  
				<div id="dataDiv"></div>
				</form>
				</div>
			</div>
			<div class="row">
				<div class="span1"></div>
				<div class="span5">
					<b>Receipt: <br>TCN 2013: THE SIAM RENAISSANCE</b>
				</div>
				<div class="span4 dl-horizontal">
					<dt>No: </dt><dd><%=session.getAttribute("invoice") %></dd>
					<dt>Date:</dt><dd><%=session.getAttribute("invoice_date") %></dd>
					<dt>Received by:</dt><dd>PayPal (<%=session.getAttribute("trans_id") %>/<%=session.getAttribute("status") %>)</dd>
				</div>
			</div>
			<div class="row span12"></div>
			<div class="row">
				<div class="span1"></div>
				<div class="span5">
					Paid by: <%=session.getAttribute("buyer_name") %> <br />
					<%=session.getAttribute("buyer_email") %><br />
				</div>
				<div class="span5">
					Paid to: Thai Club at UCI <br />
					24 Lehigh Aisle <br />
					Irvine, CA 92612
				</div>
			</div>
			<div class="row span12"></div>
			<div class="row">
				<div class="span1"></div>
				<div class="span10">
					<table class="table">
						<tr style="font-weight: bold;"">
							<td>Description</td>
							<td style="text-align: right;">Unit Cost</td>
							<td style="text-align: right;">Quantity</td>
							<td style="text-align: right;">Total</td>
						</tr>
						<tr>
							<td >Thai Culture Night 2013 Ticket</td>
							<td style="text-align: right;">$<%=session.getAttribute("price") %></td>
							<td style="text-align: right;"><%=session.getAttribute("qty") %></td>
							<td style="text-align: right; height:100px">$<%=session.getAttribute("amount") %></td>
						</tr>
						<tr>
							<td rowspan=4 colspan=2>Note: <br />
							<%=session.getAttribute("pickup_name") %> <br >
							<%=session.getAttribute("pickup_email") %><br />
							</td>
							<td style="text-align: right;"> SUBTOTAL</td>
							<td style="text-align: right;">$<%=session.getAttribute("amount") %></td>
						</tr>
						<tr>
							<td style="text-align: right;"> DISCOUNT(S)</td>
							<td style="text-align: right;">N/A</td>
						</tr>
						<tr>
							<td style="text-align: right;"> TAX</td>
							<td style="text-align: right;">N/A</td>
						</tr>
						<tr>
							<td style="text-align: right;font-weight:bold;"> TOTAL</td>
							<td style="text-align: right;font-weight:bold;">$<%=session.getAttribute("amount") %></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row span12">
				<div style="text-align:center;">
					<br>
					<img id="image" src="../publish/img/tclogo.png" alt="logo" /><br><br>
					<i class="icon-envelope"></i> <a href="mailto:thai.uci.club@gmail.com">thai.uci.club@gmail.com</a>
					&nbsp;&nbsp; Visit <a href="http://www.TCNUCI2013.com" >www.TCNUCI2013.com</a> for more info.
				</div>
			</div>
		</div>
	</div>
</div>
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
