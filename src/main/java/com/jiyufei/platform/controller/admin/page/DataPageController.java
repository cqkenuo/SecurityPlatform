/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2021/2/1
 * Time: 15:21
 **/
package com.jiyufei.platform.controller.admin.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DataPageController {
    
    
    @RequestMapping("addData.htm")
    public ModelAndView addDataPage(){
        ModelAndView modelAndView = new ModelAndView("addData");
        return modelAndView;
    }
}
