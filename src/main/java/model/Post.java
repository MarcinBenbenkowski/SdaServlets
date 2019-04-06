package model;

import java.time.Instant;
import java.util.Objects;

public class Post {

    private static int ID_COUNTER = 0;

    private int id;
    private Instant data;
    private String text;
    private User user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Instant getData() {
        return data;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post(String text, User user) {
        this.id = ID_COUNTER;
        this.text = text;
        this.user = user;
        this.data = Instant.now();
        ID_COUNTER++;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Post post = (Post) o;
        return Objects.equals(data, post.data) &&
                Objects.equals(text, post.text) &&
                Objects.equals(user, post.user);
    }

    @Override
    public int hashCode() {
        return Objects.hash(data, text, user);
    }
}
