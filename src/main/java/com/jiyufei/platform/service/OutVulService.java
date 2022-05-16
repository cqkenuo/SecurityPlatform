package com.jiyufei.platform.service;

import com.jiyufei.platform.bean.OutVul;

import java.util.Date;
import java.util.List;

public interface OutVulService {
    
    List<OutVul> getAllOutVul(Integer pageNum, Integer pageSize) throws Exception;
    List<OutVul> getAllOutVulByStatus(Integer status,Integer pageNum, Integer pageSize) throws Exception;
    OutVul getOutVulById(Integer id) throws Exception;
    List<OutVul> getOutVulByExample(OutVul outVul, Date endTime, Integer pageNum, Integer pageSize) throws Exception;
    
    Integer addOutVul(OutVul outVul) throws Exception;
    Integer updateOutVul(OutVul outVul) throws Exception;
    Integer deleteOutVul(Integer id) throws Exception;
    Integer changeStatus(Integer id,Integer status) throws Exception;
    
    Integer getAllCount() throws Exception;
    Integer getAvailableCountByStatus(Integer status) throws Exception;

}
