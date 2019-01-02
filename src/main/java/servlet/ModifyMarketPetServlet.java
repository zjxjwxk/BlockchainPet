package servlet;

import model.Pet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author zjxjwxk
 */
public class ModifyMarketPetServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer petId = Integer.valueOf(req.getParameter("petId"));
        Pet pet = PetMarketServlet.getPet(petId);
        req.setAttribute("pet", pet);
        req.getRequestDispatcher("modifyDog.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Integer petId = Integer.valueOf(req.getParameter("petId"));
        String petName = req.getParameter("petName");
        Integer generation = Integer.valueOf(req.getParameter("generation"));
        PetMarketServlet.modifyPet(petId, petName, generation);
        req.getRequestDispatcher("pet-market.do").forward(req, resp);
    }
}
