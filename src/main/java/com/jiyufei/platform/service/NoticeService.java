/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/2
 * Time: 14:29
 **/
package com.jiyufei.platform.service;

import com.jiyufei.platform.bean.Notice;

import java.util.Date;
import java.util.List;

public interface NoticeService {

    List<Notice> getAllNotice(Integer pageNum,Integer pageSize) throws Exception;
    Notice getNoticeById(Integer id) throws Exception;
    List<Notice> getNoticeByExample(Notice notice, Date endTime,Integer pageNum,Integer pageSize) throws Exception;
    Integer addNotice(Notice notice) throws Exception;
    Integer updateNotice(Notice notice) throws Exception;
    Integer deleteNotice(Integer id) throws Exception;
    Integer changeStatus(Integer id,Integer status) throws Exception;
    Long getAllCount() throws Exception;
    Long getAvailableCount(Integer status) throws Exception;

}
