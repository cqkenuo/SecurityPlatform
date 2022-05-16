/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/3
 * Time: 15:38
 **/
package com.jiyufei.platform.service;

import com.github.pagehelper.PageHelper;
import com.jiyufei.platform.bean.Log;
import com.jiyufei.platform.bean.LogExample;
import com.jiyufei.platform.dao.LogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("logService")
public class LogServiceImpl implements LogService {
    
    @Autowired
    private LogMapper logMapper;
    
    @Override
    public List<Log> getAllLog(Integer pageNum, Integer pageSize) throws Exception {
        LogExample logExample = new LogExample();
        logExample.createCriteria().andIdGreaterThan(new Integer(0));
        PageHelper.startPage(pageNum,pageSize);
        List<Log> logList = logMapper.selectByExample(logExample);
        return logList;
    }
    
    @Override
    public List<Log> getLogByExample(Log log, Date endTime, Integer pageNum, Integer pageSize) throws Exception {
        LogExample  logExample = new LogExample();
        LogExample.Criteria criteria =  logExample.createCriteria();
        if(log.getLogModule() != null && !log.getLogModule().equals("")){
            criteria.andLogModuleEqualTo(log.getLogModule());
        }
        if(log.getRisk() != null && log.getRisk() > 0){
            criteria.andRiskEqualTo(log.getRisk());
        }
        if(log.getLogType() != null && log.getLogType() > 0){
            criteria.andLogTypeEqualTo(log.getLogType());
        }
        if(log.getResult() != null && log.getResult() > 0){
            criteria.andResultEqualTo(log.getResult());
        }
        if(log.getCreateTime() != null && endTime != null){
            criteria.andCreateTimeBetween(log.getCreateTime(),endTime);
        }
        PageHelper.startPage(pageNum,pageSize);
        List<Log> logList = logMapper.selectByExample(logExample);
        return logList;
    }
    
    @Override
    public Log getLogById(Integer id) throws Exception {
        return logMapper.selectByPrimaryKey(id);
    }
    
    @Override
    public Integer addLog(Log log) {
        return logMapper.insertSelective(log);
    }
    
    @Override
    public Integer addLog(String logModule, Integer risk, Integer logType, Integer result, String msg, Integer userId) {
        Log log = new Log();
        log.setId(null);
        log.setLogModule(logModule);
        log.setRisk(risk);
        log.setLogType(logType);
        log.setResult(result);
        if(msg.length() > 255){
            log.setMsg(msg.substring(0,255));
        }else{
            log.setMsg(msg);
        }
        log.setUserId(userId);
        return logMapper.insertSelective(log);
    }
}
