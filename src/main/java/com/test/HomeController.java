package com.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(Model model){
        System.out.println("###### [Intellij]가 구동중입니다 ######");
        model.addAttribute("msg","Hello World");
        return "home.tiles";
    }
}
