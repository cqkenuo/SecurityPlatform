/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/2
 * Time: 9:58
 **/
package com.jiyufei.platform.service;

import com.jiyufei.platform.bean.LoginUser;
import com.jiyufei.platform.bean.LoginUserExample;
import com.jiyufei.platform.dao.LoginUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("loginUser")
public class LoginUserServiceImpl implements LoginUserService {
    
    @Autowired
    private LoginUserMapper loginUserMapper;
    
    @Override
    public List<LoginUser> getAllUser() throws Exception {
        LoginUserExample loginUserExample = new LoginUserExample();
        loginUserExample.createCriteria().andIdGreaterThan(0);
        loginUserExample.setOrderByClause("id desc");
        List<LoginUser> loginUserList = loginUserMapper.selectByExample(loginUserExample);
        return loginUserList;
    }
    
    @Override
    public LoginUser getUserById(Integer id) throws Exception {
        
        return loginUserMapper.selectByPrimaryKey(id);
    }
    
    @Override
    public LoginUser getUserByMail(String mail) throws Exception {
        return loginUserMapper.getLoginUserByMail(mail);
    }
    
    @Override
    public LoginUser getUserByUsername(String username) throws Exception {
        return loginUserMapper.getLoginUserByUsername(username);
    }
    
    @Override
    public Long getAllCount() throws Exception {
        LoginUserExample loginUserExample = new LoginUserExample();
        loginUserExample.createCriteria().andIdGreaterThan(-1);
        return loginUserMapper.countByExample(loginUserExample);
    }
}
