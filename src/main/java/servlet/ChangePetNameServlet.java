package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author zjxjwxk
 */
public class ChangePetNameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("username") == null) {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
        req.setCharacterEncoding("utf-8");
        String username = (String) session.getAttribute("username");
        String petName = req.getParameter("petName");
        Integer petId = Integer.valueOf(req.getParameter("petId"));
        InformationServlet.changePetName(username, petId, petName);
        req.setAttribute("changePetNameMsg", "修改狗狗名字成功！");
        req.getRequestDispatcher("pet-information.do?petId=" + petId).forward(req, resp);
    }
}
