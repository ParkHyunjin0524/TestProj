package com.test.auth;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class AuthDTO {
    private String name;
    private String email;
    private String pwd;
    private String tel;
    private String address;

    public String getName() {
        return name;
    }
    public String getPwd() {
        return pwd;
    }
}