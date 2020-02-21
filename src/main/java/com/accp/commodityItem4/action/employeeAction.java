package com.accp.commodityItem4.action;

import java.awt.print.Paper;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.accp.commodityItem4.biz.employeeBiz;
import com.accp.commodityItem4.pojo.Check;
import com.accp.commodityItem4.pojo.employee;
import com.accp.commodityItem4.pojo.leave;
import com.accp.commodityItem4.util.faceSend;
import com.accp.commodityItem4.vo.EmployeeVo;
import com.accp.commodityItem4.vo.ResultVo;
import com.accp.commodityItem4.vo.qjjlb;
import com.accp.commodityItem4.vo.qjlist;
import com.accp.commodityItem4.vo.qjxq;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/c")
public class employeeAction {
	@Resource
	private employeeBiz biz;
	
	/**
	 * 登录验证
	 * @param session
	 * @param employeeid
	 * @param password
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, String> findEmployee(HttpSession session,Integer employeeid,String password, String img) {
		EmployeeVo emp = biz.selectByPrimaryKey(employeeid, password);
		System.out.println(img);
		System.out.println(emp);
		Map<String, String> message = new HashMap<String, String>();
		ResultVo result = null;
		try {
			result = JSON.parseObject(faceSend.faceverify(img), ResultVo.class);
			if(result!=null) {
				if (result.getResult().getFace_liveness() > 0.5) {
					System.out.println(emp.getImgph());
					result = JSON.parseObject(faceSend.matchFace(img, new File("E:/myfile/images/" + emp.getImgph())),
							ResultVo.class);
					if (result.getResult().getScore() > 85) {
						message.put("code", "200");
						message.put("msg", "验证成功!");
						System.out.println("是本人");
						session.setAttribute("emp", emp);
						session.setMaxInactiveInterval(120000);
					} else {
						message.put("code", "300");
						message.put("msg", "验证错误！请让本人登录!");
						System.out.println("不是本人");
					}
				} else {
					message.put("code", "400");
					message.put("msg", "请正视摄像头!");
				}
			}else {
				message.put("code", "400");
				message.put("msg", "请正视摄像头!");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result);
		return message;
	}
	
	/*
	 * public Map<String, String> show(HttpSession session,Integer employeeid,String
	 * password) { System.out.println(employeeid); System.out.println(password);
	 * Map<String, String> pu = new HashMap<String, String>(); employee e =
	 * biz.selectByPrimaryKey(employeeid, password); if(e!=null) {
	 * pu.put("code","200"); session.setAttribute("list",e); }else {
	 * pu.put("code","500"); } return pu; }
	 */
	/**
	 * 退出登录
	 * @param session
	 * @return
	 */
	@RequestMapping("/list1")
	@ResponseBody
	public Map<String, Object> show1(HttpSession session,HttpServletRequest request) {
		Map<String, Object> message = new HashMap<String,Object>();
		session.removeAttribute("list");
		session.invalidate();//会话销毁
		if(request.getSession(false)==null) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
	/**
	 * 请假
	 * @return
	 */
	@RequestMapping("/list2")
	@ResponseBody
	public Map<String, Object> show2(leave lea) {
		System.out.println(lea);
		Map<String, Object> message = new HashMap<String,Object>();
		if(biz.addXz(lea)>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
	/**
	 * 请假列表
	 * @return
	 */
	@RequestMapping("/list3")
	@ResponseBody
	public Map<String, Object> show3(leave lea) {
		System.out.println(lea);
		Map<String, Object> message = new HashMap<String,Object>();
		if(biz.addXz(lea)>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
	/**
	 * 请假列表
	 * @return
	 */
	@RequestMapping("/list4")
	@ResponseBody
	public PageInfo<qjlist> show4(Integer pageNum,Integer gh,String kssj,String jssj) {
		System.out.println(pageNum);
		System.out.println(gh);
		if(kssj=="") {
			kssj=null;
		}
		if(jssj=="") {
			jssj=null;
		}
		System.out.println(kssj);
		System.out.println(jssj);
		PageInfo<qjlist> info = biz.query(pageNum, 3, gh,kssj,jssj);
		info.getList().forEach(row->{
			System.out.println(row);
		});
		return info;
	}
	/**
	 * 请假详情
	 * @param bh
	 * @return
	 */
	@RequestMapping("/list5")
	@ResponseBody
	public qjxq show5(Integer bh) {
		return biz.queryByBh(bh);
	}
	/**
	 * 请假批准通过（修改）
	 * @param session
	 * @param bh
	 * @param yj
	 * @param rq
	 * @param jg
	 * @return
	 */
	@RequestMapping("/list6")
	@ResponseBody
	public Map<String, Object> show6(HttpSession session,Integer bh,String yj,String rq,Integer jg) {
		EmployeeVo emp = (EmployeeVo)session.getAttribute("emp");
		System.out.println(emp.getEmployeename());
		Map<String, Object> message = new HashMap<String,Object>();
		if(biz.modifyXiuGai(bh, yj, rq, jg, emp.getEmployeename(),1)>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
	/**
	 * 请假记录批准表
	 * @param bh
	 * @return
	 */
	@RequestMapping("/list7")
	@ResponseBody
	public List<qjjlb> show7(Integer bh) {
		return biz.queryQjjl(bh);
	}
	/**
	 * 请假批准通过（修改）
	 * @param session
	 * @param bh
	 * @param yj
	 * @param rq
	 * @param jg
	 * @return
	 */
	@RequestMapping("/list8")
	@ResponseBody
	public Map<String, Object> show8(HttpSession session,Integer bh,String yj,String rq,Integer jg) {
		EmployeeVo emp = (EmployeeVo)session.getAttribute("emp");
		System.out.println(emp.getEmployeename());
		Map<String, Object> message = new HashMap<String,Object>();
		if(biz.modifyXiuGai(bh, yj, rq, jg, emp.getEmployeename(),2)>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
	/**
	 * 请假批准通过存档（修改）
	 * @param session
	 * @param bh
	 * @param yj
	 * @param rq
	 * @param jg
	 * @return
	 */
	@RequestMapping("/list9")
	@ResponseBody
	public Map<String, Object> show9(HttpSession session,Integer bh,String yj,String rq,Integer jg) {
		EmployeeVo emp = (EmployeeVo)session.getAttribute("emp");
		System.out.println(emp.getEmployeename());
		Map<String, Object> message = new HashMap<String,Object>();
		if(biz.modifyXiuGai(bh, yj, rq, jg, emp.getEmployeename(),3)>0) {
			message.put("code","200");
		}else {
			message.put("code","500");
		}
		return message;
	}
}
