package com.accp.commodityItem4.biz;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.accp.commodityItem4.dao.employeeMapper;
import com.accp.commodityItem4.pojo.Check;
import com.accp.commodityItem4.pojo.leave;
import com.accp.commodityItem4.vo.EmployeeVo;
import com.accp.commodityItem4.vo.qjjlb;
import com.accp.commodityItem4.vo.qjlist;
import com.accp.commodityItem4.vo.qjxq;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("employeebiz")
public class employeeBiz {
	@Resource
	private employeeMapper dao;
	/**
	 * 登录验证
	 * @param employeeid
	 * @param password
	 * @return
	 */
	public EmployeeVo selectByPrimaryKey(Integer employeeid,String password) {
		return dao.selectByPrimaryKey(employeeid, password);
	}
	/**
	 * 新增请假表
	 * @param lea
	 * @return
	 */
	public int addXz(leave lea) {
		int i = dao.addXz(lea);
		System.out.println(i);
		if(i>0) {
			int zdz = dao.queryBy();
			System.out.println(zdz);
			int a = dao.addXz2(new Check(0,zdz,lea.getTypeId(),null,lea.getNextDealMan(),null,null));
			System.out.println(a);
		}		
		return i;
	}
	/**
	 * 请假记录查询
	 * @param gh
	 * @return
	 */
	public PageInfo<qjlist> query(Integer pageNum,Integer pageSize,Integer gh,String kssj,String jssj){
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<qjlist> info = new PageInfo<qjlist>(dao.query(gh,kssj,jssj));
		return info;
	}
	/**
	 * 请假详情
	 * @param bh
	 * @return
	 */
	public qjxq queryByBh(Integer bh) {
		return dao.queryByBh(bh);
	}
	/**
	 * 请假批准（修改）
	 * @param bh
	 * @param yj
	 * @param rq
	 * @param jg
	 * @return
	 */
	public int modifyXiuGai(Integer bh,String yj,String rq,Integer jg,String name,Integer shiyan) {
		System.out.println("123456");
		int b=0;
		if(shiyan==1) {
			int i = dao.modifyXiuck(bh, yj, rq, 1);
			System.out.println("i="+i);
			if(i>0) {
				int a = dao.modifyXiule(1006,4,bh);
				if(a>0) {
					b = dao.addQjjlb(bh, yj, rq, 1, name);
				}
			}
		}else if(shiyan==2) {
				System.out.println("1234567");
				int i = dao.modifyXiuck(bh, yj, rq, 2);
				if(i>0) {
					int a = dao.modifyXiule(10000,6,bh);
					if(a>0) {
						b = dao.addQjjlb(bh, yj, rq, 2, name);
					}
				}
		}else if(shiyan==3) {
			int i = dao.modifyXiuck(bh, yj, rq, 1);
			if(i>0) {
				int a = dao.modifyXiule(10000,7,bh);
				if(a>0) {
					b = dao.addQjjlb(bh, yj, rq, 1, name);
				}
			}
	}	
		return b;
	}
	/**
	 * 请假记录批准表
	 * @param bh
	 * @return
	 */
	public List<qjjlb> queryQjjl(Integer bh){	//请假记录批准表
		return dao.queryQjjl(bh);
	}
}
