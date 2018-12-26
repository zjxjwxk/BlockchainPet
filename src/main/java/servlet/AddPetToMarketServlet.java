package servlet;

import model.Pet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zjxjwxk
 */
public class AddPetToMarketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        String name = req.getParameter("petName");
        Integer id = Integer.valueOf(req.getParameter("petId"));
        String quality = req.getParameter("quality");
        Integer generation = Integer.valueOf(req.getParameter("generation"));
        String imgPath = req.getParameter("imgPath");

        String bodyType = req.getParameter("bodyType");
        String eye = req.getParameter("eye");
        String mouth = req.getParameter("mouth");
        String bodyColor = req.getParameter("bodyColor");
        String pattern = req.getParameter("pattern");
        String eyeColor = req.getParameter("eyeColor");
        String bellyColor = req.getParameter("bellyColor");
        String patternColor = req.getParameter("patternColor");

        Integer bodyTypeQuality = "1".equals(req.getParameter("bodyTypeQuality")) ? 1 : 0;
        Integer eyeQuality = "1".equals(req.getParameter("eyeQuality")) ? 1 : 0;
        Integer mouthQuality = "1".equals(req.getParameter("mouthQuality")) ? 1 : 0;
        Integer bodyColorQuality = "1".equals(req.getParameter("bodyColorQuality")) ? 1 : 0;
        Integer patternQuality = "1".equals(req.getParameter("patternQuality")) ? 1 : 0;
        Integer eyeColorQuality = "1".equals(req.getParameter("eyeColorQuality")) ? 1 : 0;
        Integer bellyColorQuality = "1".equals(req.getParameter("bellyColorQuality")) ? 1 : 0;
        Integer patternColorQuality = "1".equals(req.getParameter("patternColorQuality")) ? 1 : 0;

        Map<String, Integer> basicQualitys = new HashMap<>();
        basicQualitys.put("bodyType", bodyTypeQuality);
        basicQualitys.put("eye", eyeQuality);
        basicQualitys.put("mouth", mouthQuality);
        basicQualitys.put("bodyColor", bodyColorQuality);
        basicQualitys.put("pattern", patternQuality);
        basicQualitys.put("eyeColor", eyeColorQuality);
        basicQualitys.put("bellyColor", bellyColorQuality);
        basicQualitys.put("patternColor", patternColorQuality);

        Pet pet = new Pet(name, id, quality, generation, imgPath, bodyType, eye, mouth, bodyColor, pattern, eyeColor, bellyColor, patternColor);
        pet.setBasicQualitys(basicQualitys);
        PetMarketServlet.addPet(pet);
        req.getRequestDispatcher("pet-market.do").forward(req, resp);
    }
}
