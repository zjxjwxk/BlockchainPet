package servlet;

import service.ExamService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author zjxjwxk
 */
public class ExamServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ExamService examService = new ExamService();
        String[][] answers = new String[8][];
        for (int i = 0; i < 8; i++) {
            answers[i] = req.getParameterValues("answer" + (i + 1));
        }
        req.setAttribute("score", examService.checkAnswer(answers));
        req.getRequestDispatcher("exam.jsp").forward(req, resp);
    }
}
