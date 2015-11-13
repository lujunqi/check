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
<link rel="stylesheet" type="text/css" href="prism/prism.2.0.css">
<link rel="stylesheet" type="text/css" href="css/jquery.selectbox.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="prism/jquery.prism.2.0.js"></script>
<script type="text/javascript">
$(init);
function init(){
	$("#list").prism({
	content: "ajax:zszj_list.do",
	pageUrl:"zszj_list_total.do"
	});
}
function find(){
	var param = {};
	param["code"] = $("#code").val();
	$("#list").prism({
	content: "ajax:zszj_list.do",
	pageUrl:"zszj_list_total.do",
	param:param
	});
}

function getName(data){
	return decodeURI(data["name"]);
		
}
</script>
</head>
<body class="mainBody">
<div class="crumb mb10">
	<div class="crumb-l">&nbsp;</div>
	<div class="crumb-r">&nbsp;</div>
    <div class="crumb-m clearfix">
    	<a   class="home"><b>&nbsp;</b>首页</a>
    	<a  class="link">信息查询</a>
    	
    </div>
</div>

<div class="wrap-inner comWrap">
<div class="wrap-tit clearfix">
    <h3 class="wrap-tit-l"><span class="icon">信息查询</span></h3>
    <div class="wrap-tit-r">     
        <div class="filter">

        </div>
    </div>
  </div>

<table width="99%" height="0" align="center" cellpadding="0" cellspacing="0" class="comTabList">
  <thead>
    <tr>
      <th>电话</th>
	  <th>姓名</th>
	  
    </tr>
  </thead>
  <tbody id="list" prism="dataGrid">
  	<tr>
		<td>#@tel#</td>
		<td>#@func:getName#</td>
		
	</tr>
  </tbody>
  <tfoot>
  <tr><td colspan="3" nowrap="nowrap" class="page">

  </td></tr>
  </tfoot>
</table>
</div>
</body>
</html>
