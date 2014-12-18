<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<%
Object user_name = session.getAttribute("USER_NAME");
Object user_id = session.getAttribute("USER_ID");
if(user_id==null){
	response.sendRedirect("login.jsp");
}

%>
<!DOCTYPE HTML>
<html>
<head>
<title>通联对账管理系统</title>
<meta charset="utf-8">
<meta name="keywords" content=".........">
<meta name="description" content=".........">
<link rel="stylesheet" href="css/global-min.css">
<link rel="stylesheet" href="css/common.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js?skin=dblue"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="prism/jquery.prism.2.0.js"></script>
<script type="text/javascript" src="js/index.js"></script>

<!--[if IE 6]>
<script type="text/javascript" src="scripts/DD_belatedPNG_0.0.8a-min.js" ></script>
<script type="text/javascript">
	DD_belatedPNG.fix('.pngfix');
</script>
<![endif]-->
</head>

<body class="fluid">

<div class="container">
  <div id="header">
    <div class="inner">
    <h1 id="site-name">通联对账管理系统</h1>
    <div id="site-logo" class="fl">
    <!--  <a href="#"><img class="pngfix" src="images/logo.png" alt="快乐冲浪内容管理系统" width="579" height="80" /></a>-->
    
    </div>
    <div id="logout"><!--a class="pngfix" href="#">退出登录</a--></div>
    <ul id="site-nav" class="clearfix">
      <li class="user"><span><%=user_name%></span>欢迎您 </li>
 
      <li class="timer"><span id="date"></span></li>
    </ul>
    </div>
  </div>
  <!--/#header-->
  
  <div class="section clearfix">
    <div class="hidden">
      <h2>Site Content</h2>
    </div>
    <div class="content clearfix">
      <iframe class="mainFrame" id="main" name="main" src="welcome.html" frameborder="0" scrolling="yes" hidefocus></iframe>
    </div>
    <!--/.content-->
    
    <div class="sidebar">
      <ul class="sideNav">
        <li class="major">
          <h2 class="subtit"><a class="" href="#" target="main"><span class="">事故跟单</span></a></h2>
          <ul class="sublist" >
            <li><a target="main" href="page/vehicle_list.jsp">车型信息</a></li>
            <li><a target="main"  href="page/mobile_list.jsp">手机卡信息</a></li>
            <li><a target="main" href="page/insurer_list.jsp">保险公司信息</a></li>
            <li><a target="main" href="page/alloc_rule_list.jsp">自动派单</a></li>
            <li><a target="main" href="page/task1_list.jsp">手工派单</a></li>
          </ul>
        </li>

        <li class="major">
          <h2 class="subtit"><a class="" href="#"><span class="">系统管理</span></a></h2>
          <ul class="sublist" >
            <li><a class="" href="javascript:updPwd();"><span class="">修改密码</span></a></li>
          </ul>
        </li>
        <li class="major">
          <h2 class="subtit"><a class="" href="#"><span class="">查询统计</span></a></h2>
        </li>
      </ul>
    </div>
    <!--/.sidebar -->
    
    <div class="addBar"> 
      <!--/.addBar --> 
    </div>
  </div>
  <!--/.section--> 
  
</div>
<!--/.container -->

<div id="footer">
  <div class="container">
    <div id="copyright">
      <p class="tc">Copyright &copy; 2000-2013 </p>
    </div>
  </div>
</div>
<!--/#footer-->

</body>
</html>