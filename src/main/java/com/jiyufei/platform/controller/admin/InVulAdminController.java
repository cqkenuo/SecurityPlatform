/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/10
 * Time: 14:32
 **/
package com.jiyufei.platform.controller.admin;


import com.jiyufei.platform.bean.InVul;
import com.jiyufei.platform.service.InVulService;
import com.jiyufei.platform.service.SystemLogService;
import com.jiyufei.platform.service.VulTypeService;
import com.jiyufei.platform.util.AjaxResponseList;
import com.jiyufei.platform.util.admin.InVulAdmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/*@RequestMapping(value="admin/")*/
@Controller
public class InVulAdminController {
    
    @Autowired
    private InVulService inVulService;
    @Autowired
    private SystemLogService systemLogService;
    @Autowired
    private VulTypeService vulTypeService;
    
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
    @ResponseBody
    @RequestMapping(value="getAllInVul.ad",method= RequestMethod.POST)
    public AjaxResponseList getAllInVul(Integer pageNum, Integer pageSize){
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
            List<InVulAdmin> inVulAdminList = new ArrayList<InVulAdmin>();
            Iterator<InVul> iterator = inVulList.iterator();
            while(iterator.hasNext()){
                inVul = iterator.next();
                InVulAdmin inVulAdmin = new InVulAdmin();
                inVulAdmin.setId(inVul.getId());
                inVulAdmin.setTitle(inVul.getTitle());
                inVulAdmin.setCve(inVul.getCve());
                inVulAdmin.setVulType(vulTypeService.getVulTypeById(inVul.getVulType()));
                /*
                if(inVul.getRisk() == 1){
                    inVulAdmin.setRisk("低");
                }else if(inVul.getRisk() == 2){
                    inVulAdmin.setRisk("中");
                }else if(inVul.getRisk() == 3){
                    inVulAdmin.setRisk("高");
                }else if(inVul.getRisk() == 4){
                    inVulAdmin.setRisk("严重");
                }
                */
                inVulAdmin.setRisk(inVul.getRisk());
                inVulAdmin.setUrl(inVul.getUrl());
                inVulAdmin.setContent(inVul.getContent());
                inVulAdmin.setAffect(inVul.getAffect());
                inVulAdmin.setFix(inVul.getFix());
                inVulAdmin.setStatus(inVul.getStatus());
                /*
                if(inVul.getStatus() == 1){
                    inVulAdmin.setStatus("废弃");
                }else if(inVul.getStatus() == 2){
                    inVulAdmin.setStatus("暂存");
                }else if(inVul.getStatus() == 3){
                    inVulAdmin.setStatus("内部发布");
                }else if(inVul.getStatus() == 4){
                    inVulAdmin.setStatus("公开发布");
                }else{
                    inVulAdmin.setStatus("状态错误");
                }
                */
                inVulAdmin.setNum(inVul.getNum());
                inVulAdmin.setFixStatus(inVul.getFixStatus());
                /*
                if(inVul.getFixStatus() == 1){
                    inVulAdmin.setFixStatus("未修复");
                }else if(inVul.getFixStatus() == 2){
                    inVulAdmin.setFixStatus("等待复测");
                }else if(inVul.getFixStatus() == 3){
                    inVulAdmin.setFixStatus("接受风险");
                }else if(inVul.getFixStatus() == 4){
                    inVulAdmin.setFixStatus("已修复");
                }else{
                    inVulAdmin.setFixStatus("状态错误");
                }
                */
                try {
                    inVulAdmin.setCreateTime(sdf.format(inVul.getCreateTime()));
                }catch (Exception e){
                    inVulAdmin.setCreateTime("错误");
                }
                try {
                    if(inVul.getExpectTime() != null){
                        inVulAdmin.setExpectTime(sdf.format(inVul.getExpectTime()));
                    }else{
                        inVulAdmin.setExpectTime("-");
                    }
                }catch (Exception e){
                    inVulAdmin.setExpectTime("错误");
                }
                try {
                    if(inVul.getFixedTime() != null){
                        inVulAdmin.setFixedTime(sdf.format(inVul.getFixedTime()));
                    }else{
                        inVulAdmin.setFixedTime("-");
                    }
                }catch (Exception e){
                    inVulAdmin.setFixedTime("错误");
                }
                inVulAdmin.setDepartment(inVul.getDepartment());
                inVulAdmin.setPerson(inVul.getPerson());
    
                inVulAdminList.add(inVulAdmin);
            }
            ajaxResponseList.setContent(inVulAdminList);
            ajaxResponseList.setCode(0);
            ajaxResponseList.setMsg("成功");
        }catch (Exception e){
            ajaxResponseList.setCode(1002);
            ajaxResponseList.setMsg("数据处理失败");
            systemLogService.addSystemLog("内部漏洞","getAllInVul",2,"数据处理失败！" + e.toString());
            //logger.error("[InVulController.getAllInVul]发生错误！" + e.toString());
        }
        
        return ajaxResponseList;
    }
    
}
