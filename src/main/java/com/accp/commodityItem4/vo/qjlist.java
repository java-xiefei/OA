package com.accp.commodityItem4.vo;

public class qjlist {
	private Integer bh; //编号
	private String qjname;//请假人姓名
	private Integer counts;//请假天数
	private String fqTime;//发起时间
	private String spTime;//审批时间
	private String spyj;//审批意见
	private String dclr;//待处理人
	private String spzt; //审批状态
	private Integer leid;//请假表id
	private Integer emid;//用户id
	private String kssj;//开始时间
	private String jssj;//结束时间
	
	
	@Override
	public String toString() {
		return "qjlist [bh=" + bh + ", qjname=" + qjname + ", counts=" + counts + ", fqTime=" + fqTime + ", spTime="
				+ spTime + ", spyj=" + spyj + ", dclr=" + dclr + ", spzt=" + spzt + ", leid=" + leid + ", emid=" + emid
				+ ", kssj=" + kssj + ", jssj=" + jssj + "]";
	}
	public String getKssj() {
		return kssj;
	}
	public void setKssj(String kssj) {
		this.kssj = kssj;
	}
	public String getJssj() {
		return jssj;
	}
	public void setJssj(String jssj) {
		this.jssj = jssj;
	}
	
	public Integer getBh() {
		return bh;
	}
	public void setBh(Integer bh) {
		this.bh = bh;
	}
	public String getQjname() {
		return qjname;
	}
	public void setQjname(String qjname) {
		this.qjname = qjname;
	}
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	public String getFqTime() {
		return fqTime;
	}
	public void setFqTime(String fqTime) {
		this.fqTime = fqTime;
	}
	public String getSpTime() {
		return spTime;
	}
	public void setSpTime(String spTime) {
		this.spTime = spTime;
	}
	public String getSpyj() {
		return spyj;
	}
	public void setSpyj(String spyj) {
		this.spyj = spyj;
	}
	public String getDclr() {
		return dclr;
	}
	public void setDclr(String dclr) {
		this.dclr = dclr;
	}
	public String getSpzt() {
		return spzt;
	}
	public void setSpzt(String spzt) {
		this.spzt = spzt;
	}
	public Integer getLeid() {
		return leid;
	}
	public void setLeid(Integer leid) {
		this.leid = leid;
	}
	public Integer getEmid() {
		return emid;
	}
	public void setEmid(Integer emid) {
		this.emid = emid;
	}
	
}
