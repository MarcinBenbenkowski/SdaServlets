package service;

import model.Post;
import model.User;
import repository.PostDAO;
import repository.UserDAO;

import java.util.Optional;

public class PostService  {

    private PostDAO postDAO;

    private UserDAO userDAO;

    public PostService() {
        this.postDAO = PostDAO.getInstance();
        this.userDAO = UserDAO.getInstance();

    }

    public void addNewPost(String postText, int userId){
        Optional<User> userById = userDAO.getUserById(userId);

        if (!userById.isPresent()){
            throw new IllegalStateException("Can not find user with it: " + userById);
        }
        Post postToAdd = new Post(postText, userById.get());

        postDAO.addPost(postToAdd);
    }
}
