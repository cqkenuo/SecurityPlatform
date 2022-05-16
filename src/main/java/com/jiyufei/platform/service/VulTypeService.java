/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/9
 * Time: 14:23
 **/
package com.jiyufei.platform.service;

import com.jiyufei.platform.bean.VulType;

import java.util.List;

public interface VulTypeService {
    
    List<VulType> getAllVulType(Integer pageNum,Integer pageSize) throws Exception;
    String getVulTypeById(Integer id) throws Exception;
    Integer addVulType(String name) throws Exception;
    Integer updateVulType(VulType vulType) throws Exception;
    Integer getAllCount() throws Exception;
    
}
