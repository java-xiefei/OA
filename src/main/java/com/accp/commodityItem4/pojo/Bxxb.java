package com.accp.commodityItem4.pojo;

public class Bxxb {
private String id;
private String mainId;
private String subTotal;
private String desc;
private String pictrueName;
private String pictruePath;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getMainId() {
	return mainId;
}
public void setMainId(String mainId) {
	this.mainId = mainId;
}
public String getSubTotal() {
	return subTotal;
}
public void setSubTotal(String subTotal) {
	this.subTotal = subTotal;
}
public String getDesc() {
	return desc;
}
public void setDesc(String desc) {
	this.desc = desc;
}
public String getPictrueName() {
	return pictrueName;
}
public void setPictrueName(String pictrueName) {
	this.pictrueName = pictrueName;
}
public String getPictruePath() {
	return pictruePath;
}
public void setPictruePath(String pictruePath) {
	this.pictruePath = pictruePath;
}
@Override
public String toString() {
	return "Bxxb [id=" + id + ", mainId=" + mainId + ", subTotal=" + subTotal + ", desc=" + desc + ", pictrueName="
			+ pictrueName + ", pictruePath=" + pictruePath + "]";
}

}
