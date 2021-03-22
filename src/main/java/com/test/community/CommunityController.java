package com.test.community;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@RequestMapping("/Community")
@RestController
public class CommunityController {

    @Resource(name="communityService")
    private CommunityImpl communityService;

    @RequestMapping(value = "community",method = RequestMethod.GET)
    public ModelAndView community(ModelAndView model){
        model.setViewName("Community/Community.tiles");
        return model;
    }
    @RequestMapping(value = "wirte",method = RequestMethod.GET)
    public ModelAndView co_write(ModelAndView model){
        model.setViewName("Community/Write.tiles");
        return model;
    }
}
