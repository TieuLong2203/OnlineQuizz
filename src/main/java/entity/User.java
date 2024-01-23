package entity;

import lombok.*;

import java.util.ArrayList;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class User {
    private int id;
    private String email;
    private String givenName;
    private String familyName;
    private String picture;
    private String username;
    private String password;
    private String createdAt;
    private String updatedAt;
    private ArrayList<Role> roles;
    private ArrayList<StarRate> ratedStar;
    private ArrayList<Test> doneTest;
    private ArrayList<Set> ownedSets;
    private ArrayList<SelfTest> selfTests;
    private ArrayList<Room> ownedRooms;
    private ArrayList<Room> joinedRooms;
    private ArrayList<Comment> comments;
}
