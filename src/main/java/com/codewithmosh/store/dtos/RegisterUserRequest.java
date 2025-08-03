package com.codewithmosh.store.dtos;

import lombok.Data;

@Data
public class RegisterUserRequest {
    public String name;
    public String email;
    public String password;

}
