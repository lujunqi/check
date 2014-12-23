$(init);
function init(){
	tick();
}
function showLocale(objD)
{
	var str,colorhead,colorfoot;
	var yy = objD.getYear();
	if(yy<1900) yy = yy+1900;
	var MM = objD.getMonth()+1;
	if(MM<10) MM = '0' + MM;
	var dd = objD.getDate();
	if(dd<10) dd = '0' + dd;
	var hh = objD.getHours();
	if(hh<10) hh = '0' + hh;
	var mm = objD.getMinutes();
	if(mm<10) mm = '0' + mm;
	var ss = objD.getSeconds();
	if(ss<10) ss = '0' + ss;
	var ww = objD.getDay();
	if  ( ww==0 )  colorhead="<font class='clock'>";
	if  ( ww > 0 && ww < 6 )  colorhead="<font class='clock'>";
	if  ( ww==6 )  colorhead="<font class='clock'>";
	if  (ww==0)  ww="星期日";
	if  (ww==1)  ww="星期一";
	if  (ww==2)  ww="星期二";
	if  (ww==3)  ww="星期三";
	if  (ww==4)  ww="星期四";
	if  (ww==5)  ww="星期五";
	if  (ww==6)  ww="星期六";
	colorfoot="</font>"
	str = colorhead + yy + "年" + MM + "月" + dd + "日&nbsp;&nbsp;" + hh + ":" + mm + ":" + ss + "&nbsp;&nbsp;" + ww + colorfoot;
	return(str);
}
function tick()
{
	var today;
	today = new Date();
	document.getElementById("date").innerHTML = showLocale(today);
	window.setTimeout("tick()", 1000);
}
function updPwd(){
	$.dialog({
		title:"修改密码",

		fixed: true,
		max: false,
		min: false,
		resize: false,
		drag: false,
		lock: true,
		lockScroll:true,
		content: "url:view/updPwd.jsp",
		ok: function(){
			var url = "updPwd.do";
			var param = $.formField("#form",this.content.document.body);
			if(param["CHK_USER_PWD"]!=param["NEW_USER_PWD"]){
				alert("密码输入不一致");
				return false;
			}
			$.post(url,param,function(data){

				data = $.parseJSON(data);
				if(data["result"] == 1){
					alert("修改成功");
//					init();
				}else{
					alert("修改失败");
				}
			});
		}
	});
}