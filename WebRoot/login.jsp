<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>防伪查询</title>
<meta charset="utf-8">
<meta name="keywords" content=".........">
<meta name="description" content=".........">
<link rel="stylesheet" href="css/global-min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/login.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js?skin=dblue"></script>
<script type="text/javascript">
$(init);
function init(){
	$("#Submit").click(submit)
}
function submit(){
	var USER_ACC = $("#USER_ACC").val();
	var USER_PWD = $("#USER_PWD").val();
	if(USER_ACC==""){
		dialog("登录账号不能为空");
		return;
	}
	if(USER_PWD==""){
		dialog("密码不能为空");
		return;
	}
	var url = "login.do";
	var param = {};
	param["USER_ACC"] = USER_ACC;
	param["USER_PWD"] = USER_PWD;
	
	$.post(url,param,function(data){
		
		if(data.length>0){
			window.location.href="index.jsp";
		}else{
			dialog("请输入正确的账号密码");
		}
	},"json");
}
function dialog(v_content){
	$.dialog({
		title:"登陆",
		width:220,
		height:90,
		fixed: false,
		max: false,
		min: false,
		resize: false,
		drag: false,
		lock: true,
		lockScroll:true,
		content: v_content
	});
}
</script>
</head>

<body>

<div class="topimg">
<div id="login">

    <div class="form" id="myForm" >
    
        <ul>

        <li><label>用户名：</label><span class="inputWrap"><span class="fix">
        <input class="txt"  type="text" id="USER_ACC" name="USER_ACC" />
        </span></span></li>
        <li><label>密　码：</label><span class="inputWrap"><span class="fix">
        <input class="txt" id="USER_PWD" type="password"
         name="USER_PWD" /></span></span></li>
        <li class="btns">
        <input class="loginBtn" type="submit" value="登录" id="Submit" />
        </li>
        </ul>
    
    </div>    
</div>
</div>

</body>
</html>