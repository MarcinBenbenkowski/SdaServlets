package repository;

import model.Post;
import service.PostService;

import java.util.*;

public class PostDAO {

    private static PostDAO INSTANCE;

    private Map<Integer, Post> postDatabase;
    private PostDAO(){
        postDatabase=new HashMap<>();
    }

    public static PostDAO getInstance(){
        if (INSTANCE == null) {
            INSTANCE = new PostDAO();
            return INSTANCE;
        }
        return INSTANCE;
    }
    public void addPost(Post postToAdd){
        postDatabase.put(postToAdd.getId(), postToAdd);
    }
    public List<Post> getAllPosts(){
        return new ArrayList<Post>(postDatabase.values());
    }
}
