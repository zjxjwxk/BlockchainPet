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
public class MarketPetInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer petId = Integer.valueOf(req.getParameter("petId"));
        Pet pet = PetMarketServlet.getPet(petId);
        req.setAttribute("pet", pet);
        req.getRequestDispatcher("market-pet-information.jsp").forward(req, resp);
    }
}
