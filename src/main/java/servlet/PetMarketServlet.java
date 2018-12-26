package servlet;

import model.Pet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zjxjwxk
 */
public class PetMarketServlet extends HttpServlet {

    private static List<Pet> petList;

    @Override
    public void init(){
        petList = new ArrayList<>();
        Pet pet = new Pet("小莱", 11008418, "卓越", 0, "resources/img/1.png",
                "招风耳", "小惊讶", "达利胡", "鹅黄",
                "斑马纹", "眼睛色", "异光蓝", "紫灰");
        int initialPetAmount = 10;
        for (int i = 0; i < initialPetAmount; i++) {
            petList.add(pet);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("petList", petList);
        req.getRequestDispatcher("browseDog.jsp").forward(req, resp);
    }

    public static void addPet(Pet pet)
    {
        petList.add(pet);
    }

    public static Pet getPet(Integer petId) {
        for (Pet pet:
                petList) {
            if (pet.getId().equals(petId)) {
                return pet;
            }
        }
        return null;
    }
}
