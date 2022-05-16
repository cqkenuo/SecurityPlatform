/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/2
 * Time: 11:12
 **/
package com.jiyufei.platform.service;

import com.github.pagehelper.PageHelper;
import com.jiyufei.platform.bean.OutVul;
import com.jiyufei.platform.bean.OutVulExample;
import com.jiyufei.platform.dao.OutVulMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("outVulService")
public class OutVulServiceImpl implements OutVulService {
    
    @Autowired
    private OutVulMapper outVulMapper;
    
    @Override
    public List<OutVul> getAllOutVul(Integer pageNum, Integer pageSize) throws Exception {
        OutVulExample outVulExample = new OutVulExample();
        outVulExample.setOrderByClause("id desc");
        PageHelper.startPage(pageNum,pageSize);
        List<OutVul> outVulList = outVulMapper.selectByExample(outVulExample);
        return outVulList;
    }
    
    @Override
    public List<OutVul> getAllOutVulByStatus(Integer status, Integer pageNum, Integer pageSize) throws Exception {
        OutVulExample outVulExample = new OutVulExample();
        outVulExample.createCriteria().andStatusEqualTo(status);
        outVulExample.setOrderByClause("id desc");
        PageHelper.startPage(pageNum,pageSize);
        List<OutVul> outVulList = outVulMapper.selectByExample(outVulExample);
        return outVulList;
    }
    
    @Override
    public OutVul getOutVulById(Integer id) throws Exception {
        return outVulMapper.selectByPrimaryKey(id);
    }
    
    @Override
    public List<OutVul> getOutVulByExample(OutVul outVul, Date endTime, Integer pageNum, Integer pageSize) throws Exception {
        OutVulExample outVulExample = new OutVulExample();
        OutVulExample.Criteria criteria = outVulExample.createCriteria();
    
        if(outVul.getTitle() != null && !"".equals(outVul.getTitle())){
            criteria.andTitleLike(outVul.getTitle());
        }
        if(outVul.getVulType() != null){
            criteria.andVulTypeEqualTo(outVul.getVulType());
        }
        if(outVul.getCve() != null && !"".equals(outVul.getCve())){
            criteria.andCveEqualTo(outVul.getCve());
        }
        if(outVul.getRisk() != null){
            criteria.andRiskEqualTo(outVul.getRisk());
        }
        if(outVul.getAffect() != null && !"".equals(outVul.getAffect())){
            criteria.andAffectLike(outVul.getAffect());
        }
        if(outVul.getContent() != null && !"".equals(outVul.getAffect())){
            criteria.andAffectLike(outVul.getAffect());
        }
        if(outVul.getFix() != null && !"".equals(outVul.getFix())){
            criteria.andFixLike(outVul.getFix());
        }
        if(outVul.getStatus() != null){
            criteria.andStatusEqualTo(outVul.getStatus());
        }
        //endTime在controller中判断，若startTime不为空，endTime为空，则设为今天
        if(outVul.getShowTime() != null){
            criteria.andShowTimeBetween(outVul.getShowTime(),endTime);
        }
        outVulExample.setOrderByClause("id desc");
        PageHelper.startPage(pageNum,pageSize);
        List<OutVul> outVulList = outVulMapper.selectByExample(outVulExample);
        return outVulList;
    }
    
    @Override
    public Integer addOutVul(OutVul outVul) throws Exception {
        Integer result = outVulMapper.insertSelective(outVul);
        if(result == 1){
            return outVul.getId();
        }
        return result;
    }
    
    @Override
    public Integer updateOutVul(OutVul outVul) throws Exception {
        return outVulMapper.updateByPrimaryKeySelective(outVul);
    }
    
    @Override
    public Integer deleteOutVul(Integer id) throws Exception {
        return outVulMapper.deleteByPrimaryKey(id);
    }
    
    @Override
    public Integer changeStatus(Integer id, Integer status) throws Exception {
        OutVul outVul = new OutVul();
        outVul.setId(id);
        outVul.setStatus(status);
        Integer result = outVulMapper.updateByPrimaryKeySelective(outVul);
        return result;
    }
    
    @Override
    public Integer getAllCount() throws Exception {
        OutVulExample outVulExample = new OutVulExample();
        outVulExample.createCriteria().andIdGreaterThan(-1);
        Long size = outVulMapper.countByExample(outVulExample);
        return size.intValue();
    }
    
    @Override
    public Integer getAvailableCountByStatus(Integer status) throws Exception {
        OutVulExample outVulExample = new OutVulExample();
        outVulExample.createCriteria().andStatusEqualTo(status);
        Long size = outVulMapper.countByExample(outVulExample);
        return size.intValue();
    }
}
