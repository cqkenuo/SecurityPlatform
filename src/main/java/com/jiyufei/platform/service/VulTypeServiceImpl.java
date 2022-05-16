/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/9
 * Time: 14:31
 **/
package com.jiyufei.platform.service;

import com.github.pagehelper.PageHelper;
import com.jiyufei.platform.bean.VulType;
import com.jiyufei.platform.bean.VulTypeExample;
import com.jiyufei.platform.dao.VulTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("vulTypeService")
public class VulTypeServiceImpl implements VulTypeService {
    
    @Autowired
    private VulTypeMapper vulTypeMapper;
    
    @Override
    public List<VulType> getAllVulType(Integer pageNum, Integer pageSize) throws Exception {
        VulTypeExample vulTypeExample = new VulTypeExample();
        vulTypeExample.createCriteria().andIdGreaterThan(0);
        PageHelper.startPage(pageNum,pageSize);
        return vulTypeMapper.selectByExample(vulTypeExample);
    }
    
    @Override
    public String getVulTypeById(Integer id) throws Exception {
        VulType vulType = vulTypeMapper.selectByPrimaryKey(id);
        if(vulType != null){
            return vulType.getName();
        }
        return null;
    }
    
    @Override
    public Integer addVulType(String name) throws Exception {
        VulType vulType = new VulType();
        vulType.setName(name);
        return vulTypeMapper.insert(vulType);
    }
    
    @Override
    public Integer updateVulType(VulType vulType) throws Exception {
        
        return vulTypeMapper.updateByPrimaryKey(vulType);
    }
    
    @Override
    public Integer getAllCount() throws Exception {
        VulTypeExample vulTypeExample = new VulTypeExample();
        vulTypeExample.createCriteria().andIdGreaterThan(0);
        Long size = vulTypeMapper.countByExample(vulTypeExample);
        return size.intValue();
    }
}
