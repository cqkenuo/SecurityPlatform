/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/2
 * Time: 9:56
 **/
package com.jiyufei.platform.service;

import com.jiyufei.platform.bean.LoginUser;

import java.util.List;

public interface LoginUserService {
    
    List<LoginUser> getAllUser() throws Exception;
    LoginUser getUserById(Integer id) throws Exception;
    LoginUser getUserByMail(String mail) throws Exception;
    LoginUser getUserByUsername(String username) throws Exception;
    Long getAllCount() throws Exception;
    
}
