package com.test.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RequestMapping("/Auth")
@RestController
public class AuthController {

    @Autowired
    private AuthImpl authService;

    @Resource(name = "bcryptPasswordEncoder")
    private BCryptPasswordEncoder bcryptPasswordEncoder;

    @RequestMapping(value = "Login",method = RequestMethod.GET)
    public ModelAndView login(ModelAndView model){
        //로그인 성공시 LoginSuccess 콜백하기
        model.setViewName("Auth/Login.tiles");
        return model;
    }

    @RequestMapping(value = "Logout",method = RequestMethod.GET)
    public ModelAndView Logout(ModelAndView model, HttpSession session){
        session.invalidate();
        model.setViewName("Auth/Login.tiles");
        return model;
    }

    @RequestMapping(value = "IsLogin.do",produces = "application/text; charset=utf8")
    @ResponseBody
    public String islogin(HttpSession session) {
        String data="";
        if(session.getAttribute("email") !=null){
            data="yes";
        }
        return data;
    }

    @GetMapping("Register")
    public ModelAndView register(ModelAndView model){

        model.setViewName("Auth/Register.tiles");
        return model;
    }
    @PostMapping("RegisterSuccess")
    public ModelAndView RegisterSuccess(@RequestParam Map<String, Object> map, ModelAndView model ){
        //주소 합치기
        String address = (String)map.get("address");
        try {
            String detailAddress = (String)map.get("detailAddress");
            System.out.println("address:"+address);
            System.out.println("detailAddress:"+detailAddress);
        }catch (NullPointerException e){
            System.out.println("address:"+address);
        }
        System.out.println("변졍전:"+map.get("pwd"));
        String pwd= (String) map.get("pwd");
        /*비밀번호 암호화*/
        String passwdrd = bcryptPasswordEncoder.encode(pwd);

        System.out.println(passwdrd);
        map.put("pwd", passwdrd);


        authService.insertMember(map);
        authService.insertAuth(map);
        model.setViewName("home.tiles");
        return model;
    }

    @PostMapping("LoginSuccess")
    public ModelAndView LoginSuccess(@RequestParam Map<String, Object> map, ModelAndView model, Model mo,
                                     HttpSession session, Authentication auth){
        System.out.println("로그인 정보:"+map);
        if(authService.selectOneMember(map) != null){
          AuthDTO dto = authService.selectOneMember(map);
          System.out.println("로그인성공");
          session.setAttribute("email",map.get("email"));

          System.out.println("세션 이메일"+session.getAttribute("email"));
          mo.addAttribute("name",dto.getName());
          model.setViewName("Auth/LoginSuccess.tiles");
      }
      else{ //로그인안된경우
          System.out.println("로그인실패");
          model.setViewName("Auth/Login.tiles");
      }
        return model;
    }

    @RequestMapping("LoginSuccessGeneral")
    public ModelAndView LoginSuccessGeneral(@RequestParam Map map, ModelAndView model,Model mod,Authentication auth){
        String email = ((UserDetails)auth.getPrincipal()).getUsername();
        map.put("email",email);
        AuthDTO dto = authService .selectOneMember(map);
        System.out.println(dto);

        model.setViewName("Auth/LoginSuccess.tiles");
        return model;
    }
}
