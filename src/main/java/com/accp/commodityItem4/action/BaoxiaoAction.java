package com.accp.commodityItem4.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.accp.commodityItem4.biz.BaoxiaoBiz;
import com.accp.commodityItem4.pojo.BaoxiaoZhubiao;
import com.accp.commodityItem4.pojo.Bxxb;
import com.accp.commodityItem4.vo.BaoxiaoXG;
import com.accp.commodityItem4.vo.BaoxiaoXq;
import com.accp.commodityItem4.vo.Bxjl;
import com.accp.commodityItem4.vo.Bxjlxgxz;
import com.accp.commodityItem4.vo.Bxxq;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/b")
public class BaoxiaoAction {
	@Resource
	public BaoxiaoBiz biz;
	
	@PostMapping("/list")
	@ResponseBody
	public Map<String, Object> show1(@RequestBody BaoxiaoZhubiao biao) {
		Map<String, Object> message = new HashMap<String,Object>();
		int i = biz.addZhoBiao(biao);
		System.out.println(biao.getEvent());
		if(i>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
	/**
	 * 报销单查询
	 * @param pageNum
	 * @param pageSize
	 * @param zt
	 * @param rq
	 * @return
	 */
	@GetMapping("/list1")
	@ResponseBody
	public PageInfo<BaoxiaoXq> show2(Integer pageNum,Integer pageSize,String zt,String rq) {
		System.out.println(pageNum);
		System.out.println(pageSize);
		System.out.println("状态:"+zt);
		System.out.println("日期:"+rq);
		return biz.queryBy(pageNum, pageSize, zt, rq);
	}
	/**
	 * 修改状态
	 * @param bh
	 * @return
	 */
	@GetMapping("/list2")
	@ResponseBody
	public Map<String, Object> show3(Integer bh) {
		Map<String, Object> message = new HashMap<String,Object>();
		int i = biz.modifyZt(bh, 2);
		if(i>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
	/**
	 * 删除主详表
	 * @param bh
	 * @return
	 */
	@GetMapping("/list3")
	@ResponseBody
	public Map<String, Object> show4(Integer bh) {
		Map<String, Object> message = new HashMap<String,Object>();
		int i = biz.removexb(bh);
		if(i>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
	/**
	 * 报销详情查询
	 * @param bh
	 * @return
	 */
	@GetMapping("/list4")
	@ResponseBody
	public Bxxq show5(Integer bh) {
		return biz.querySy(bh);
	}
	/**
	 * 报销详情查询
	 * @param bh
	 * @return
	 */
	@GetMapping("/list5")
	@ResponseBody
	public List<Bxxb> show6(Integer bh) {
		return biz.selectBxxb(bh);				
	}
	/**
	 * 主表修改加详表再次新增
	 * @param xg
	 * @return
	 */
	@PostMapping("/list6")
	@ResponseBody
	public Map<String, Object> show7(@RequestBody BaoxiaoXG xg) {
		Map<String, Object> message = new HashMap<String,Object>();
		int i = biz.modifyXG(xg);
		if(i>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
	/**
	 * 报销结果记录表详情
	 * @param bh
	 * @return
	 */
	@GetMapping("/list7")
	@ResponseBody
	public List<Bxjl> show7(Integer bh) {
		return biz.selectBxjl(bh);		
	}
	/**
	 * 审批记录表新增修改
	 * @param bx
	 * @return
	 */
	@PostMapping("/list8")
	@ResponseBody
	public Map<String, Object> show8(@RequestBody Bxjlxgxz bx) {
		Map<String, Object> message = new HashMap<String,Object>();
		int i = biz.addZZxz(bx);
		if(i>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
}
