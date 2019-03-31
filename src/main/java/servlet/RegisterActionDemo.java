package servlet;

import model.User;
import service.UserRegisterException;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet(urlPatterns = "/registerActionDemo")
public class RegisterActionDemo extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");

        validate(password);
        //walidacja parametrów
        Optional<User> userOptional = userService.createUser(login, password);

        if (userOptional.isPresent()) {
            System.out.println(userOptional.get().toString());
        } else {
            System.out.println("User jest w bazie danych");
        }
        resp.sendRedirect("login.jsp");
        //przekierowanei na inną stronę
    }
    private void validate(String password) {
        if (password.length() < 3) {
            throw new UserRegisterException();

        }
    }
}
