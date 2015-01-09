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
<link rel="stylesheet" type="text/css" href="prism/prism.2.0.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="prism/jquery.prism.2.0.js"></script>
<script type="text/javascript">
$(init);
function init(){
	$("#create").click(func_create);
}
function func_create(){
	$("#load").show();
	var p = {};
	p["code"] = $("#code").val();
	p["len"] = $("#len").val();
	var url = "vali_create.do";
	if(p["len"]>1000){
		alert("个数不能大于1000");
		$("#load").hide();
		return ;
	}

	$.post(url,p,function(){
		$("#load").hide();
	})
}
function checkNum(obj){
	if(isNaN(obj.value)){
		obj.value=obj.value.replace(/\D/g,'');
	}
}
</script>
</head>
<body class="mainBody" >

<div class="mask" style="display:none;" id="load">
<div class="loadingOne"></div>
</div>
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
          <input type="text" id="code" class="text w250" onkeyup="checkNum(this)" onafterpaste="checkNum(this)"/>
          </span> </li>
		  <li> <span class="lab">
          <label for="">个数：</label>
          </span> <span class="mod">
          <input type="text" id="len" class="text w150"  onkeyup="checkNum(this)" onafterpaste="checkNum(this)"/>（一次最多只能生成1000个）
          </span> </li>
		  
      </ul>
	  
      <ul class="frmList clearfix"><li> <span class="lab">&nbsp;</span> <span class="mod">
          <input type="button" class="frmSubmitAlt" id="create" name="" value="确定" />
          <input type="button" class="frmButton" id="" name="" value="取消" />
          </span> </li>
      </ul>
    </form>
  </div>
</div>
</body>
</html>
