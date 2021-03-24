package com.test.mypage;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/Mypage")
public class MypageController {

    @RequestMapping(value = "Mypage",method = RequestMethod.GET)
    public ModelAndView Mypage(ModelAndView model){
        model.setViewName("Auth/Mypage.tiles");
        return model;
    }

}
