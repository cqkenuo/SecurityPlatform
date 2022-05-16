/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/14
 * Time: 16:02
 **/
package com.jiyufei.platform.controller.admin.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class IndexAdminPageController {
    
    @RequestMapping("adminIndex.htm")
    public ModelAndView adminIndexPage(){
        ModelAndView modelAndView = new ModelAndView("admin-index");
        return modelAndView;
    }
}
