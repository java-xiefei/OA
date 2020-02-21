package com.accp.commodityItem4.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.accp.commodityItem4.dao.employeeMapper;
import com.accp.commodityItem4.vo.qjlist;
import com.github.pagehelper.PageInfo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/spring-ctx.xml" })
public class test {
	@Resource
	private employeeMapper biz;
	/**
	 * 登录测试
	 */
	@Test
	public void show() {
		System.out.println(biz.selectByPrimaryKey(1000,"aaa12345"));
	}
	/**
	 * 请假记录表查询测试
	 */
	@Test
	public void show2() {
		/*
		 * List<qjlist> list = biz.query(1005); for (qjlist qj : list) {
		 * System.out.println(qj); }
		 */
	}
}
