/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/28
 * Time: 14:31
 **/
package com.jiyufei.platform.util.admin;

public class OutVulAdmin {
    
    private Integer id;
    private String title;
    private Integer vulType;
    private String vulTypeStr;
    private String cve;
    private Integer risk;
    private String affect;
    private String content;
    private String fix;
    private Integer status;
    private Integer num;
    private Integer hot;
    private String createTime;
    private String showTime;
    private String updateTime;
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public Integer getVulType() {
        return vulType;
    }
    
    public void setVulType(Integer vulType) {
        this.vulType = vulType;
    }
    
    public String getCve() {
        return cve;
    }
    
    public void setCve(String cve) {
        this.cve = cve;
    }
    
    public Integer getRisk() {
        return risk;
    }
    
    public void setRisk(Integer risk) {
        this.risk = risk;
    }
    
    public String getAffect() {
        return affect;
    }
    
    public void setAffect(String affect) {
        this.affect = affect;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public String getFix() {
        return fix;
    }
    
    public void setFix(String fix) {
        this.fix = fix;
    }
    
    public Integer getStatus() {
        return status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    
    public Integer getNum() {
        return num;
    }
    
    public void setNum(Integer num) {
        this.num = num;
    }
    
    public Integer getHot() {
        return hot;
    }
    
    public void setHot(Integer hot) {
        this.hot = hot;
    }
    
    public String getCreateTime() {
        return createTime;
    }
    
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    
    public String getShowTime() {
        return showTime;
    }
    
    public void setShowTime(String showTime) {
        this.showTime = showTime;
    }
    
    public String getUpdateTime() {
        return updateTime;
    }
    
    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
    
    public String getVulTypeStr() {
        return vulTypeStr;
    }
    
    public void setVulTypeStr(String vulTypeStr) {
        this.vulTypeStr = vulTypeStr;
    }
}
