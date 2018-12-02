package servlet;

import model.Pet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;
import java.util.Random;

/**
 * @author zjxjwxk
 */
public class GuessNumberServlet extends HttpServlet {

    private int realNumber;
    private Pet initialPet;

    @Override
    public void init(){
        this.realNumber = new Random().nextInt(100) + 1;
        this.initialPet = new Pet("小莱", 11008418,
                "普通", 0, "resources/img/1.png",
                "招风耳", "小惊讶", "达利胡", "鹅黄",
                "斑马纹", "眼睛色", "异光蓝", "紫灰");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("username") == null) {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

        session.setAttribute("realNumber", realNumber);
        session.setAttribute("initialPet", initialPet);

        req.getRequestDispatcher("guess-number.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getParameter("guessNumber") == null || "".equals(req.getParameter("guessNumber"))) {
            req.setAttribute("guessResult", "猜测的数字不能为空！");
            req.getRequestDispatcher("guess-number.jsp").forward(req, resp);
        } else {
            HttpSession session = req.getSession();
            int guessNumber = Integer.parseInt(req.getParameter("guessNumber"));
            int realNumber = (Integer) session.getAttribute("realNumber");
            if (guessNumber == realNumber) {
                generateQuality();
                req.setAttribute("guessResult", "猜对了！第0代莱茨狗已生成！");
                req.getRequestDispatcher("receive-success.jsp").forward(req, resp);
            } else if (guessNumber > realNumber) {
                mutation();
                req.setAttribute("guessResult", "太大了，请重猜！");
                req.getRequestDispatcher("guess-number.jsp").forward(req, resp);
            } else {
                mutation();
                req.setAttribute("guessResult", "太小了，请重猜！");
                req.getRequestDispatcher("guess-number.jsp").forward(req, resp);
            }
        }
    }

    /**
     * 基因突变
     * 原本是稀有的属性，变回普通的概率是10%
     * 原本是普通的属性，变成稀有的概率是10%
     */
    private void mutation() {
        Map<String, Integer> basicQualitys = this.initialPet.getBasicQualitys();
        for (Map.Entry<String, Integer> quality :
                basicQualitys.entrySet()) {
            if (quality.getValue() == 0) {
                int num = new Random().nextInt(10);
                if (num == 0) {
                    basicQualitys.put(quality.getKey(), 1);
                }
            } else {
                int num = new Random().nextInt(10);
                if (num == 0) {
                    basicQualitys.put(quality.getKey(), 0);
                }
            }
        }
        this.initialPet.setBasicQualitys(basicQualitys);
    }

    /**
     * 根据基本属性的稀有个数生成等级
     */
    public void generateQuality(){
        Map<String, Integer> basicQualitys = this.initialPet.getBasicQualitys();
        int rareCount = 0;
        for (Map.Entry<String, Integer> quality :
                basicQualitys.entrySet()) {
            if (quality.getValue() == 1) {
                rareCount++;
            }
        }
        if (rareCount == 0 || rareCount == 1) {
            this.initialPet.setQuality("普通");
        } else if (rareCount == 2) {
            this.initialPet.setQuality("稀有");
        } else if (rareCount == 3) {
            this.initialPet.setQuality("卓越");
        } else if (rareCount == 4 || rareCount == 5) {
            this.initialPet.setQuality("史诗");
        } else if (rareCount == 6 || rareCount == 7) {
            this.initialPet.setQuality("神话");
        } else if (rareCount == 8) {
            this.initialPet.setQuality("传说");
        }
    }
}
