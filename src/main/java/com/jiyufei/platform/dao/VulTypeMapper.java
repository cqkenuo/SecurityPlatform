package com.jiyufei.platform.dao;

import com.jiyufei.platform.bean.VulType;
import com.jiyufei.platform.bean.VulTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface VulTypeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    long countByExample(VulTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    int deleteByExample(VulTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    int insert(VulType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    int insertSelective(VulType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    List<VulType> selectByExample(VulTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    VulType selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") VulType record, @Param("example") VulTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") VulType record, @Param("example") VulTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(VulType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table vul_type
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(VulType record);
}