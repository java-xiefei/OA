package com.accp.commodityItem4.vo;

import java.util.Arrays;

public class scoreVo {
	
	@Override
	public String toString() {
		return "scoreVo [face_liveness=" + face_liveness + ", score=" + score + ", face_list="
				+ Arrays.toString(face_list) + "]";
	}

	private Double face_liveness;  //活体检测的分数 0-1 大于0.5是活体
	
	public Double getFace_liveness() {
		return face_liveness;
	}

	public void setFace_liveness(Double face_liveness) {
		this.face_liveness = face_liveness;
	}

	private Double score;	//人脸比对相似度 大于85  就是本人
	
	private String[] face_list;	//没什么用
	
	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public String[] getFace_list() {
		return face_list;
	}

	public void setFace_list(String[] face_list) {
		this.face_list = face_list;
	}

	public scoreVo(Double score, String[] face_list) {
		super();
		this.score = score;
		this.face_list = face_list;
	}

	public scoreVo() {
		super();
	}
}
