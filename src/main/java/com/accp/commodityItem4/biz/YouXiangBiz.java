package com.accp.commodityItem4.biz;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.accp.commodityItem4.dao.YouXiangDao;
import com.accp.commodityItem4.pojo.Sjx;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("youxiangbiz")
public class YouXiangBiz {
	@Resource
	private YouXiangDao dao;
	/**
	 * 请假记录
	 * @param bh
	 * @param zt
	 * @return
	 */
	public PageInfo<Sjx> query(Integer pageNum,Integer pageSize,String bh,Integer zt){
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<Sjx> page = new PageInfo<Sjx>(dao.query(bh, zt));
		return page;
	}
	/**
	 * 报销记录
	 * @param bh
	 * @param zt
	 * @return
	 */
	public PageInfo<Sjx> querytow(Integer pageNum,Integer pageSize,String bh,Integer zt){
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<Sjx> page = new PageInfo<Sjx>(dao.querytow(bh, zt));
		return page;
	}
	public List<Sjx> query(String bh,Integer zt){
		return dao.query(bh, zt);
	}
	/**
	 * 报销记录
	 * @param bh
	 * @param zt
	 * @return
	 */
	public List<Sjx> querytow(String bh,Integer zt){
		return dao.querytow(bh, zt);
	}
	/**
	 * 请假状态修改
	 * @param id
	 * @return
	 */
	public int modifyQjzt(Integer id) {
		return dao.modifyQjzt(id, 1);
	}
	/**
	 * 报销状态修改
	 * @param id
	 * @return
	 */
	public int modifyBxzt(Integer id) {
		return dao.modifyBxzt(id, 1);
	}
}
