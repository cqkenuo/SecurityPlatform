/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/1
 * Time: 14:25
 **/
package com.jiyufei.platform.controller;

import com.jiyufei.platform.bean.InVul;
import com.jiyufei.platform.service.InVulService;
import com.jiyufei.platform.service.SystemLogService;
import com.jiyufei.platform.service.VulTypeService;
import com.jiyufei.platform.util.AjaxResponseList;
import com.jiyufei.platform.util.front.InVulFront;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping(value="front/")
public class InVulController {

    @Autowired
    private InVulService inVulService;
    @Autowired
    private SystemLogService systemLogService;
    @Autowired
    private VulTypeService vulTypeService;
    
    private final static Logger logger = LoggerFactory.getLogger(InVulController.class);
    
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
    
    @RequestMapping(value="getAllInVul.json",method= RequestMethod.POST)
    @ResponseBody
    public AjaxResponseList getAllInVul(Integer pageNum,Integer pageSize){
        AjaxResponseList ajaxResponseList = new AjaxResponseList();
        InVul inVul = null;
        try {
            int num = 0;
            List<InVul> inVulList = inVulService.getAllInVulByStatus(3,pageNum, pageSize);
            if(inVulList == null){
                ajaxResponseList.setCode(1001);
                ajaxResponseList.setMsg("查询数据库异常");
                return ajaxResponseList;
            }else if(inVulList.isEmpty()){
                ajaxResponseList.setCode(1006);
                ajaxResponseList.setMsg("查询结果为空");
                return ajaxResponseList;
            }
            
            Integer myPageNum = pageNum;
            if(pageNum == null || pageSize == null){
                ajaxResponseList.setCode(1007);
                ajaxResponseList.setMsg("参数不能为空");
                return ajaxResponseList;
            }
            if(myPageNum < 1){
                myPageNum = 1;
            }
            if(pageSize < 1 || pageSize > 100){
                ajaxResponseList.setCode(1004);
                ajaxResponseList.setMsg("分页大小不允许");
                return ajaxResponseList;
            }
            num = inVulService.getAvailableCountByStatus(3);
            ajaxResponseList.setNum(num);
            Integer start = (myPageNum-1)*pageSize + 1;
            if(start > num){
                if(num%pageSize == 0){
                    myPageNum = num/pageSize;
                    ajaxResponseList.setPageNum(myPageNum);
                }else{
                    myPageNum = num/pageSize + 1;
                    ajaxResponseList.setPageNum(myPageNum);
                }
            }else{
                ajaxResponseList.setPageNum(myPageNum);
            }
            start = (myPageNum-1)*pageSize + 1;
            ajaxResponseList.setStart(start);
            ajaxResponseList.setEnd((myPageNum-1)*pageSize + inVulList.size());
            List<InVulFront> inVulFrontList = new ArrayList<InVulFront>();
            Iterator<InVul> iterator = inVulList.iterator();
            while(iterator.hasNext()){
                inVul = iterator.next();
                InVulFront inVulFront = new InVulFront();
                inVulFront.setId(inVul.getId());
                inVulFront.setTitle(inVul.getTitle());
                inVulFront.setCve(inVul.getCve());
                inVulFront.setVulType(vulTypeService.getVulTypeById(inVul.getVulType()));
                /*
                if(inVul.getRisk() == 1){
                    inVulFront.setRisk("低");
                }else if(inVul.getRisk() == 2){
                    inVulFront.setRisk("中");
                }else if(inVul.getRisk() == 3){
                    inVulFront.setRisk("高");
                }else if(inVul.getRisk() == 4){
                    inVulFront.setRisk("严重");
                }
                */
                inVulFront.setNum(inVul.getNum());
                inVulFront.setRisk(inVul.getRisk());
                inVulFront.setUrl(inVul.getUrl());
                //此处出现break后未修正end和num数量
                if(inVul.getStatus() != 3){
                    //前台页面中不允许出现状态不是公开发布的内部漏洞
                    //跳过此条
                    systemLogService.addSystemLog("内部漏洞","getAllInVul",3,"查询状态为公开发布，结果中存在状态为非公开发布状态的条目");
                    break;
                }else{
                    inVulFront.setStatus("公开发布");
                }
                
                try {
                    inVulFront.setCreateTime(sdf.format(inVul.getCreateTime()));
                }catch (Exception e){
                    inVulFront.setCreateTime("-");
                }
                inVulFront.setDepartment(inVul.getDepartment());
                inVulFront.setPerson(inVul.getPerson());
                
                inVulFrontList.add(inVulFront);
            }
            ajaxResponseList.setContent(inVulFrontList);
            ajaxResponseList.setCode(0);
            ajaxResponseList.setMsg("成功");
        }catch (Exception e){
            ajaxResponseList.setCode(1002);
            ajaxResponseList.setMsg("数据处理失败");
            systemLogService.addSystemLog("内部漏洞","getAllInVul",2,"数据处理失败！" + e.toString());
            logger.error("[InVulController.getAllInVul]发生错误！" + e.toString());
        }
        
        return ajaxResponseList;
    }
    

}
