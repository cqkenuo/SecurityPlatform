/**
 * Created by IntelliJ IDEA.
 * User: jiyufei
 * Date: 2020/12/10
 * Time: 14:41
 **/
package com.jiyufei.platform.util.admin;

public class InVulAdmin {
    
    private Integer id;
    private String title;
    private String cve;
    private String vulType;
    private Integer risk;
    private String url;
    private String content;
    private String affect;
    private String fix;
    private Integer num;
    private Integer status;
    private Integer fixStatus;
    private String createTime;
    private String expectTime;
    private String fixedTime;
    private String department;
    private String person;
    
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
    
    public String getCve() {
        return cve;
    }
    
    public void setCve(String cve) {
        this.cve = cve;
    }
    
    public String getVulType() {
        return vulType;
    }
    
    public void setVulType(String vulType) {
        this.vulType = vulType;
    }
    
    public Integer getRisk() {
        return risk;
    }
    
    public void setRisk(Integer risk) {
        this.risk = risk;
    }
    
    public String getUrl() {
        return url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public String getAffect() {
        return affect;
    }
    
    public void setAffect(String affect) {
        this.affect = affect;
    }
    
    public String getFix() {
        return fix;
    }
    
    public void setFix(String fix) {
        this.fix = fix;
    }
    
    public Integer getNum() {
        return num;
    }
    
    public void setNum(Integer num) {
        this.num = num;
    }
    
    public Integer getStatus() {
        return status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    
    public Integer getFixStatus() {
        return fixStatus;
    }
    
    public void setFixStatus(Integer fixStatus) {
        this.fixStatus = fixStatus;
    }
    
    public String getCreateTime() {
        return createTime;
    }
    
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    
    public String getExpectTime() {
        return expectTime;
    }
    
    public void setExpectTime(String expectTime) {
        this.expectTime = expectTime;
    }
    
    public String getFixedTime() {
        return fixedTime;
    }
    
    public void setFixedTime(String fixedTime) {
        this.fixedTime = fixedTime;
    }
    
    public String getDepartment() {
        return department;
    }
    
    public void setDepartment(String department) {
        this.department = department;
    }
    
    public String getPerson() {
        return person;
    }
    
    public void setPerson(String person) {
        this.person = person;
    }
}
