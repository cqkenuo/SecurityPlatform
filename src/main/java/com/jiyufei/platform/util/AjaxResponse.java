/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2018/2/11
 * Time: 10:49
 **/
package com.jiyufei.platform.util;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class AjaxResponse {
    
    private Integer code;
    private String msg;
    private Object content;
    
    public Integer getCode() {
        return code;
    }
    
    public void setCode(Integer code) {
        this.code = code;
    }
    
    public String getMsg() {
        return msg;
    }
    
    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    public Object getContent() {
        return content;
    }
    
    public void setContent(Object content) {
        this.content = content;
    }
}
