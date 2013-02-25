package com.paypal.dg;

import java.util.HashMap;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import com.paypal.dg.PaypalFunctions;

public class Cancel extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
response.setContentType("text/html");

		response.getWriter().println("<script>");
		response.getWriter().println("alert(\"Payment Failed\");");
		response.getWriter()
				.println("// add relevant message above or remove the line if not required");
		response.getWriter().println("window.onload = function(){");
		response.getWriter().println("if(window.opener){");
		response.getWriter().println("window.close();");
		response.getWriter().println("	}");
		response.getWriter().println("else{");
		response.getWriter().println("if(top.dg.isOpen() == true){");
		response.getWriter().println("top.dg.closeFlow();");
		response.getWriter().println("return true;");
		response.getWriter().println("}");
		response.getWriter().println("}");
		response.getWriter().println("	};");

		response.getWriter().println("</script>");

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}