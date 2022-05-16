package com.jiyufei.platform.service;

import com.jiyufei.platform.bean.Log;

import java.util.Date;
import java.util.List;

public interface LogService {
    
    List<Log> getAllLog(Integer pageNum, Integer pageSize)  throws Exception;
    List<Log> getLogByExample(Log log, Date endTime, Integer pageNum, Integer pageSize) throws Exception;
    Log getLogById(Integer id) throws Exception;
    Integer addLog(Log log);
    Integer addLog(String logModule,Integer risk,Integer logType,Integer result,String msg,Integer userId);

}
