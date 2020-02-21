package com.accp.commodityItem4.vo;

import java.util.List;

import com.accp.commodityItem4.pojo.BaoxiaoXingbiao;

public class BaoxiaoXG {
	private String zje;
	private String sy;
	private String zt;
	private String bh;
	private List<BaoxiaoXingbiao> baoxiao;	
	
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public String getZje() {
		return zje;
	}
	public void setZje(String zje) {
		this.zje = zje;
	}
	public String getSy() {
		return sy;
	}
	public void setSy(String sy) {
		this.sy = sy;
	}
	public List<BaoxiaoXingbiao> getBaoxiao() {
		return baoxiao;
	}
	public void setBaoxiao(List<BaoxiaoXingbiao> baoxiao) {
		this.baoxiao = baoxiao;
	}

}
