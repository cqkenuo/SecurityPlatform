package com.jiyufei.platform.service;

import com.jiyufei.platform.bean.SystemLog;

import java.util.Date;
import java.util.List;

public interface SystemLogService {
    
    List<SystemLog> getAllSystemLog(Integer pageNum,Integer pageSize) throws Exception;
    List<SystemLog> getSystemLogByExample(SystemLog systemLog, Date endTime, Integer pageNum, Integer pageSize) throws Exception;
    SystemLog getSystemLogById(Integer id) throws Exception;
    Integer addSystemLog(SystemLog systemLog);
    Integer addSystemLog(String logModule,String method,Integer logType,String msg);
    
    
    
}
