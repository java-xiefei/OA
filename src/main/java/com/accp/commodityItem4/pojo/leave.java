package com.accp.commodityItem4.pojo;

public class leave {
	private Integer leaveId;
	private Integer typeId;
	private Integer createMan;
	private Integer departmentId;	
	private String createTime;
	private String startTime;
	private String endTime;
	private Integer nextDealMan;
	private String event;
	private Integer totalCount;
	private Integer statusId;


	@Override
	public String toString() {
		return "leave [leaveId=" + leaveId + ", typeId=" + typeId + ", createMan=" + createMan + ", departmentId="
				+ departmentId + ", createTime=" + createTime + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", nextDealMan=" + nextDealMan + ", event=" + event + ", totalCount=" + totalCount + ", statusId="
				+ statusId + "]";
	}
	public Integer getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(Integer leaveId) {
		this.leaveId = leaveId;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getCreateMan() {
		return createMan;
	}
	public void setCreateMan(Integer createMan) {
		this.createMan = createMan;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public Integer getNextDealMan() {
		return nextDealMan;
	}
	public void setNextDealMan(Integer nextDealMan) {
		this.nextDealMan = nextDealMan;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public leave() {
		// TODO Auto-generated constructor stub
	}
	public leave(Integer leaveId, Integer typeId, Integer createMan, Integer departmentId, String createTime,
			String startTime, String endTime, Integer nextDealMan, String event, Integer totalCount, Integer statusId) {
		super();
		this.leaveId = leaveId;
		this.typeId = typeId;
		this.createMan = createMan;
		this.departmentId = departmentId;
		this.createTime = createTime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.nextDealMan = nextDealMan;
		this.event = event;
		this.totalCount = totalCount;
		this.statusId = statusId;
	}
}
