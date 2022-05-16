/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/28
 * Time: 14:07
 **/
package com.jiyufei.platform.controller.admin;


import com.jiyufei.platform.bean.OutVul;
import com.jiyufei.platform.bean.VulType;
import com.jiyufei.platform.service.OutVulService;
import com.jiyufei.platform.service.SystemLogService;
import com.jiyufei.platform.service.VulTypeService;
import com.jiyufei.platform.util.AjaxResponse;
import com.jiyufei.platform.util.AjaxResponseList;
import com.jiyufei.platform.util.admin.OutVulAdmin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/*@RequestMapping(value="admin/")*/
@Controller
public class OutVulAdminController {
    @Autowired
    private OutVulService outVulService;
    @Autowired
    private SystemLogService systemLogService;
    @Autowired
    private VulTypeService vulTypeService;
    
    private final static Logger logger = LoggerFactory.getLogger(OutVulAdminController.class);
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
    @ResponseBody
    @RequestMapping(value="getAllOutVul.ad",method= RequestMethod.POST)
    public AjaxResponseList getAllInVul(Integer pageNum,Integer pageSize){
        AjaxResponseList ajaxResponseList = new AjaxResponseList();
        OutVul outVul = null;
        try {
            int num = 0;
            List<OutVul> outVulList = outVulService.getAllOutVul(pageNum,pageSize);
            if(outVulList == null){
                ajaxResponseList.setCode(1001);
                ajaxResponseList.setMsg("查询数据库异常");
                return ajaxResponseList;
            }else if(outVulList.isEmpty()){
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
            num = outVulService.getAllCount();
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
            ajaxResponseList.setEnd((myPageNum-1)*pageSize + outVulList.size());
        
            List<OutVulAdmin> outVulAdminList = new ArrayList<OutVulAdmin>();
            Iterator<OutVul> iterator = outVulList.iterator();
            while (iterator.hasNext()){
                outVul = iterator.next();
                OutVulAdmin outVulAdmin = new OutVulAdmin();
                outVulAdmin.setId(outVul.getId());
                outVulAdmin.setTitle(outVul.getTitle());
                outVulAdmin.setVulTypeStr(vulTypeService.getVulTypeById(outVul.getVulType()));
                outVulAdmin.setVulType(outVul.getVulType());
                outVulAdmin.setCve(outVul.getCve());
                outVulAdmin.setRisk(outVul.getRisk());
                
                /*
                outVulAdmin.setAffect(outVul.getAffect());
                outVulAdmin.setContent(outVul.getContent());
                outVulAdmin.setFix(outVul.getFix());
                */
                
                //0:废弃 1：暂存 2：发布
                outVulAdmin.setStatus(outVul.getStatus());
                outVulAdmin.setNum(outVul.getNum());
                outVulAdmin.setHot(outVul.getHot());
                try {
                    if(outVul.getShowTime() == null){
                        outVulAdmin.setShowTime("-");
                    }else{
                        outVulAdmin.setShowTime(sdf.format(outVul.getShowTime()));
                    }
                }catch (Exception e){
                    outVulAdmin.setShowTime("错误");
                }
                try {
                    if(outVul.getUpdateTime() == null){
                        outVulAdmin.setUpdateTime("-");
                    }else{
                        outVulAdmin.setUpdateTime(sdf.format(outVul.getUpdateTime()));
                    }
                }catch (Exception e){
                    outVulAdmin.setUpdateTime("错误");
                }
            
                outVulAdminList.add(outVulAdmin);
            }
            ajaxResponseList.setCode(0);
            ajaxResponseList.setMsg("成功");
            ajaxResponseList.setContent(outVulAdminList);
        
        }catch (Exception e){
            ajaxResponseList.setCode(1002);
            ajaxResponseList.setMsg("数据处理失败");
            systemLogService.addSystemLog("外部漏洞Admin","getAllOutVul",2,"数据处理失败！" + e.toString());
            logger.error("[OutVulAdminController.getAllOutVul]发生错误！" + e.toString());
        }
        return ajaxResponseList;
    }
    
    
    @ResponseBody
    @RequestMapping(value="getOutVulById.ad",method= RequestMethod.POST)
    public AjaxResponse getOutVulById(Integer id){
        AjaxResponse ajaxResponse = new AjaxResponse();
        try {
            if(id == null || id < 0){
                ajaxResponse.setCode(1008);
                ajaxResponse.setMsg("参数不合法");
                return ajaxResponse;
            }
            OutVul outVul = outVulService.getOutVulById(id);
            if(outVul == null){
                ajaxResponse.setCode(1202);
                ajaxResponse.setMsg("查询的漏洞不存在");
                return ajaxResponse;
            }
            OutVulAdmin outVulAdmin = new OutVulAdmin();
            outVulAdmin.setId(outVul.getId());
            outVulAdmin.setTitle(outVul.getTitle());
            try {
                if(outVul.getVulType() == null || outVul.getVulType() < 0){
                    outVulAdmin.setVulTypeStr("-");
                    systemLogService.addSystemLog("外部漏洞Admin","getOutVulById",2,"id为" + id + "的外部漏洞中，vulType为null！");
                }else{
                    outVulAdmin.setVulTypeStr(vulTypeService.getVulTypeById(outVul.getVulType()));
                }
            }catch (Exception e){
                outVulAdmin.setVulTypeStr("错误");
            }
            outVulAdmin.setVulType(outVul.getVulType());
            outVulAdmin.setCve(outVul.getCve());
            outVulAdmin.setRisk(outVul.getRisk());
            outVulAdmin.setAffect(outVul.getAffect());
            outVulAdmin.setContent(outVul.getContent());
            outVulAdmin.setFix(outVul.getFix());
            outVulAdmin.setNum(outVul.getNum());
            outVulAdmin.setStatus(outVul.getStatus());
            outVulAdmin.setHot(outVul.getHot());
            try {
                if(outVul.getShowTime() == null){
                    outVulAdmin.setShowTime("-");
                }else{
                    outVulAdmin.setShowTime(sdf.format(outVul.getShowTime()));
                }
            }catch (Exception e){
                outVulAdmin.setShowTime("错误");
            }
            try {
                if(outVul.getCreateTime() == null){
                    outVulAdmin.setCreateTime("-");
                }else{
                    outVulAdmin.setCreateTime(sdf.format(outVul.getCreateTime()));
                }
            }catch (Exception e){
                outVulAdmin.setCreateTime("错误");
            }
            try {
                if(outVul.getUpdateTime() == null){
                    outVulAdmin.setUpdateTime("-");
                }else{
                    outVulAdmin.setUpdateTime(sdf.format(outVul.getUpdateTime()));
                }
            }catch (Exception e){
                outVulAdmin.setUpdateTime("错误");
            }
            ajaxResponse.setCode(0);
            ajaxResponse.setMsg("成功");
            ajaxResponse.setContent(outVulAdmin);
        }catch (Exception e){
            ajaxResponse.setCode(1002);
            ajaxResponse.setMsg("数据处理失败");
            systemLogService.addSystemLog("外部漏洞Admin","getOutVulById",2,"数据处理失败！" + e.toString());
            logger.error("[OutVulAdminController.getOutVulById]发生错误！" + e.toString());
        }
        return ajaxResponse;
    }
    
    @ResponseBody
    @RequestMapping(value="getAllVulType.ad",method= RequestMethod.POST)
    public AjaxResponse getAllVulType(Integer pageNum,Integer pageSize){
        AjaxResponse ajaxResponse  = new AjaxResponse();
        try {
            if(pageNum == null || pageSize == null){
                ajaxResponse.setCode(1007);
                ajaxResponse.setMsg("参数不能为空");
                return ajaxResponse;
            }
            
            if(pageSize < 0 || pageSize > 100){
                ajaxResponse.setCode(1004);
                ajaxResponse.setMsg("分页大小不允许");
                return ajaxResponse;
            }
            
            List<VulType> vulTypeList = vulTypeService.getAllVulType(1,0);
            if(vulTypeList == null){
                ajaxResponse.setCode(1001);
                ajaxResponse.setMsg("查询数据库异常");
                return ajaxResponse;
            }else if(vulTypeList.isEmpty()){
                ajaxResponse.setCode(1006);
                ajaxResponse.setMsg("查询结果为空");
                return ajaxResponse;
            }
            ajaxResponse.setCode(0);
            ajaxResponse.setMsg("成功");
            ajaxResponse.setContent(vulTypeList);
        }catch (Exception e){
            ajaxResponse.setCode(1002);
            ajaxResponse.setMsg("数据处理失败");
            systemLogService.addSystemLog("外部漏洞Admin","getAllVulType",2,"数据处理失败！" + e.toString());
            logger.error("[OutVulAdminController.getAllVulType]发生错误！" + e.toString());
        }
        return ajaxResponse;
    }
    
    
    @ResponseBody
    @RequestMapping(value="addOutVul.ad",method= RequestMethod.POST)
    public AjaxResponse addOutVul(OutVulAdmin outVulAdmin){
        AjaxResponse ajaxResponse = new AjaxResponse();
        OutVul outVul = new OutVul();
        if(outVulAdmin == null){
            ajaxResponse.setCode(1007);
            ajaxResponse.setMsg("参数不能为空");
            return ajaxResponse;
        }
        try {
            outVul.setTitle(outVulAdmin.getTitle());
            outVul.setVulType(outVulAdmin.getVulType());
            outVul.setCve(outVulAdmin.getCve());
            outVul.setRisk(outVulAdmin.getRisk());
            outVul.setAffect(outVulAdmin.getAffect());
            outVul.setContent(outVulAdmin.getContent());
            outVul.setFix(outVulAdmin.getFix());
            outVul.setStatus(outVulAdmin.getStatus());
            outVul.setNum(outVulAdmin.getNum());
            outVul.setHot(outVulAdmin.getHot());
            if(outVulAdmin.getStatus() == 2){
                outVul.setShowTime(new Date());
            }
            int result = outVulService.addOutVul(outVul);
            if(result < 1){
                systemLogService.addSystemLog("外部漏洞Admin","addOutVul",3,"添加外部漏洞信息时发生错误！返回值为" + result);
                ajaxResponse.setCode(1201);
                ajaxResponse.setContent("添加外部漏洞信息失败");
                return ajaxResponse;
            }else{
                ajaxResponse.setCode(0);
                ajaxResponse.setMsg("成功");
                ajaxResponse.setContent(result);
            }
        }catch (Exception e){
            ajaxResponse.setCode(1002);
            ajaxResponse.setMsg("数据处理失败");
            systemLogService.addSystemLog("外部漏洞Admin","addOutVul",2,"数据处理失败！" + e.toString());
            logger.error("[OutVulAdminController.addOutVul]发生错误！" + e.toString());
        }
        return ajaxResponse;
    }
    
    
    
    
}
