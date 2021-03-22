package com.test.auth;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@RequestMapping("/Auth")
@RestController
public class AuthController {

    @Resource(name="authService")
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
    public ModelAndView locginSuccess(@ModelAttribute("memberInfo") AuthDTO authDTO, ModelAndView model ){
        System.out.println(authDTO);
        model.setViewName("home.tiles");

        return model;
    }
}
