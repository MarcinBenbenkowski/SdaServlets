package demoServer3;

import model.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet(urlPatterns = "/LoginAction3")
public class LoginAction3 extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");

        Optional<User> userByLogin = userService.getUserByLogin(login);
        if (userByLogin.isPresent() && isUserPasswordCorrect(userByLogin.get(), password)) {
            //robimy logikę logowania

            User user = userByLogin.get();

            req.getSession().setAttribute("loggedUserId", user.getId());

            Cookie cookie = new Cookie("userCookieId", Integer.toString(user.getId()));
            resp.addCookie(cookie);

            resp.sendRedirect("secret/posts.jsp");
        } else {
            //przekierować na stronę błędu

            resp.sendRedirect("errorLoginPage.jsp");
        }
    }

    private boolean isUserPasswordCorrect(User user, String requestedPassword) {
        return user.getPassword().equals(requestedPassword);
    }


}
