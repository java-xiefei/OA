package com.accp.commodityItem4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.accp.commodityItem4.pojo.BaoxiaoZhubiao;
import com.accp.commodityItem4.pojo.Bxxb;
import com.accp.commodityItem4.vo.BaoxiaoXG;
import com.accp.commodityItem4.vo.BaoxiaoXq;
import com.accp.commodityItem4.vo.Bxjl;
import com.accp.commodityItem4.vo.Bxjlxgxz;
import com.accp.commodityItem4.vo.Bxxq;

public interface BaoxiaoDao {
	int addZhoBiao(@Param("biao")BaoxiaoZhubiao biao);//主表新增
	int queryZdz();
	int addXiangbiao(@Param("xbiao")BaoxiaoZhubiao xbiao);//详表新增
	List<BaoxiaoXq> queryBy(@Param("zt")String zt,@Param("rq")String rq);//查询
	
	int modifyZt(@Param("bh")Integer bh,@Param("zt")Integer zt);//保存按钮修改状态
	int removeZb(@Param("bh")Integer bh);//删除主表
	int removexb(@Param("bh")Integer bh);//删除详表
	Bxxq querySy(@Param("bh")Integer bh);//报销详情
	List<Bxxb> selectBxxb(@Param("bh")Integer bh);//报销详表详情
	
	int modifyXG(@Param("xg")BaoxiaoXG xg);//修改
	int addXBzxz(@Param("xbiao")BaoxiaoXG xbiao);//详表再次新增
	List<Bxjl> selectBxjl(@Param("bh")Integer bh);//报销结果记录表详情
	
	int addZZxz(@Param("bx")Bxjlxgxz bx);//审批过后新增审批记录表
	int modifyZZxg(@Param("bx")Bxjlxgxz bx);//审批过后修改
}
