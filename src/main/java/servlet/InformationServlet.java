package servlet;

import model.Pet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zjxjwxk
 */
public class InformationServlet extends HttpServlet {

    private static Map<String, String> nikename = new HashMap<>();
    private static Map<String, List<Pet>> userPets = new HashMap<>();
    private static Pet pet1;
    private static Pet pet2;

    @Override
    public void init(){
        nikename.put("wuxinkang", "吴鑫康");
        userPets.put("wuxinkang", new ArrayList<Pet>());
//        addUserPet("wuxinkang", new Pet("小莱", 11008418, "卓越", 0, "resources/img/1.png",
//                "招风耳", "小惊讶", "达利胡", "鹅黄",
//                "斑马纹", "眼睛色", "异光蓝", "紫灰"));

        pet1 = new Pet("小莱", 15550790, "普通", 0, "resources/img/1.png",
                "飞机头", "小颓废", "橄榄", "米色",
                "冰凌", "雪青", "变异橙", "赭石");
        Map<String, Integer> basicQualitys1 = new HashMap<>();
        basicQualitys1.put("bodyType", 0);
        basicQualitys1.put("eye", 0);
        basicQualitys1.put("mouth", 0);
        basicQualitys1.put("bodyColor", 0);
        basicQualitys1.put("pattern", 0);
        basicQualitys1.put("eyeColor", 0);
        basicQualitys1.put("bellyColor", 1);
        basicQualitys1.put("patternColor", 0);
        pet1.setBasicQualitys(basicQualitys1);

        pet2 = new Pet("小莱", 17436838, "卓越", 0, "resources/img/1.png",
                "菠萝头", "小可爱", "美滋滋", "豆绿",
                "两道杠", "异域红", "白色", "紫灰");
        Map<String, Integer> basicQualitys2 = new HashMap<>();
        basicQualitys2.put("bodyType", 1);
        basicQualitys2.put("eye", 0);
        basicQualitys2.put("mouth", 0);
        basicQualitys2.put("bodyColor", 0);
        basicQualitys2.put("pattern", 1);
        basicQualitys2.put("eyeColor", 1);
        basicQualitys2.put("bellyColor", 0);
        basicQualitys2.put("patternColor", 0);
        pet2.setBasicQualitys(basicQualitys2);
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
        req.setAttribute("pet1", pet1);
        req.setAttribute("pet2", pet2);
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }

    static void addUserPet(String username, Pet pet) {
        userPets.get(username).add(pet);
    }

    static Pet getUserPet(String username, Integer petId) {
        List<Pet> pets = userPets.get(username);
        if (pets != null && pets.size() > 0) {
            for (Pet pet:
                    pets) {
                if (pet.getId().equals(petId)) {
                    return pet;
                }
            }
        }
        return null;
    }

    static void changePetName(String username, Integer petId, String petName) {
        List<Pet> pets = userPets.get(username);
        if (pets != null && pets.size() > 0) {
            for (Pet pet:
                    pets) {
                if (pet.getId().equals(petId)) {
                    pet.setName(petName);
                }
            }
        }
    }
}
