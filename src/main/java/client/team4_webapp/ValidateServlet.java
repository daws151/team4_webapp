package client.team4_webapp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ValidateServlet", value = "/ValidateServlet")
public class ValidateServlet extends HttpServlet {
    protected void loginRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {

        String custUsername = request.getParameter("custUsername");
        int custId = Integer.parseInt(request.getParameter("custId"));
        String empUsername = request.getParameter("empUsername");
        int agtId = Integer.parseInt(request.getParameter("agtId"));
        String password = request.getParameter("password");
        String logout = request.getParameter("logout");
        HttpSession session = request.getSession();
        HttpURLConnection custConnection = (HttpURLConnection) new
                URL("http://localhost:8081/team4_server_war_exploded/customer/getcustomer/"+custId).openConnection();
        HttpURLConnection empConnection = (HttpURLConnection) new
                URL("http://localhost:8081/team4_server_war_exploded/agent/getagent/"+agtId).openConnection();

        if (logout != null) {
            session.invalidate();
            response.sendRedirect("index.jsp");
        }

        // Agent logging in
        else if (empUsername != null && password != null && !empUsername.equals("") && !password.equals("")) {
            //Validate Travel Experts agent


        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            loginRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ValidateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ValidateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            loginRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ValidateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ValidateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
