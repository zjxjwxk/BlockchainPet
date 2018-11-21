package servlet;

import service.ReceiveService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * @author zjxjwxk
 */
public class ReceiveServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        if (username == null) {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            ReceiveService receiveService = new ReceiveService();
            String filename = receiveService.getRandomFilename();
            resp.setContentType("image/png");
            resp.setHeader("Content-Disposition", "attachment;filename=" + filename);

            OutputStream os = resp.getOutputStream();
            ServletContext context = getServletContext();
            InputStream is = context.getResourceAsStream("/resources/img/" + filename);
            byte[] bytes = new byte[1024];
            int bytesRead;
            while ((bytesRead = is.read(bytes)) != -1) {
                os.write(bytes, 0, bytesRead);
            }
            os.flush();
            is.close();
        }
    }
}
