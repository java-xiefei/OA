package com.accp.commodityItem4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.accp.commodityItem4.pojo.Sjx;

public interface YouXiangDao {
	List<Sjx> query(@Param("bh")String bh,@Param("zt")Integer zt);
	List<Sjx> querytow(@Param("bh")String bh,@Param("zt")Integer zt);
	int modifyQjzt(@Param("id")Integer id,@Param("zt")Integer zt);
	int modifyBxzt(@Param("id")Integer id,@Param("zt")Integer zt);
}
