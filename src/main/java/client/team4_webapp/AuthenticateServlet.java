/* Author: Brett Dawson
   Last modified: 2022-05-07
*/
/* Harv, please note that this does not work as intended, was sending back a blank page after entering credentials.
 Would need some more debugging. I ended up abandoning work on this because it wasn't a secure way of authenticating
 a user anyway. Should not be done with a GET request that includes the user id/name and password in the URL. Rather,
 it should be done with a POST request. Because we built a REST API for this project, we could have it return a token
 that could be used for authentication purposes. Ran out of time to implement something like this.
 */

package client.team4_webapp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.*;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import client.team4_webapp.DBConnect;

@WebServlet(name = "AuthenticateServlet", value = "/AuthenticateServlet")
public class AuthenticateServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {

        int agentId = Integer.parseInt(request.getParameter("agentId"));
        String password = request.getParameter("password");
        String custUsername = request.getParameter("custUsername");
        String logout = request.getParameter("logout");
        String message = request.getParameter("message");
        HttpSession session = request.getSession();

        if (logout != null) {
            session.invalidate();
            response.sendRedirect("index.jsp?message=Logged out");
        }

        // Agent login
        else if (agentId != 0 && password != null && !password.equals("")) {
            //Validate Travel Experts agent
//        HttpURLConnection custConnection = (HttpURLConnection) new
//                URL("http://localhost:8081/team4_server_war_exploded/customer/getcustomers/").openConnection();
            Connection conn = DBConnect.getConnection();
            String sql = "select count(*) from agents where AgentId='" + agentId + "' and AgtPassword='" + password + "';";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            int found = rs.getInt(1);
//            String username = rs.getString(2);
            rs.close();
            stmt.close();
            conn.close();

            if (found>0){
                session.setAttribute("agentId", agentId);
//                session.setAttribute("username", username);
                session.setAttribute("message", message);
//                Cookie sessionDataCookie=new Cookie("sessionData", username + "#" + session.getId());
//                response.addCookie(sessionDataCookie);
                response.sendRedirect("packages.jsp");
            }
            else{
                session.invalidate();
                response.sendRedirect("packages.jsp");
            }
        }
        else //Missing user details
            response.sendRedirect("employeeLogin.jsp?message=Both username and password are required");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        int agtId = Integer.parseInt(request.getParameter("agtId"));
//        String requestURI = request.getRequestURI();
//        HttpURLConnection empConnection = (HttpURLConnection) new
//                URL("http://localhost:8081/team4_server_war_exploded/agent/getagent/"+agtId).openConnection();
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AuthenticateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AuthenticateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String empUsername = request.getParameter("empUsername");

//        String password = request.getParameter("password");
//        HttpURLConnection empConnection = (HttpURLConnection) new
//                URL("http://localhost:8081/team4_server_war_exploded/agent/getagents").openConnection();
//        String authHeader = request.getHeader("authorization");
//        String encodedAuth = authHeader.substring(authHeader.indexOf(' ')+1);
//        String decodedAuth = new String(Base64.getDecoder().decode(encodedAuth));
//        String username = decodedAuth.substring(0, decodedAuth.indexOf(':'));
//        String password = decodedAuth.substring(decodedAuth.indexOf(':')+1);
//
//            userCheck(request, response);
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AuthenticateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AuthenticateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

