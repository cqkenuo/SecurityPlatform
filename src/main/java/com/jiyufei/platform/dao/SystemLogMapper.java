package com.jiyufei.platform.dao;

import com.jiyufei.platform.bean.SystemLog;
import com.jiyufei.platform.bean.SystemLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SystemLogMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    long countByExample(SystemLogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    int deleteByExample(SystemLogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    int insert(SystemLog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    int insertSelective(SystemLog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    List<SystemLog> selectByExample(SystemLogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    SystemLog selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") SystemLog record, @Param("example") SystemLogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") SystemLog record, @Param("example") SystemLogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(SystemLog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table system_log
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(SystemLog record);
}