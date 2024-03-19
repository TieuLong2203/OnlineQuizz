package controller.user.authenticate;

import com.lambdaworks.crypto.SCryptUtil;
import dao.UserDBContext;
import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

public class VerifyCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String email = request.getParameter("email");
        String verifyType = request.getParameter("verify-type");
        if (code != null && email != null && verifyType != null) {
            try {
                checkCode(request, response, code, verifyType);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.getRequestDispatcher("./view/user/authenticate/Verify.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code != null) {
            String verifyType = request.getParameter("verify-type");
            try {
                checkCode(request, response, code, verifyType);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        } else {
            request.setAttribute("error", "Please enter the code sent to your email.");
            request.getRequestDispatcher("./view/user/authenticate/Verify.jsp").forward(request, response);
        }
    }

    private void checkCode(HttpServletRequest request, HttpServletResponse response, String code, String verifyType) throws IOException, ServletException, SQLException {
        HttpSession session = request.getSession();
        String sessionCode = (String) session.getAttribute("code");
        if(sessionCode != null) {
            if (sessionCode.equals(code) || SCryptUtil.check(code, sessionCode)) {
                session.removeAttribute("code");
                session.removeAttribute("uri");
                session.removeAttribute("verifyType");
                if(verifyType.equals("verify-email")){
                    User sessionUser = (User) session.getAttribute("user");
                    UserDBContext userDB = new UserDBContext();
                    userDB.verifiedEmail(sessionUser.getEmail());
                    // close connection
                    userDB.closeConnection();
                    response.sendRedirect("./login");
                } else if(verifyType.equals("reset-password")){
                    response.sendRedirect("./reset-password");
                }
            } else {
                request.setAttribute("error", "Incorrect code. Please try again.");
                request.getRequestDispatcher("./view/user/authenticate/Verify.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "You have not requested a verification code");
            request.getRequestDispatcher("./view/user/authenticate/Verify.jsp").forward(request, response);
        }
    }
}
