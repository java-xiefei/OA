package com.accp.commodityItem4.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.accp.commodityItem4.biz.YouXiangBiz;
import com.accp.commodityItem4.pojo.Sjx;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/a")
public class YouXiangAction {
	@Resource
	private YouXiangBiz biz;
	/**
	 * 请假记录表
	 * @param pageNum
	 * @param pageSize
	 * @param bh
	 * @param zt
	 * @return
	 */
	@RequestMapping("/list1")
	@ResponseBody
	public List<Sjx> show1(String bh,Integer zt){
		return biz.query(bh, zt);
	}
	/**
	 * 报销记录表
	 * @param pageNum
	 * @param pageSize
	 * @param bh
	 * @param zt
	 * @return
	 */
	@RequestMapping("/list2")
	@ResponseBody
	public List<Sjx> show2(String bh,Integer zt){
		return biz.querytow(bh, zt);
	}
	/**
	 * 请假记录表
	 * @param pageNum
	 * @param pageSize
	 * @param bh
	 * @param zt
	 * @return
	 */
	@RequestMapping("/list3")
	@ResponseBody
	public PageInfo<Sjx> show3(Integer pageNum,Integer pageSize,String bh,Integer zt){
		return biz.query(pageNum, pageSize, bh, zt);
	}
	/**
	 * 报销记录表
	 * @param pageNum
	 * @param pageSize
	 * @param bh
	 * @param zt
	 * @return
	 */
	@RequestMapping("/list4")
	@ResponseBody
	public PageInfo<Sjx> show4(Integer pageNum,Integer pageSize,String bh,Integer zt){
		return biz.querytow(pageNum, pageSize, bh, zt);
	}
	/**
	 * 请假状态修改
	 * @param id
	 * @return
	 */
	@RequestMapping("/list5")
	@ResponseBody
	public Map<String, String> show5(Integer id){
		Map<String, String> message = new HashMap<String,String>();
		if(biz.modifyQjzt(id)>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
	/**
	 * 报销状态修改
	 * @param id
	 * @return
	 */
	@RequestMapping("/list6")
	@ResponseBody
	public Map<String, String> show6(Integer id){
		Map<String, String> message = new HashMap<String,String>();
		if(biz.modifyBxzt(id)>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
}
