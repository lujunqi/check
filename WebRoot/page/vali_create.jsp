<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!doctype html>
<html>
<head>
<title></title>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<base href="<%=basePath%>">
</base>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/global-min.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="prism/jquery.prism.2.0.js"></script>
</head>
<body class="mainBody">
<div class="crumb mb10">
  <div class="crumb-l">&nbsp;</div>
  <div class="crumb-r">&nbsp;</div>
  <div class="crumb-m clearfix"> <a   class="home"><b>&nbsp;</b>首页</a> <a class="link">防伪查询</a><span class="label">生成防伪码</span> </div>
</div>
<div class="wrapper comWrap">
  <div class="wrap-inner">
    <form class="baseFrm" id="" name="" action="" target="" method="post">
      <ul class="frmList clearfix">

        <li> <span class="lab">
          <label for="">起始数：</label>
          </span> <span class="mod">
          <input type="text" id="code" class="text w250" />
          </span> </li>
		  <li> <span class="lab">
          <label for="">个数：</label>
          </span> <span class="mod">
          <input type="text" id="len" class="text w250" />
          </span> </li>
		  
      </ul>
	  
      <ul class="frmList clearfix"><li> <span class="lab">&nbsp;</span> <span class="mod">
          <input type="button" class="frmSubmitAlt" id="" name="" value="确定" />
          <input type="button" class="frmButton" id="" name="" value="取消" />
          </span> </li>
      </ul>
    </form>
  </div>
</div>
</body>
</html>
