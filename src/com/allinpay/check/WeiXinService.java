package com.allinpay.check;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.context.ApplicationContext;

import com.allinpay.check.weixin.WeiXinResponse;
import com.prism.service.impl.basic.BaseService;

public class WeiXinService extends BaseService {
	private static final String APPID = "wxada2bd7c71ca91b7";
	private static final String APPSECRET = "95ead5f16779d4374b5c823ad4aa2fed";

	public void service() throws ServletException, IOException {
		super.service();
		HttpServletRequest req = this.getRequest();
		getRequest().setCharacterEncoding("UTF-8");
		getResponse().setCharacterEncoding("UTF-8");
		Enumeration<String> en = req.getParameterNames();
		while (en.hasMoreElements()) {
			String name = en.nextElement();
			System.out.println((name + "==" + req.getParameter(name)));
		}
		PrintWriter out = this.getResponse().getWriter();
		String signature = req.getParameter("signature");
		String timestamp = req.getParameter("timestamp");
		String nonce = req.getParameter("nonce");
		String echostr = req.getParameter("echostr");
		String token = "132456sdsfdfgfdghhf";
		String[] str = { token, timestamp, nonce };
		Arrays.sort(str); // 字典序排序
		String bigStr = str[0] + str[1] + str[2];

		java.security.MessageDigest md = null;
		try {
			md = java.security.MessageDigest.getInstance("SHA-1");
			md.update(bigStr.getBytes());
			byte[] b = md.digest();

			StringBuilder sbDes = new StringBuilder();
			String tmp = null;
			for (int i = 0; i < b.length; i++) {
				tmp = (Integer.toHexString(b[i] & 0xFF));
				if (tmp.length() == 1) {
					sbDes.append("0");
				}
				sbDes.append(tmp);
			}
			String digest = sbDes.toString();
			if (digest.equals(signature)) {
				if (StringUtils.isNotEmpty(echostr)) {
					out.print(echostr);
					return;
				}
				InputStream stream = req.getInputStream();
				Map<String, String> reqMap = parseXMLData(stream);
				if ("text".equals(reqMap.get("MsgType"))) {
					String reqContent = reqMap.get("Content");
					ApplicationContext context = (ApplicationContext) req
							.getAttribute("context");
					String[] s = reqContent.split(":");
					if (s.length > 0) {
						if (context.containsBean(s[0])) {
							List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
							this.sourceMap
									.put("DSQL",
											"select txl_name, txl_tel1, txl_tel2, txl_mail, txl_stel\n"
													+ "  from tb_txl\n"
													+ " where 1 = 1\n"
													+ "#if(!$v.isEmpty(\"searchContext\"))\n"
													+ "   and txl_name like  $v.set(\"searchContext\",\"STRING\")"
													+ "#end");
							this.reqMap.put("searchContext", "%" + s[1] + "%");
							System.out.println(sourceMap);
							if (sourceMap.containsKey("DSQL")) {
								convertSql("DSQL", "NSQL");
								list = selectResult("NSQL");
							} else if (sourceMap.containsKey("SQL")) {
								list = selectResult("SQL");
							}
							System.out.println(list);
							// Service vm = (Service) context.getBean(s[0]);

						}
					}
				} else {
					WeiXinResponse wres = new WeiXinResponse();
					out.write(wres.resText(reqMap, "你好"));
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static Map<String, String> parseXMLData(InputStream is)
			throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		File file = new File(
				"/home/tandan/xx.log");
		FileOutputStream os = new FileOutputStream(file);
		byte buffer[] = new byte[1];
		while ((is.read(buffer)) != -1) {
			os.write(buffer);
		}
		os.flush();
		// BufferedReader reader = new BufferedReader(new
		// InputStreamReader(is));
		// StringBuilder sb = new StringBuilder();
		// String line = null;
		// try {
		// while ((line = reader.readLine()) != null) {
		// sb.append(line + "\n");
		// }
		// String ss = sb.toString();
		//
		// System.out.println(ss);
		// } catch (IOException e) {
		// e.printStackTrace();
		// }

		SAXReader sr = new SAXReader();
		Document doc = sr.read(file);
		Element root = doc.getRootElement();
		@SuppressWarnings("unchecked")
		Iterator<Element> it = root.elementIterator();
		Element sonElement = null;

		while (it.hasNext()) {
			sonElement = it.next();
			System.out.println(sonElement.getName()
					+ "=="
					+ new String(sonElement.getText().getBytes("GBK"),
							"utf-8")+"=="+sonElement.getText());
			result.put(sonElement.getName(), sonElement.getText());
		}
		return result;
	}
	// private String getAccessToken() {
	// String url = String
	// .format("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%1$s&secret=%2$s",
	// APPID, APPSECRET);
	// return HttpWeb.getGetResponse(url);
	//
	// }
}
