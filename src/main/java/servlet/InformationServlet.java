package servlet;

import model.Pet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zjxjwxk
 */
public class InformationServlet extends HttpServlet {

    private Map<String, String> nikename = new HashMap<>();
    private Map<String, Pet[]> userPets = new HashMap<>();

    @Override
    public void init(){
        nikename.put("wuxinkang", "吴鑫康");
        userPets.put("wuxinkang", new Pet[]{
                new Pet("小莱", 11008418, "卓越", 0, "resources/img/1.png",
                        "招风耳", "小惊讶", "达利胡", "鹅黄",
                        "斑马纹", "眼睛色", "异光蓝", "紫灰")
        });
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");

        session.setAttribute("nikename", nikename.get(username));
        session.setAttribute("userPets", userPets.get(username));
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }
}
