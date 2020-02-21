package com.accp.commodityItem4.pojo;

public class BaoxiaoXingbiao {
	private Integer main_id;//报销主表编号
	private Float subTotal;//事项金额
	private String desc;//事项描述
	private String pictrue_name;//报销单图片名
	private String pictrue_path;//报销单真实路径
	
	@Override
	public String toString() {
		return "BaoxiaoXingbiao [main_id=" + main_id + ", subTotal=" + subTotal + ", desc=" + desc + ", pictrue_name="
				+ pictrue_name + ", pictrue_path=" + pictrue_path + "]";
	}
	public Integer getMain_id() {
		return main_id;
	}
	public void setMain_id(Integer main_id) {
		this.main_id = main_id;
	}
	public Float getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Float subTotal) {
		this.subTotal = subTotal;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getPictrue_name() {
		return pictrue_name;
	}
	public void setPictrue_name(String pictrue_name) {
		this.pictrue_name = pictrue_name;
	}
	public String getPictrue_path() {
		return pictrue_path;
	}
	public void setPictrue_path(String pictrue_path) {
		this.pictrue_path = pictrue_path;
	}
	public BaoxiaoXingbiao(Integer main_id, Float subTotal, String desc, String pictrue_name, String pictrue_path) {
		super();
		this.main_id = main_id;
		this.subTotal = subTotal;
		this.desc = desc;
		this.pictrue_name = pictrue_name;
		this.pictrue_path = pictrue_path;
	}
	public BaoxiaoXingbiao() {
		// TODO Auto-generated constructor stub
	}
}
