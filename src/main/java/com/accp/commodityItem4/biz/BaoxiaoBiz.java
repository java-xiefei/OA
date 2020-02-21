package com.accp.commodityItem4.biz;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.accp.commodityItem4.dao.BaoxiaoDao;
import com.accp.commodityItem4.pojo.BaoxiaoXingbiao;
import com.accp.commodityItem4.pojo.BaoxiaoZhubiao;
import com.accp.commodityItem4.pojo.Bxxb;
import com.accp.commodityItem4.vo.BaoxiaoXG;
import com.accp.commodityItem4.vo.BaoxiaoXq;
import com.accp.commodityItem4.vo.Bxjl;
import com.accp.commodityItem4.vo.Bxjlxgxz;
import com.accp.commodityItem4.vo.Bxxq;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("baoxiaobiz")
public class BaoxiaoBiz {
	@Resource
	public BaoxiaoDao dao;
	 /**
	  * 报销单主详新增
	  * @param biao
	  * @return
	  */
	public int addZhoBiao(BaoxiaoZhubiao biao) {
		int j = 0;
		int i = dao.addZhoBiao(biao);
		System.out.println("i:"+i);
		if(i>0) {
			int num = dao.queryZdz(); //主表编号最大值
			System.out.println("num:"+num);
			for (BaoxiaoXingbiao  bx: biao.getBaoxiao()) {
				bx.setMain_id(num);
			}
			j = dao.addXiangbiao(biao);
		}
		return j;
	}
	/**
	 * 报销单查询
	 * @param pageNum
	 * @param pageSize
	 * @param zt
	 * @param rq
	 * @return
	 */
	public PageInfo<BaoxiaoXq> queryBy(Integer pageNum,Integer pageSize,String zt,String rq){
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<BaoxiaoXq> page = new PageInfo<BaoxiaoXq>(dao.queryBy(zt, rq));
		return page;
	}
	/**
	 * 修改状态
	 * @param bh
	 * @param zt
	 * @return
	 */
	public int modifyZt(@Param("bh")Integer bh,@Param("zt")Integer zt) {
		return dao.modifyZt(bh, zt);
	};	
	/**
	 * 删除详表
	 * @param bh
	 * @return
	 */
	public int removexb(@Param("bh")Integer bh) {
		int j =0;
		int i = dao.removexb(bh);
		if(i>0) {
			j = dao.removeZb(bh);
		}
		return j;
	}
	/**
	 * 报销详情
	 * @param bh
	 * @return
	 */
	public Bxxq querySy(Integer bh) {
		return dao.querySy(bh);
	}
	/**
	 * 报销详表详情
	 * @param bh
	 * @return
	 */
	public List<Bxxb> selectBxxb(Integer bh){
		return dao.selectBxxb(bh);
	}
	/**
	 * 主表修改加详表再次新增
	 * @param xg
	 * @return
	 */
	public int modifyXG(BaoxiaoXG xg) {
		int i = dao.modifyXG(xg);
		int j = 0 ;
		if(i>0) {
			j = dao.addXBzxz(xg);
		}
		return j;
	}
	/**
	 * 报销结果记录表详情
	 * @param bh
	 * @return
	 */
	public List<Bxjl> selectBxjl(@Param("bh")Integer bh){
		return dao.selectBxjl(bh);		
	}
	/**
	 *  审批记录表新增修改
	 * @param bx
	 * @return
	 */
	public int addZZxz(Bxjlxgxz bx) {
		int i = dao.addZZxz(bx);
		int j = 0;
		if(i>0) {
			j = dao.modifyZZxg(bx);
		}
		return j;
	}
}
