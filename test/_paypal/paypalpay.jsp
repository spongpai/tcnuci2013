<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Pay through PayPal: www.TestAccount.com</title>
</head>
<body onload="document.forms['paypalForm'].submit();">
<form name="paypalForm" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
 <input type="hidden" name="cmd" value="_xclick" />
 <input type="hidden" name="business" value="API username" />
 <input type="hidden" name="password" value="API password" />
 <input type="hidden" name="custom" value="1123" />
 <input type="hidden" name="item_name" value="Computer-Laptop" />
 <input type="hidden" name="amount" value="30"/>
 <input type="hidden" name="rm" value="1" />
 <input type="hidden" name="return" value="/test/_paypal/paypalResponse.jsp" />
 <input type="hidden" name="cancel_return" value="/test/_paypal/paypalResponseCancel.jsp" />
 <input type="hidden" name="cert_id" value="API Singature" />
</form>
</body>
</html>