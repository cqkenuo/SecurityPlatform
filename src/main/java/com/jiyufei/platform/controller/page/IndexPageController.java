/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/1
 * Time: 14:26
 **/
package com.jiyufei.platform.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="front/")
public class IndexPageController {

    @RequestMapping(value="index.htm")
    public ModelAndView indexPage(){
        ModelAndView modelAndView = new ModelAndView("front/index");
        return modelAndView;
    }
    
    //默认页跳转到index.htm，让URL从根目录跳转到front/index.htm
    /*
    @RequestMapping(value="index0.htm")
    public String index1Page(){
        return "redirect:index.htm";
    }
    */
    
    @RequestMapping(value="login.htm")
    public ModelAndView loginPage(HttpSession httpSession){
        ModelAndView modelAndView = null;
        if(httpSession.getAttribute("userId") == null){
            modelAndView = new ModelAndView("front/login");
        }else{
            modelAndView = new ModelAndView("redirect:adminIndex.htm");
        }
        return modelAndView;
    }

}
