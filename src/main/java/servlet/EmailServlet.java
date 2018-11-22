package servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author zjxjwxk
 */
public class EmailServlet extends HttpServlet {

    private String username;
    private String email;

    @Override
    public void init(ServletConfig config) throws ServletException {
        username = config.getInitParameter("username");
        email = config.getInitParameter("email");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html; charset = UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("<html><body>");
        out.println("<head><title>密保邮箱</title></head>");
        out.println("用户名：" + username + "<br/>");
        out.println("密保邮箱：" + email + "<br/>");
        out.println("</body></html>");
    }
}
