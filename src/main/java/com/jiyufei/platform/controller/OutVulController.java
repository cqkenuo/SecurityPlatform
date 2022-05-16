/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/16
 * Time: 10:26
 **/
package com.jiyufei.platform.controller;

import com.jiyufei.platform.bean.OutVul;
import com.jiyufei.platform.service.OutVulService;
import com.jiyufei.platform.service.SystemLogService;
import com.jiyufei.platform.service.VulTypeService;
import com.jiyufei.platform.util.AjaxResponse;
import com.jiyufei.platform.util.AjaxResponseList;
import com.jiyufei.platform.util.front.OutVulFront;
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
public class OutVulController {
    @Autowired
    private OutVulService outVulService;
    @Autowired
    private SystemLogService systemLogService;
    @Autowired
    private VulTypeService vulTypeService;
    
    
    private final static Logger logger = LoggerFactory.getLogger(OutVulController.class);
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
    
    @ResponseBody
    @RequestMapping(value="getAllOutVul.json",method= RequestMethod.POST)
    public AjaxResponseList getAllOutVul(Integer pageNum,Integer pageSize){
        AjaxResponseList ajaxResponseList = new AjaxResponseList();
        OutVul outVul = null;
        try {
            int num = 0;
            List<OutVul> outVulList = outVulService.getAllOutVulByStatus(2,pageNum,pageSize);
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
            num = outVulService.getAvailableCountByStatus(2);
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
            
            List<OutVulFront> outVulFrontList = new ArrayList<OutVulFront>();
            Iterator<OutVul> iterator = outVulList.iterator();
            while (iterator.hasNext()){
                outVul = iterator.next();
                OutVulFront outVulFront = new OutVulFront();
                outVulFront.setId(outVul.getId());
                outVulFront.setTitle(outVul.getTitle());
                outVulFront.setVulType(vulTypeService.getVulTypeById(outVul.getVulType()));
                outVulFront.setCve(outVul.getCve());
                outVulFront.setRisk(outVul.getRisk());
                /*
                outVulFront.setAffect(outVul.getAffect());
                outVulFront.setContent(outVul.getContent());
                outVulFront.setFix(outVul.getFix());
                */
                outVulFront.setNum(outVul.getNum());
                outVulFront.setHot(outVul.getHot());
                try {
                    if(outVul.getShowTime() == null){
                        outVulFront.setShowTime("-");
                    }else{
                        outVulFront.setShowTime(sdf.format(outVul.getShowTime()));
                    }
                }catch (Exception e){
                    outVulFront.setShowTime("错误");
                }
                try {
                    if(outVul.getUpdateTime() == null){
                        outVulFront.setUpdateTime("-");
                    }else{
                        outVulFront.setUpdateTime(sdf.format(outVul.getUpdateTime()));
                    }
                }catch (Exception e){
                    outVulFront.setUpdateTime("错误");
                }
                
                outVulFrontList.add(outVulFront);
            }
            ajaxResponseList.setCode(0);
            ajaxResponseList.setMsg("成功");
            ajaxResponseList.setContent(outVulFrontList);
            
        }catch (Exception e){
            ajaxResponseList.setCode(1002);
            ajaxResponseList.setMsg("数据处理失败");
            systemLogService.addSystemLog("外部漏洞","getAllOutVul",2,"数据处理失败！" + e.toString());
            logger.error("[OutVulController.getAllOutVul]发生错误！" + e.toString());
        }
        
        return ajaxResponseList;
    }
    
    @ResponseBody
    @RequestMapping(value="getOutVulById.json")
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
                ajaxResponse.setCode(1006);
                ajaxResponse.setMsg("查询结果为空");
                return ajaxResponse;
            }
            OutVulFront outVulFront = new OutVulFront();
            outVulFront.setId(outVul.getId());
            outVulFront.setTitle(outVul.getTitle());
            try {
                if(outVul.getVulType() == null || outVul.getVulType() < 0){
                    outVulFront.setVulType("-");
                    systemLogService.addSystemLog("外部漏洞","getOutVulById",2,"id为" + id + "的外部漏洞中，vulType为null！");
                }else{
                    
                    outVulFront.setVulType(vulTypeService.getVulTypeById(outVul.getVulType()));
                }
                
            }catch (Exception e){
                outVulFront.setVulType("错误");
            }
            outVulFront.setCve(outVul.getCve());
            outVulFront.setRisk(outVul.getRisk());
            outVulFront.setAffect(outVul.getAffect());
            outVulFront.setContent(outVul.getContent());
            outVulFront.setFix(outVul.getFix());
            outVulFront.setNum(outVul.getNum());
            outVulFront.setHot(outVul.getHot());
            try {
                if(outVul.getShowTime() == null){
                    outVulFront.setShowTime("-");
                }else{
                    outVulFront.setShowTime(sdf.format(outVul.getShowTime()));
                }
            }catch (Exception e){
                outVulFront.setShowTime("错误");
            }
            try {
                if(outVul.getUpdateTime() == null){
                    outVulFront.setUpdateTime("-");
                }else{
                    outVulFront.setUpdateTime(sdf.format(outVul.getUpdateTime()));
                    
                }
            }catch (Exception e){
                outVulFront.setUpdateTime("错误");
            }
            
        }catch (Exception e){
            ajaxResponse.setCode(1002);
            ajaxResponse.setMsg("数据处理失败");
            systemLogService.addSystemLog("外部漏洞","getOutVulById",2,"数据处理失败！" + e.toString());
            logger.error("[OutVulController.getOutVulById]发生错误！" + e.toString());
        }
        return ajaxResponse;
    }
    
    
    
    
}
