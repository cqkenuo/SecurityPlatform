/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/7
 * Time: 17:02
 **/
package com.jiyufei.platform.service;

import com.github.pagehelper.PageHelper;
import com.jiyufei.platform.bean.SystemLog;
import com.jiyufei.platform.bean.SystemLogExample;
import com.jiyufei.platform.dao.SystemLogMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("systemLogService")
public class SystemLogServiceImpl implements SystemLogService {
    @Autowired
    private SystemLogMapper systemLogMapper;
    
    
    private final static Logger logger = LoggerFactory.getLogger(SystemLogServiceImpl.class);
    
    @Override
    public List<SystemLog> getAllSystemLog(Integer pageNum, Integer pageSize) throws Exception {
        SystemLogExample systemLogExample = new SystemLogExample();
        systemLogExample.createCriteria().andIdGreaterThan(0);
        PageHelper.startPage(pageNum,pageSize);
        return systemLogMapper.selectByExample(systemLogExample);
    }
    
    @Override
    public List<SystemLog> getSystemLogByExample(SystemLog systemLog, Date endTime, Integer pageNum, Integer pageSize) throws Exception {
        SystemLogExample systemLogExample = new SystemLogExample();
        SystemLogExample.Criteria criteria =  systemLogExample.createCriteria();
        if(systemLog.getLogModule() != null && !systemLog.getLogModule().equals("")){
            criteria.andLogModuleEqualTo(systemLog.getLogModule());
        }
        if(systemLog.getMethod() != null && !systemLog.getMethod().equals("")){
            criteria.andMethodEqualTo(systemLog.getMethod());
        }
        if(systemLog.getLogType() != null && systemLog.getLogType() > 0){
            criteria.andLogTypeEqualTo(systemLog.getLogType());
        }
        if(systemLog.getLogType() != null && systemLog.getLogType() > 0){
            criteria.andLogTypeEqualTo(systemLog.getLogType());
        }
        if(systemLog.getCreateTime() != null && endTime != null){
            criteria.andCreateTimeBetween(systemLog.getCreateTime(),endTime);
        }
        PageHelper.startPage(pageNum,pageSize);
        List<SystemLog> systemLogList = systemLogMapper.selectByExample(systemLogExample);
        return systemLogList;
    }
    
    @Override
    public SystemLog getSystemLogById(Integer id) throws Exception {
        return systemLogMapper.selectByPrimaryKey(id);
    }
    
    @Override
    public Integer addSystemLog(SystemLog systemLog) {
        int result;
        try {
            result = systemLogMapper.insertSelective(systemLog);
            return result;
        }catch (Exception e){
            return 0;
        }
        
    }
    
    @Override
    public Integer addSystemLog(String logModule, String method, Integer logType, String msg) {
        int result = 0;
        SystemLog systemLog = new SystemLog();
        systemLog.setLogModule(logModule);
        systemLog.setMethod(method);
        systemLog.setLogType(logType);
        if(msg.length() > 255){
            systemLog.setMsg(msg.substring(0,255));
        }else{
            systemLog.setMsg(msg);
        }
        try {
            result =  systemLogMapper.insertSelective(systemLog);
        }catch (Exception e){
            e.printStackTrace();
            logger.error("[SystemLogServiceImpl.addSystemLog]添加system-log出错！" + e.toString());
            return 0;
        }
        return result;
    }
}
