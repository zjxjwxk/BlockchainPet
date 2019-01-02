package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author zjxjwxk
 */
public class deleteDog extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] deleteIds = req.getParameterValues("deleteId");
        for (String deleteId :
                deleteIds) {
            PetMarketServlet.deletePet(Integer.valueOf(deleteId));
        }
        req.getRequestDispatcher("pet-market.do").forward(req, resp);
    }
}