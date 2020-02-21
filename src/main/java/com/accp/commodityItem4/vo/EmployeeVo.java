package com.accp.commodityItem4.vo;
/**
 * 员工工具类
 * @author 
 *
 */
public class EmployeeVo {
	private Integer employeeId;

	private String employeename;

	private String password;

	
	private Integer departmentId;
	
	private String departmentName;

	private Integer positionId;
	
	private String positionName;

	private String statusId;

	private Integer pid;

	private String imgph;;

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public Integer getPositionId() {
		return positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

	public EmployeeVo() {
		super();
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeename() {
		return employeename;
	}

	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}

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

	@Override
	public String toString() {
		return "EmployeeVo [employeeId=" + employeeId + ", employeename=" + employeename + ", password=" + password
				+ ", departmentName=" + departmentName + ", positionName=" + positionName + ", statusId=" + statusId
				+ ", pid=" + pid + ", imgph=" + imgph + "]";
	}

	

}
