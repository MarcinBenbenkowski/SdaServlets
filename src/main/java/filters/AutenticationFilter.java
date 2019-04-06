package filters;

import service.UserService;

import javax.security.sasl.AuthenticationException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter (urlPatterns = "/secret/*")
public class AutenticationFilter implements Filter {
    private UserService userService;


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        userService = new UserService();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;

        Cookie[] cookies = httpRequest.getCookies();

        String cookieValue = "";

        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("userCookieId")) {
                cookieValue = cookies[i].getValue();
            }
        }
        //przewidzenie, czy w sesji jest taki user
        Integer loggedUserId = (Integer) httpRequest.getSession().getAttribute("loggedUserId");

        if(cookieValue.equals("") || !cookieValue.equals(loggedUserId.toString())){
            //throw exeption
            throw new AuthenticationException();

        }
        filterChain.doFilter(servletRequest, servletResponse);

    }

    @Override
    public void destroy() {

    }
}
