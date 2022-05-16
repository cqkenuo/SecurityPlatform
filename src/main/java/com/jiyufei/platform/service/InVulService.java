/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/1
 * Time: 15:00
 **/
package com.jiyufei.platform.service;


import com.jiyufei.platform.bean.InVul;

import java.util.Date;
import java.util.List;

public interface InVulService {
    
    List<InVul> getAllInVul(Integer pageNum, Integer pageSize) throws Exception;
    List<InVul> getAllInVulByStatus(Integer status,Integer pageNum, Integer pageSize) throws Exception;
    InVul getInVulById(Integer id) throws Exception;
    List<InVul> getInVulByExample(InVul inVul, Date createEndTime, Date expectEndTime, Integer pageNum, Integer pageSize) throws Exception;
    
    Integer addInVul(InVul invul) throws Exception;
    Integer updateInVul(InVul inVul) throws Exception;
    Integer deleteInVulById(Integer id) throws Exception;
    Integer changeStatusById(Integer id,Integer status) throws Exception;
    
    Integer getAllCount() throws Exception;
    Integer getAvailableCountByStatus(Integer status) throws Exception;
    

}
