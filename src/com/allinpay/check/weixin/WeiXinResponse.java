package com.allinpay.check.weixin;

import java.io.File;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

public class WeiXinResponse {
	
	public static void main(String[] args) {
		Map<String, String> reqMap = new HashMap<String, String>();
		reqMap.put("ToUserName", "gh_e0d6f681f640");
		reqMap.put("FromUserName", "oEN0ot4Us2aMAQJHOFv1Q7H8ftfs");
		reqMap.put("CreateTime", "1433488936");
		reqMap.put("MsgType", "text");
		reqMap.put("Content", "text");
		reqMap.put("MsgId", "6156788099506169238");
		WeiXinResponse wx = new WeiXinResponse();
		try {
			String t = wx.resText(reqMap,"xxx");
			System.out.println(t);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public String resText(Map<String, String> reqMap, String conent)
			throws Exception {
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("xml");// 添加文档根
		Element ToUserName = root.addElement("ToUserName");
		ToUserName.setText(reqMap.get("FromUserName"));

		Element FromUserName = root.addElement("FromUserName");
		FromUserName.setText(reqMap.get("ToUserName"));

		Element CreateTime = root.addElement("CreateTime");
		CreateTime.setText(reqMap.get("CreateTime"));

		Element MsgType = root.addElement("MsgType");
		MsgType.setText("text");

		Element Content = root.addElement("Content");
		Content.setText(conent);
		
		return document.asXML();
	}
}
/*
 * <xml> <ToUserName><![CDATA[toUser]]></ToUserName>
 * <FromUserName><![CDATA[fromUser]]></FromUserName>
 * <CreateTime>12345678</CreateTime> <MsgType><![CDATA[text]]></MsgType>
 * <Content><![CDATA[你好]]></Content> </xml>
 */