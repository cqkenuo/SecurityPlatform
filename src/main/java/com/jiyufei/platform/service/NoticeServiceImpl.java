/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/2
 * Time: 14:39
 **/
package com.jiyufei.platform.service;

import com.github.pagehelper.PageHelper;
import com.jiyufei.platform.bean.Notice;
import com.jiyufei.platform.bean.NoticeExample;
import com.jiyufei.platform.dao.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
    
    @Autowired
    private NoticeMapper noticeMapper;
    
    @Override
    public List<Notice> getAllNotice(Integer pageNum, Integer pageSize) throws Exception {
        NoticeExample noticeExample = new NoticeExample();
        noticeExample.setOrderByClause("id desc");
        PageHelper.startPage(pageNum,pageSize);
        return noticeMapper.selectByExample(noticeExample);
    }
    
    @Override
    public Notice getNoticeById(Integer id) throws Exception {
        return noticeMapper.selectByPrimaryKey(id);
    }
    
    @Override
    public List<Notice> getNoticeByExample(Notice notice, Date endTime, Integer pageNum, Integer pageSize) throws Exception {
        return null;
    }
    
    @Override
    public Integer addNotice(Notice notice) throws Exception {
        Integer result = noticeMapper.insertSelective(notice);
        if(result == 1){
            return notice.getId();
        }
        return result;
    }
    
    @Override
    public Integer updateNotice(Notice notice) throws Exception {
        return noticeMapper.updateByPrimaryKeySelective(notice);
    }
    
    @Override
    public Integer deleteNotice(Integer id) throws Exception {
        return noticeMapper.deleteByPrimaryKey(id);
    }
    
    @Override
    public Integer changeStatus(Integer id, Integer status) throws Exception {
        Notice notice = new Notice();
        notice.setId(id);
        notice.setStatus(status);
        return noticeMapper.updateByPrimaryKeySelective(notice);
    }
    
    @Override
    public Long getAllCount() throws Exception {
        NoticeExample noticeExample = new NoticeExample();
        noticeExample.createCriteria().andIdGreaterThan(-1);
        return noticeMapper.countByExample(noticeExample);
    }
    
    @Override
    public Long getAvailableCount(Integer status) throws Exception {
        NoticeExample noticeExample = new NoticeExample();
        noticeExample.createCriteria().andIdEqualTo(status);
        return noticeMapper.countByExample(noticeExample);
    }
}
