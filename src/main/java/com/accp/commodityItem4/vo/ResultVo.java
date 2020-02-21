package com.accp.commodityItem4.vo;



public class ResultVo {
	

	public ResultVo() {
		super();
	}
	
	private scoreVo result; //返回的结果对象

	

	@Override
	public String toString() {
		return "ResultVo [result=" + result + "]";
	}

	public scoreVo getResult() {
		return result;
	}

	public void setResult(scoreVo result) {
		this.result = result;
	}

	
	

}
