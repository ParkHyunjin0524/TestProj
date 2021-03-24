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

    @RequestMapping(value = "Login",method = RequestMethod.GET)
    public ModelAndView login(ModelAndView model){
        model.setViewName("Auth/Login.tiles");
        return model;
    }

    @GetMapping("Register")
    public ModelAndView register(ModelAndView model){
        model.setViewName("Auth/Register.tiles");
        return model;
    }
    @PostMapping("LoginSuccess")
    public ModelAndView loginSuccess(@RequestParam Map<String, Object> map, ModelAndView model ){
        //주소 합치기
        String address = (String)map.get("address");
        try {
            String detailAddress = (String)map.get("detailAddress");
            System.out.println("address:"+address);
            System.out.println("detailAddress:"+detailAddress);
        }catch (NullPointerException e){
            System.out.println("address:"+address);
        }
        authService.insertMember(map);
        model.setViewName("home.tiles");
        return model;
    }
}
