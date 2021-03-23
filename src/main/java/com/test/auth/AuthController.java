package com.test.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Map;

@RequestMapping("/Auth")
@RestController
public class AuthController {

    @Autowired
    private AuthImpl authService;

    @RequestMapping(value = "login",method = RequestMethod.GET)
    public ModelAndView login(ModelAndView model){
        model.setViewName("Auth/Login.tiles");
        return model;
    }

    @GetMapping("register")
    public ModelAndView register(ModelAndView model){
        model.setViewName("Auth/Register.tiles");
        return model;
    }
    @PostMapping("loginSuccess")
    public ModelAndView locginSuccess(@RequestParam Map<String, Object> map, ModelAndView model ){
        authService.insertMember(map);
        model.setViewName("home.tiles");
        return model;
    }
}
