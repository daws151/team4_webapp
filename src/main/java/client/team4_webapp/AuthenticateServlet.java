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

@WebServlet(name = "AuthenticateServlet", value = "/AuthenticateServlet")
public class AuthenticateServlet extends HttpServlet {
    protected void userCheck(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String custUsername = request.getParameter("custUsername");
//        String logout = request.getParameter("logout");
//        HttpSession session = request.getSession();
//        HttpURLConnection custConnection = (HttpURLConnection) new
//                URL("http://localhost:8081/team4_server_war_exploded/customer/getcustomers/").openConnection();

        String agent = "";
        response.setContentType("text/html");
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts","TravelExpertsAdmin","password");
            PreparedStatement stmt = conn.prepareStatement("SELECT AgentId FROM `agents` WHERE agentId = ?");
            stmt.setString(1,agent);
            ResultSet rs = stmt.executeQuery();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

//        if (logout != null) {
//            session.invalidate();
//            response.sendRedirect("index.jsp");
//        }
//
//        // Agent login
//        else if (empUsername != null && password != null && !empUsername.equals("") && !password.equals("")) {
            //Validate Travel Experts agent




    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int agtId = Integer.parseInt(request.getParameter("agtId"));
        String requestURI = request.getRequestURI();
        HttpURLConnection empConnection = (HttpURLConnection) new
                URL("http://localhost:8081/team4_server_war_exploded/agent/getagent/"+agtId).openConnection();


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

            userCheck(request, response);

        }
    }

