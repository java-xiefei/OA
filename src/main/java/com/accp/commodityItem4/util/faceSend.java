package com.accp.commodityItem4.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.json.JSONObject;

import com.accp.commodityItem4.vo.ResultVo;
import com.alibaba.fastjson.JSON;
import com.baidu.aip.face.AipFace;
import com.baidu.aip.face.FaceVerifyRequest;
import com.baidu.aip.face.MatchRequest;
import com.baidu.aip.util.Base64Util;

public  class faceSend {
	/**
	 * 输入自己的AppID、APIKey、SecretKey
	 */
	private static final String AppID = "18034943";
	private static final String APIKey = "a41Fhm0ueKfb5ah98nBUn8NX";
	private static final String SecretKey = "kZi1FUlxKYXylbatzmWDIiHYEfsIfABG";
	
	static AipFace client = null;
	static {
		client = new AipFace(AppID, APIKey, SecretKey);
		// 可选：设置网络连接参数
		client.setConnectionTimeoutInMillis(2000);
		client.setSocketTimeoutInMillis(60000);
	}
	
	/**
	 * 人脸比对
	 * 
	 * @param file1
	 * @param file2
	 * @return
	 */
	public static String matchFace(File file1, File file2) {
		try {
			return matchFace(FileToByte(file1), FileToByte(file2));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 人脸比对 字符流 文件图片
	 * @param arg0
	 * @param file2
	 * @return
	 */
	public static String matchFace(String  arg0,File file2) {
		String imgStr1 = arg0;
		byte[] arg1=null;
		try {
			arg1 = FileToByte(file2);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String imgStr2 = Base64Util.encode(arg1);
		MatchRequest req1 = new MatchRequest(imgStr1, "BASE64");
		MatchRequest req2 = new MatchRequest(imgStr2, "BASE64");
		ArrayList<MatchRequest> requests = new ArrayList<MatchRequest>();
		requests.add(req1);
		requests.add(req2);
		JSONObject res = client.match(requests);
		return res.toString();
	}

	/**
	 * 人脸比对
	 * 
	 * @param arg0
	 *            人脸1
	 * @param arg1
	 *            人脸2
	 * @return
	 */
	public static String matchFace(byte[] arg0, byte[] arg1) {
		String imgStr1 = Base64Util.encode(arg0);
		String imgStr2 = Base64Util.encode(arg1);
		MatchRequest req1 = new MatchRequest(imgStr1, "BASE64");
		MatchRequest req2 = new MatchRequest(imgStr2, "BASE64");
		ArrayList<MatchRequest> requests = new ArrayList<MatchRequest>();
		requests.add(req1);
		requests.add(req2);
		JSONObject res = client.match(requests);
		return res.toString();
	}
	
	public static byte[] FileToByte(File file) throws IOException {
		// 将数据转为流
		@SuppressWarnings("resource")
		InputStream content = new FileInputStream(file);
		ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
		byte[] buff = new byte[100];
		int rc = 0;
		while ((rc = content.read(buff, 0, 100)) > 0) {
			swapStream.write(buff, 0, rc);
		}
		// 获得二进制数组
		return swapStream.toByteArray();
	}
	/**
	 * 活体检测
	 * 
	 * @param arg0
	 * @return
	 */
	public static String faceverify(String arg0) {
		String imgStr = arg0;
		String imageType = "BASE64";
		FaceVerifyRequest req = new FaceVerifyRequest(imgStr, imageType);
		ArrayList<FaceVerifyRequest> list = new ArrayList<FaceVerifyRequest>();
		list.add(req);
		JSONObject res = client.faceverify(list);
		return res.toString();
	}
	public static String faceverify(byte[] arg0) {
		String imgStr = Base64Util.encode(arg0);
		String imageType = "BASE64";
		FaceVerifyRequest req = new FaceVerifyRequest(imgStr, imageType);
		ArrayList<FaceVerifyRequest> list = new ArrayList<FaceVerifyRequest>();
		list.add(req);
		JSONObject res = client.faceverify(list);
		return res.toString();
	}
	public static void main(String[] args) throws IOException {
		String file1 = "E:\\myfile\\images\\37ee9a8be7e43a91794eb30fe947a01.jpg";
		String file2 = "E:\\myfile\\images\\37ee9a8be7e43a91794eb30fe947a01.jpg";
		byte[] img1 = FileToByte(new File(file1));
		byte[] img2 = FileToByte(new File(file2));
		//人脸比对
		ResultVo result=JSON.parseObject(matchFace(img1, img2),ResultVo.class);
		System.out.println(matchFace(img1, img2));
		System.out.println(result.toString());
		System.out.println(matchFace(img1, img2));
		if(result.getResult().getScore()>85) {
			System.out.println("是本人");
		}else {
			System.out.println("不是本人");
		}
		//活体检测
		ResultVo result1=JSON.parseObject(faceverify(img1),ResultVo.class);
		System.out.println(faceverify(img1));
		System.out.println(result1.toString());;	
	}
}
