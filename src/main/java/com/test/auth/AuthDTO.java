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
    private String postcode;
    private String address1;
    private String address2;
    private String address3;
}