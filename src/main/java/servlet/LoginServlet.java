package servlet;

import service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author zjxjwxk
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        LoginService loginService = new LoginService();
        if (!loginService.checkLogin(username, password)) {
            req.setAttribute("loginError", "用户名或密码错误！");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            req.getRequestDispatcher("exam.jsp").forward(req, resp);
        }
    }
}
