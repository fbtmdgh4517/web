package com.web;

import java.util.ArrayList;
import java.util.List;

public class ListTest {

	private static Object attribute;
	
	public static void setAttribute(String key, Object value) {
		attribute = value;
	}
	
	public static Object getAttribute(String key) {
		return attribute;
	}
	
	public static void main(String[] args) {
		List<String> strList = new ArrayList<>();
		strList.add("우리");
		strList.add("지금");
		strList.add("나라");
		setAttribute("strList", strList);
		Object obj = getAttribute("strList");
		
		System.out.println(obj == strList); // true 매우 중요
		
		List<String> list = (List<String>)obj;
		
		System.out.println(list);
	}
}
