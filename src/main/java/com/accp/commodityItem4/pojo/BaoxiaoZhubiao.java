package com.accp.commodityItem4.pojo;

import java.util.List;

public class BaoxiaoZhubiao {
	private Integer create_man; //报销人	
	private String create_time;//创建时间	
	private Integer department_id;//部门编号
	private Integer next_deal_man;//下个处理人	
	private String event;//报销事由	
	private Float total_count;//报销总金额	
	private Integer status_id;//状态，外键，关联状态表	
	private List<BaoxiaoXingbiao> baoxiao;
	
	@Override
	public String toString() {
		return "BaoxiaoZhubiao [create_man=" + create_man + ", create_time=" + create_time + ", department_id="
				+ department_id + ", next_deal_man=" + next_deal_man + ", event=" + event + ", total_count="
				+ total_count + ", status_id=" + status_id + ", baoxiao=" + baoxiao + "]";
	}
	public Integer getCreate_man() {
		return create_man;
	}
	public void setCreate_man(Integer create_man) {
		this.create_man = create_man;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public Integer getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(Integer department_id) {
		this.department_id = department_id;
	}
	public Integer getNext_deal_man() {
		return next_deal_man;
	}
	public void setNext_deal_man(Integer next_deal_man) {
		this.next_deal_man = next_deal_man;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public Float getTotal_count() {
		return total_count;
	}
	public void setTotal_count(Float total_count) {
		this.total_count = total_count;
	}
	public Integer getStatus_id() {
		return status_id;
	}
	public void setStatus_id(Integer status_id) {
		this.status_id = status_id;
	}
	public List<BaoxiaoXingbiao> getBaoxiao() {
		return baoxiao;
	}
	public void setBaoxiao(List<BaoxiaoXingbiao> baoxiao) {
		this.baoxiao = baoxiao;
	}
	public BaoxiaoZhubiao(Integer create_man, String create_time, Integer department_id, Integer next_deal_man,
			String event, Float total_count, Integer status_id, List<BaoxiaoXingbiao> baoxiao) {
		super();
		this.create_man = create_man;
		this.create_time = create_time;
		this.department_id = department_id;
		this.next_deal_man = next_deal_man;
		this.event = event;
		this.total_count = total_count;
		this.status_id = status_id;
		this.baoxiao = baoxiao;
	}
	public BaoxiaoZhubiao() {
		// TODO Auto-generated constructor stub
	}
}
