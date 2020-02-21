package com.accp.commodityItem4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.accp.commodityItem4.pojo.Check;
import com.accp.commodityItem4.pojo.leave;
import com.accp.commodityItem4.vo.EmployeeVo;
import com.accp.commodityItem4.vo.qjjlb;
import com.accp.commodityItem4.vo.qjlist;
import com.accp.commodityItem4.vo.qjxq;



public interface employeeMapper {
	EmployeeVo selectByPrimaryKey(@Param("employeeid")Integer employeeid,@Param("password")String password);
	int addXz(@Param("lea")leave lea); //新增请假表
	int queryBy(); //查询最大值
	int addXz2(@Param("ck")Check ck); //新增审查记录表
	List<qjlist> query(@Param("gh")Integer gh,@Param("kssj")String kssj,@Param("jssj")String jssj);//请假记录查询
	qjxq queryByBh(@Param("bh")Integer bh);
	int modifyXiuck(@Param("bh")Integer bh,@Param("yj")String yj,@Param("rq")String rq,@Param("jg")Integer jg);//修改check审查记录表表
	int modifyXiule(@Param("zt")Integer zt,@Param("clr")Integer clr,@Param("bh")Integer bh);//修改lea表
	int addQjjlb(@Param("bh")Integer bh,@Param("yj")String yj,@Param("rq")String rq,@Param("jg")Integer jg,@Param("name")String name);
	List<qjjlb> queryQjjl(@Param("bh")Integer bh); //请假记录
}