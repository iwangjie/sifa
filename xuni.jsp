<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ include file="/systeminfo/init_wev8.jsp" %>
<%@ page import="weaver.general.Util" %>
<%@ page import="weaver.general.BaseBean" %>

<jsp:useBean id="RecordSet" class="weaver.conn.RecordSet" scope="page" />
<%
    String countMail = "";//邮件数量
	String countResourse = "";//总人数
	String countDetachable = "";//在线人数
	String countDb = ""; //代办数量
    String f_weaver_belongto_userid=request.getParameter("f_weaver_belongto_userid");//需要增加的代码
	String f_weaver_belongto_usertype=request.getParameter("f_weaver_belongto_usertype");//需要增加的代码
	user = HrmUserVarify.getUser(request, response, f_weaver_belongto_userid, f_weaver_belongto_usertype) ;//需要增加的代码
	int userid=user.getUID();                   //当前用户id
	String userName = user.getUsername();
	RecordSet.executeSql("select COUNT(*) as conut from MailResource where  status = 0 and resourceid = "+userid);
	if(RecordSet.next()){
		countMail = RecordSet.getString("conut");
	}
	RecordSet.executeSql("select COUNT(*) as conut from HrmResource where accounttype <> 1 and status <3");
	if(RecordSet.next()){
		countResourse = RecordSet.getString("conut");
	}
	RecordSet.executeSql("select detachable from SystemSet");
	if(RecordSet.next()){
		countDetachable = RecordSet.getString("detachable");
	}
	RecordSet.executeSql("select count(*) my_count from (select distinct t1.createdate,t1.createtime,t1.creater,t1.currentnodeid,t1.currentnodetype,t1.lastoperator,t1.creatertype,t1.lastoperatortype,t1.lastoperatedate,t1.lastoperatetime,t1.requestid,t1.requestname,t1.requestlevel,t1.workflowid,t2.receivedate,t2.receivetime from workflow_requestbase t1,workflow_currentoperator t2 where t1.requestid=t2.requestid and t2.usertype = 0 and t2.userid = "+userid+" and t2.isremark in( '0','1','5','7') and t2.islasttimes=1) tableA");
	if(RecordSet.next()){
		countDb = RecordSet.getString("my_count");
	}
	Date now = new Date(); 
	int mouth = now.getMonth()+1;
	int day = now.getDate();
%>
<%
	BaseBean loggers = new BaseBean();
    String locathostIp = Util.null2String(loggers.getPropValue("sifa_page", "locathostIP"));
	String seccategoryId = Util.null2String(loggers.getPropValue("sifa_page", "seccategoryId"));
	List<String> images = new ArrayList<String>();
	List<String> id = new ArrayList<String>();
	//查询图片
	RecordSet.executeSql("select * from docdetail d1 left join docimagefile d2 on(d1.id = d2.docid) where d1.seccategory = "+seccategoryId+" and (d2.imagefileid is not null and d2.imagefileid <>'') order by doccreatedate desc ,doccreatetime desc");
	while(RecordSet.next()){
		images.add(Util.null2String(RecordSet.getString("imagefileid")));
		id.add(Util.null2String(RecordSet.getString("id")));
	}
%>
<html>

	<head>
		<meta charset="gbk">
		<title>司法局</title>
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" type="text/css" href="css/xuni.css" />
		<link rel="stylesheet" type="text/css" href="css/xuni_lunbo.css" />
		<link rel="stylesheet" href="css/demo.css" type="text/css" media="screen" />

		<script type="text/javascript" src="js/jquery.min.js"></script>
<script language="JavaScript"> 
function myrefresh()
{
       window.location.reload();
}
 setTimeout('myrefresh()',90000); //指定1秒刷新一次
</script>
<script src="js/script.js"></script>
<script src="js/slider.js"></script>
<script type="text/javascript">
$(function() {
	var arrImg = new Array();
	arrImg = <%=images%>;
	var id = new Array();
	id = <%=id%>;
	for(var i=0;i<3;i++){
		var banner_str = "<li><a title='' href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=seccategoryId%>&id="+id[i]+"')\">"+
						 "<img class='img_100' alt='' src='http://<%=locathostIp%>/weaver/weaver.file.FileDownload?fileid="+arrImg[i]+"' style='background-size: 100% 100%; '></a></li>";
		
		jQuery("#banner_ul").append(banner_str);
	}
	var bannerSlider = new Slider($('#banner_tabs'), {
		time: 5000,
		delay: 400,
		event: 'hover',
		auto: true,
		mode: 'fade',
		controller: $('#bannerCtrl'),
		activeControllerCls: 'active'
	});
	$('#banner_tabs .flex-prev').click(function() {
		bannerSlider.prev()
	});
	$('#banner_tabs .flex-next').click(function() {
		bannerSlider.next()
	});

})
</script>

		<script type="text/javascript">
		
			$(function() {

				$('.img_pp').hover(function() { //鼠标滑过图片切换 
						$('.img_pp').attr('src', 'img/jiemian_1.png');
					},
					function() {
						$('.img_pp').attr('src', 'img/ipad_1.png');
					});
					
			});
		</script>
		<script type="text/javascript">
			$(function() {

				$('.xiezuo').hover(function() { //鼠标滑过图片切换 
						$('.xiezuo').attr('src', 'img/xiezuobangong_53.png');
					},
					function() {
						$('.xiezuo').attr('src', 'img/xiezuo_53.png');
					});
			});
		</script>
		<script type="text/javascript">
			$(function() {

				$('.guanli').hover(function() { //鼠标滑过图片切换 
						$('.guanli').attr('src', 'img/geren01.png');
					},
					function() {
						$('.guanli').attr('src', 'img/geren.png');
					});
			});
		</script>
		<script type="text/javascript">
			$(function() {

				$('.jincheng').hover(function() { //鼠标滑过图片切换 
						$('.jincheng').attr('src', 'img/zhengwu01.png');
					},
					function() {
						$('.jincheng').attr('src', 'img/zhengwu.png');
					});
			});
		</script>
		<script type="text/javascript">
			$(function() {

				$('.shangtan_a').hover(function() { //鼠标滑过图片切换 
						$('.shangtan_a').attr('src', 'img/a_1.png');
					},
					function() {
						$('.shangtan_a').attr('src', 'img/a.png');
					});
			});
		</script>
		<script type="text/javascript">
			$(function() {

				$('.shangtan_b').hover(function() { //鼠标滑过图片切换 
						$('.shangtan_b').attr('src', 'img/b_1.png');
					},
					function() {
						$('.shangtan_b').attr('src', 'img/b.png');
					});
			});
		</script>
		<script type="text/javascript">
			$(function() {

				$('.shangtan_c').hover(function() { //鼠标滑过图片切换 
						$('.shangtan_c').attr('src', 'img/c_1.png');
					},
					function() {
						$('.shangtan_c').attr('src', 'img/c.png');
					});
			});	
			
		</script>

	</head>

	<body class="main_bg1">

		<div class="top clearfix">
			<div class="top_zuo">
				<!--<img src="img/tu_2.png"/>-->
				<div id="banner_tabs" class="flexslider">
					<ul class="slides" id="banner_ul">
					
					</ul>
					<ul class="flex-direction-nav">
						<li>
							<a class="flex-prev" href="javascript:;">Previous</a>
						</li>
						<li>
							<a class="flex-next" href="javascript:;">Next</a>
						</li>
					</ul>
					<!-- <ol id="bannerCtrl" class="flex-control-nav flex-control-paging"> 
						<li>
                            <a>1</a>
                        </li>					</ol>-->
				</div>
			</div>

			<div class="top_you">

				<img class="clock11" src="img/zm1.png" />
<div class="zhong_1">

			</div>
			</div>
			

		</div>

		<div class="down ">

			<div class="down_one clearfix">
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/docs/search/DocMain.jsp?urlType=5')">
					<img src="img/wendang_1.png" />
					<div class="wendangzhongxin" style="margin-top: -25px;margin-left: 1px;">
						<p>文档中心</p>
					</div>
				</a>

			</div>
			<div class="down_two clearfix">
				<a href="#" onclick="javascript:window.open('http://124.235.155.164:8081/workflow/request/RequestType.jsp')">
					<img src="img/gerenzhuli_01.png" />
					<div class="gerenzhuli">
						<p>个人助理</p>
					</div>

				</a>

			</div>
			<div class="down_three clearfix">
				<img src="img/xiaoxitixing_1.png" />
				<div class="rili">
					<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/email/new/MailInBox.jsp')">
						<p>您有<span id="countMail_span"></span>未读邮件
						</p>
					</a>
<br>
					<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/workflow/request/RequestView.jsp')">
						<p><span id="countDb_span"></span> 待办事项
						</p>
					</a>
					<br>
					
				</div>
			</div>
			<div class="down_fore clearfix">
				<a href="">
					<div class="pic_a">
						<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=13')"><img class="shangtan_a" src="img/a.png" /></a>
					</div>
				</a>
				<a href="">
					<div class="pic_b" onclick="javascript:window.open('http://124.235.155.164:8081/meeting/data/MeetingCalView.jsp')">
						<a href="#"><img class="shangtan_b" src="img/b.png" /></a>
					</div>
				</a>
				<a href="">
					<div class="pic_c">
						
					</div>
				</a>
				<a href="">
					<div class="pic_d">
						<a href=""><img class="shangtan_d" src="img/d.png" /></a>
					</div>
				</a>
				<a href="">
					<div class="pic_e">
						<a href=""><img class="shangtan_e" src="img/e.png" /></a>
					</div>
				</a>
				<a href="">
					<div class="pic_f">
						<a href=""><img class="shangtan_f" src="img/f.png" /></a>
					</div>
				</a>
			</div>
			<div class="down_five">

				<img src="img/xiezuobangong_1.png" />
				<div class="xiezuobangong">

					<a href="#" onclick="javascript:window.open('http://124.235.155.164:8081/cowork/coworkview.jsp')"><img class="xiezuo" src="img/xiezuo_53.png"></a>
				</div>
			</div>
			<div class="down_six">

				<img src="img/jinchengguanli_1.png" />
				<div class="guanligoutai">
					<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/hrm/HrmTab.jsp?_fromURL=HrmResource')"><img class="guanli" src="img/geren.png"></a>
				</div>
				<div class="jinchengguanli">
					<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/index.jsp')"><img class="jincheng" src="img/zhengwu.png"></a>
				</div>

			</div>
			
			
			
			
			<div class="down_seven " >
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/wui/main.jsp')"><img class="img_pp" src="img/ipad_1.png" /></a>
			</div>

		</div>

	</body>

</html>



<script type="text/javascript">
	jQuery(function(){
		jQuery("#countMail_span").text("<%=countMail%>");
		jQuery("#countDb_span").text("<%=countDb%>");
	});

</script>