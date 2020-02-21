package com.accp.commodityItem4.pojo;

public class employee {
	private Integer employeeid;

	private String employeename;

	private String password;

	private Integer departmentid;

	private Integer positionid;

	private String statusid;
	
	private Integer pid;
	
	private String imgph;
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getImgph() {
		return imgph;
	}

	public void setImgph(String imgph) {
		this.imgph = imgph;
	}

	public employee() {
		// TODO Auto-generated constructor stub
	}

	/*
	 * @Override public String toString() { // TODO Auto-generated method stub
	 * return "employeeid:"+employeeid+",employeename:"+employeename; }
	 */
	public Integer getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(Integer employeeid) {
		this.employeeid = employeeid;
	}

	public String getEmployeename() {
		return employeename;
	}

	public void setEmployeename(String employeename) {
		this.employeename = employeename == null ? null : employeename.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public Integer getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(Integer departmentid) {
		this.departmentid = departmentid;
	}

	public Integer getPositionid() {
		return positionid;
	}

	public void setPositionid(Integer positionid) {
		this.positionid = positionid;
	}

	public String getStatusid() {
		return statusid;
	}

	public void setStatusid(String statusid) {
		this.statusid = statusid == null ? null : statusid.trim();
	}
}