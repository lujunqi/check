<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!doctype html>
<html>
<head>
<title></title>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<base href="<%=basePath%>"></base>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/global-min.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/jquery.selectbox.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

</head>

<body class="popLayer">
		<div class="comFrmList p15" id="form">
		<ul class="list">

	      <li>
	        <label class="tit w100" for="">老密码：</label>
	        <input type="password" class="itm w130" id="OLD_USER_PWD"  name="OLD_USER_PWD">
	      </li>
          <li>
	        <label class="tit w100" for="">新密码：</label>
	        <input type="password" class="itm w130" id="NEW_USER_PWD"  name="NEW_USER_PWD">
	      </li>
          <li>
	        <label class="tit w100" for="">确认密码：</label>
	        <input type="password" class="itm w130" id="CHK_USER_PWD"  name="CHK_USER_PWD">
	      </li>
          
   		</ul>
	</div>

</body>
</html>