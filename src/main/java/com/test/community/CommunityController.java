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

    @RequestMapping(value = "Community",method = RequestMethod.GET)
    public ModelAndView community(ModelAndView model){
        model.setViewName("Community/Community.tiles");
        return model;
    }
    @RequestMapping(value = "Write",method = RequestMethod.GET)
    public ModelAndView co_write(ModelAndView model){
        model.setViewName("Community/Write.tiles");
        return model;
    }
    @RequestMapping(value = "Writer",method = RequestMethod.GET)
    public ModelAndView co_writer(ModelAndView model){
        //Write.jsp 에서 글작성 submit 후에 거치는 Controller
        model.setViewName("Community/Community.tiles");
        return model;
    }
}
