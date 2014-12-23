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
<link rel="stylesheet" type="text/css" href="css/global-min.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/jquery.selectbox.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="prism/jquery.prism.2.0.js"></script>
<script type="text/javascript">
$(init);
function init(){
	$("#list").prism({
	content: "ajax:vali_list.do"
	});
}
function find(){
	var param = {};
	param["code"] = $("#code").val();
	$("#list").prism({
	content: "ajax:vali_list.do",
	param:param
	});
}

function setStatus(data){
	if(data["validate_status"]==0){
		return "在用";
	}else{
		return "作废";
	}
}
</script>
</head>
<body class="mainBody">
<div class="crumb mb10">
	<div class="crumb-l">&nbsp;</div>
	<div class="crumb-r">&nbsp;</div>
    <div class="crumb-m clearfix">
    	<a   class="home"><b>&nbsp;</b>首页</a>
    	<a  class="link">防伪查询</a>
    	<span class="label">防伪查询</span>
    </div>
</div>

<div class="wrap-inner comWrap">
<div class="wrap-tit clearfix">
    <h3 class="wrap-tit-l"><span class="icon">防伪查询</span></h3>
    <div class="wrap-tit-r">     
        <div class="filter">
            <span class="mr5"><em>防伪码</em> <input type="text" class="w100" id="code"/> </span> 

            <span class="mr5"><input type="reset" class="btnAlt" value="重置" /></span>
            <span class="mr5"><a class="btn" href="javascript:find()">查询</a></span>
        </div>
    </div>
  </div>

<table width="99%" height="0" align="center" cellpadding="0" cellspacing="0" class="comTabList">
  <thead>
    <tr>
      <th>防伪码编号</th>
	  <th>查询次数</th>
	  <th>防伪码状态</th>
    </tr>
  </thead>
  <tbody id="list" prism="dataGrid">
  	<tr>
		<td>#@validate_code#</td>
		<td>#@validate_num#</td>
		<td>#@func:setStatus#</td>
	</tr>
  </tbody>
  <tfoot>
  <tr><td colspan="3" nowrap="nowrap" class="page"></td></tr>
  </tfoot>
</table>
</div>
</body>
</html>
