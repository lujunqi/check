package com.allinpay.check;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

import com.prism.common.JsonUtil;
import com.prism.common.VMResponse;
import com.prism.service.impl.basic.BaseService;

public class LoginService extends BaseService {
	private VelocityContext vc = new VelocityContext();

	public void service() throws ServletException, IOException {

		super.service();
		PrintWriter out = getResponse().getWriter();
		try {
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			if (sourceMap.containsKey("DSQL")) {
				convertSql("DSQL", "NSQL");
				list = selectResult("NSQL");
			} else if (sourceMap.containsKey("SQL")) {
				list = selectResult("SQL");
			}
			if (!list.isEmpty()) {
				HttpServletRequest req = getRequest();
				HttpSession session = req.getSession();
				session.setAttribute("USER_ID", list.get(0).get("USER_ID"));
				session.setAttribute("USER_NAME", list.get(0).get("USER_NAME"));
				session.setAttribute("USER_CODE", list.get(0).get("USER_CODE"));
				
			}

			String action = (String) reqMap.get("_action");
			reqMap.put(action, list);
			reqMap.put("this", list);
			getRequest().setAttribute("this", list);
			getRequest().setAttribute(action, list);
			vc.put(action, list);
			vc.put("this", list);

			// 视图模板
			if (sourceMap.containsKey("VIEW")) {
				VMResponse vm = new VMResponse();
				vm.setReqMap(reqMap);
				vc.put("v", vm);
				String content = getResultfromContent("VIEW");
				out.print(content);
			}

			// FORWARD 页面跳转
			if (sourceMap.containsKey("FORWARD")) {
				getRequest()
						.setAttribute("TEMPLATE", sourceMap.get("TEMPLATE"));
				getRequest().getRequestDispatcher(
						(String) sourceMap.get("FORWARD")).forward(
						getRequest(), getResponse());
			}
			// REDIRECT 页面重定向
			if (sourceMap.containsKey("REDIRECT")) {
				getResponse().sendRedirect((String) sourceMap.get("REDIRECT"));
			}
		} catch (Exception e) {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("code", -1);
			m.put("info", e.getMessage());
			JsonUtil ju = new JsonUtil();
			out.println(ju.toJson(m));
			e.printStackTrace();
		}
	}

	private String getResultfromContent(String s) throws Exception {
		s = (String) sourceMap.get(s);
		StringWriter stringwriter;
		Velocity.init();
		stringwriter = new StringWriter();
		Velocity.evaluate(vc, stringwriter, "mystring", s);
		return stringwriter.toString();
	}
}
