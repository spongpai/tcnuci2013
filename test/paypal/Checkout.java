package com.paypal.dg;

/*==================================================================
 PayPal Express Checkout Call
 ===================================================================
 */

import java.util.HashMap;
import java.util.Map;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import com.paypal.dg.PaypalFunctions;

public class Checkout extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Use "request" to read incoming HTTP headers (e.g. cookies)
		// and HTML form data (e.g. data the user entered and submitted)

		// Use "response" to specify the HTTP response line and headers
		// (e.g. specifying the content type, setting cookies).

		/*
		 *  The paymentAmount is the total value of ' the purchase. ' ' 
		 * TODO:  Enter the total Payment Amount within the quotes. ' example :
		 * paymentAmount = "15.00"; 
		 */
		String paymentAmount = "12";

		/*
		 * '------------------------------------ ' The returnURL is the location
		 * where buyers return to when a ' payment has been succesfully
		 * authorized. ' ' This is set to the value entered on the Integration
		 * Assistant '------------------------------------
		 */

		String returnURL = "http://auge.ics.uci.edu/tcnuci/test/confirm.html";

		/*
		 * '------------------------------------ ' The cancelURL is the location
		 * buyers are sent to when they hit the ' cancel button during
		 * authorization of payment during the PayPal flow ' ' This is set to
		 * the value entered on the Integration Assistant
		 * '------------------------------------
		 */
		String cancelURL = "http://auge.ics.uci.edu/tcnuci/test/cancel.html";

		/*
		 * '------------------------------------ ' The items hashmap contains
		 * the details of each item '------------------------------------
		 * TODO: change "item name" to desired item name
		 */

		Map item = new HashMap();
		item.put("name", "item name");
		item.put("amt", paymentAmount);
		item.put("qty", "1");

		/*
		 * '------------------------------------ ' Calls the SetExpressCheckout
		 * API call ' ' The SetExpressCheckout function is defined in the file
		 * PayPalFunctions.java,
		 * '-------------------------------------------------
		 */
		PaypalFunctions ppf = new PaypalFunctions();
		HashMap nvp = ppf.setExpressCheckout(paymentAmount, returnURL,
				cancelURL, item);
		String strAck = nvp.get("ACK").toString();
		if (strAck != null && strAck.equalsIgnoreCase("Success")) {

			// ' Redirect to paypal.com
			String redirectURL = "https://www.sandbox.paypal.com/incontext?token="
					+ nvp.get("TOKEN").toString();

			response.sendRedirect(redirectURL);
		} else {
			// Display a user friendly Error on the page using any of the
			// following error information returned by PayPal

			String ErrorCode = nvp.get("L_ERRORCODE0").toString();
			String ErrorShortMsg = nvp.get("L_SHORTMESSAGE0").toString();
			String ErrorLongMsg = nvp.get("L_LONGMESSAGE0").toString();
			String ErrorSeverityCode = nvp.get("L_SEVERITYCODE0").toString();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}