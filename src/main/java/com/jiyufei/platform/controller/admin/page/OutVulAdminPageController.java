/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/30
 * Time: 15:43
 **/
package com.jiyufei.platform.controller.admin.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OutVulAdminPageController {
    
    @RequestMapping("listOutVul.htm")
    public ModelAndView listOutVulPage(){
        ModelAndView modelAndView = new ModelAndView("listOutVul");
        modelAndView.addObject("pageNum",1);
        return modelAndView;
    }
    
    @RequestMapping("addOutVul.htm")
    public ModelAndView addOutVulPage(){
        ModelAndView modelAndView = new ModelAndView("addOutVul");
        return modelAndView;
    }
    
    @RequestMapping("showOutVul.htm")
    public ModelAndView showOutVulPage(Integer id){
        ModelAndView modelAndView = new ModelAndView("showOutVul");
        if(id == null || id < 0){
           id = 0;
        }
        modelAndView.addObject("id",id);
        return modelAndView;
    }
    
}
