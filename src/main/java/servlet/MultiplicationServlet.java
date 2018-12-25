package servlet;

import model.Pet;
import service.MultiplicationService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

/**
 * @author zjxjwxk
 */
public class MultiplicationServlet extends HttpServlet {

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
        Pet pet1 = (Pet) session.getAttribute("pet1");
        Pet pet2 = (Pet) session.getAttribute("pet2");
        MultiplicationService multiplicationService = new MultiplicationService();
        Pet childPet = multiplicationService.multiplication(pet1, pet2);
        generateQuality(session, childPet);
        session.setAttribute("childPet", childPet);
        req.getRequestDispatcher("multiplication-success.jsp").forward(req, resp);
    }

    /**
     * 根据基本属性的稀有个数生成等级
     */
    private void generateQuality(HttpSession session, Pet childPet){
        Map<String, Integer> basicQualitys = childPet.getBasicQualitys();
        int rareCount = 0;
        for (Map.Entry<String, Integer> quality :
                basicQualitys.entrySet()) {
            if (quality.getValue() == 1) {
                rareCount++;
            }
        }
        if (rareCount == 0 || rareCount == 1) {
            childPet.setQuality("普通");
        } else if (rareCount == 2) {
            childPet.setQuality("稀有");
        } else if (rareCount == 3) {
            childPet.setQuality("卓越");
        } else if (rareCount == 4 || rareCount == 5) {
            childPet.setQuality("史诗");
        } else if (rareCount == 6 || rareCount == 7) {
            childPet.setQuality("神话");
        } else if (rareCount == 8) {
            childPet.setQuality("传说");
        }
        InformationServlet.addUserPet((String) session.getAttribute("username"), childPet);
    }
}
