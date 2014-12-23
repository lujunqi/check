package com.allinpay.check;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import com.prism.common.JsonUtil;
import com.prism.service.impl.basic.BaseService;

public class ValiCreate extends BaseService {
	public void service() throws ServletException, IOException {
		super.service();
		PrintWriter out = getResponse().getWriter();
		try {
			HttpSession session = getRequest().getSession();

			int code = Integer.parseInt(reqMap.get("code") + "");// 起始数
			int code_num = Integer.parseInt(reqMap.get("len") + "");// 个数
			int len = ((code + code_num) + "").length();
			for (int i = code; i < code + code_num; i++) {
				String info = rightFillMethod(i, len);
				reqMap.put("code", session.getAttribute("USER_CODE")+info);
				updateResult("SQL");
			}
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("code", 1);
			m.put("info", "防伪码生成完成");
			JsonUtil ju = new JsonUtil();
			out.println(ju.toJson(m));
		} catch (Exception e) {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("code", -1);
			m.put("info", e.getMessage());
			JsonUtil ju = new JsonUtil();
			out.println(ju.toJson(m));
			e.printStackTrace();
		}
	}

	private String rightFillMethod(int str, int j) {
		NumberFormat   formatter   =   NumberFormat.getNumberInstance();   
        formatter.setMinimumIntegerDigits(j);   
        formatter.setGroupingUsed(false);   
        String   s   =   formatter.format(str); 
        return s;
	}
}
