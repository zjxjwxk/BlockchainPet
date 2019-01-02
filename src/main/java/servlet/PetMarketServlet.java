package servlet;

import model.Pet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author zjxjwxk
 */
public class PetMarketServlet extends HttpServlet {

    private static List<Pet> petList;

    @Override
    public void init(){
        petList = new ArrayList<>();
        int initialPetAmount = 10;
        for (int i = 0; i < initialPetAmount; i++) {
            Pet pet = new Pet();
            petList.add(pet);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getServletContext().setAttribute("petList", petList);
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

    public static void deletePet(Integer petId) {
        Iterator iterator = petList.iterator();
        while (iterator.hasNext()) {
            if (((Pet) iterator.next()).getId().equals(petId)) {
                iterator.remove();
            }
        }
    }

    public static void modifyPet(Integer petId, String petName, Integer generation) {
        for (Pet pet:
             petList) {
            if (pet.getId().equals(petId)) {
                pet.setName(petName);
                pet.setGeneration(generation);
            }
        }
    }
}
