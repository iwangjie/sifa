<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ include file="/systeminfo/init_wev8.jsp" %>
<%@ page import="weaver.general.Util" %>
<%@ page import="weaver.general.BaseBean" %>
<%@page import="weaver.hrm.online.HrmUserOnlineMap"%>

<jsp:useBean id="RecordSet" class="weaver.conn.RecordSet" scope="page" />
<%
    String countMail = "";//邮件数量
	String countResourse = "";//总人数
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
	String sifaLdjh = Util.null2String(loggers.getPropValue("sifa_page", "sifaLdjh"));
	String sifaYwId = Util.null2String(loggers.getPropValue("sifa_page", "sifaYwId"));
	String sifaGzdt = Util.null2String(loggers.getPropValue("sifa_page", "sifaGzdt"));
	String sifaTzgg = Util.null2String(loggers.getPropValue("sifa_page", "sifaTzgg"));
	String sifaZcwj = Util.null2String(loggers.getPropValue("sifa_page", "sifaZcwj"));
%>
<%
	List<String> images = new ArrayList<String>();
	List<String> id = new ArrayList<String>();
	//查询图片
	RecordSet.executeSql("select * from docdetail d1 left join docimagefile d2 on(d1.id = d2.docid) where d1.seccategory = "+seccategoryId+" and (d2.imagefileid is not null and d2.imagefileid <>'') order by doccreatedate desc ,doccreatetime desc");
	while(RecordSet.next()){
		images.add(Util.null2String(RecordSet.getString("imagefileid")));
		id.add(Util.null2String(RecordSet.getString("id")));
	}
	List<String> images02 = new ArrayList<String>();
	List<String> id02 = new ArrayList<String>();
	RecordSet.executeSql("select * from docdetail d1 left join docimagefile d2 on(d1.id = d2.docid) where d1.seccategory = "+sifaYwId+" and (d2.imagefileid is not null and d2.imagefileid <>'') order by doccreatedate desc ,doccreatetime desc");
	while(RecordSet.next()){
		images02.add(Util.null2String(RecordSet.getString("imagefileid")));
		id02.add(Util.null2String(RecordSet.getString("id")));
	}
	HrmUserOnlineMap localHrmUserOnlineMap = HrmUserOnlineMap.getInstance();
	Map localMap = localHrmUserOnlineMap.getClusterMap();
%>
		<meta charset="gbk">
		<meta name="Author" content="">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<link rel="stylesheet" type="text/css" href="css/lunbo.css" />
		<link rel="stylesheet" type="text/css" href="css/lunbo_one.css" />
		<script src="js/jquery-1.4.4.min.js"></script>
		<script src="js/slider.js"></script>
		<script language="JavaScript">
			function myrefresh() {
				window.location.reload();
			}
			setTimeout('myrefresh()', 90000); //指定1秒刷新一次
		</script>

		<script type="text/javascript">
		    function arrSplit(arr){
				return arr.split(" ")[1];
			}
			
			jQuery(function() {
				var arrImg = new Array();
				arrImg = <%=images%>;
				var id = new Array();
				id = <%=id%>;
				var arrImg02 = new Array();
				arrImg02 = <%=images02%>;
				var id02 = new Array();
				id02 = <%=id02%>;
				
				for(var i=0;i<3;i++){
					var banner_str = "<li><a title='' href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=seccategoryId%>&id="+id[i]+"')\">"+
									 "<img class='img_100' alt='' src='http://<%=locathostIp%>/weaver/weaver.file.FileDownload?fileid="+arrImg[i]+"' style='background-size: 100% 100%; '></a></li>";
					var banner_ol = "<li><a>"+(i+1)+"</a></li>";	
   					
					jQuery("#banner_ul").append(banner_str);
					jQuery("#bannerCtrl").append(banner_str);
				}
				for(var i=0;i<3;i++){
					var banner_str = "<li><a title='' href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaYwId%>&id="+id02[i]+"')\">"+
									 "<img class='img_100' alt='' src='http://<%=locathostIp%>/weaver/weaver.file.FileDownload?fileid="+arrImg02[i]+"' style='background-size: 100% 100%; '></a></li>";
					var banner_ol = "<li><a>"+(i+1)+"</a></li>";	
   					
					jQuery("#banner_tabs_ul").append(banner_str);
				}
				
				jQuery("#search-button").click(function(){
					window.open('http://<%=locathostIp%>/fullsearch/Search.jsp?ecode=1');
				});
				jQuery.ajax({ 
					url : "/sifa/ps.jsp",  
					type:"post",
					async: false,
					dataType:"text",
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:"page=7&numPages=1",
					success : function(content) {
						
						content = eval('('+content.replace(/(^\s*)|(\s*$)/g, "")+')');
						for(var i=0;i<content.docInfo.length;i++){
							var str = "<li class='clearfix'><span class='fd_zuob'>"+
									 "<a href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaYwId%>&id="+content.docInfo[i].id+"')\">"+
							          "<img src='img/small_logo_24.png'/>"+"  "+
									  content.docInfo[i].docSubject+"</a></span>"+
									  "<span class='fd_youb'>"+
									  content.docInfo[i].doccreatedate+"</span></li>";
							
							jQuery("#sifaYw_ul").append(str);
						}
					},
				   error : function(XMLHttpRequest, textStatus, errorThrown){
					  alert("获取失败！");
				   }
				});
				
				jQuery.ajax({ 
					url : "/sifa/ps02.jsp",  
					type:"post",
					async: false,
					dataType:"text",
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:"page=6&numPages=1",
					success : function(content) {
						content = eval('('+content.replace(/(^\s*)|(\s*$)/g, "")+')');
						for(var i=0;i<content.docInfo.length;i++){
							var str = "<li class='clearfix'><span class='fd_zuob'>"+
									  "<a href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaLdjh%>&id="+content.docInfo[i].id+"')\">"+
							          "<img src='img/small_logo_24.png'/>"+"  "+
									  content.docInfo[i].docSubject+"</a></span>"+
									  "<span class='fd_youb'>"+
									  content.docInfo[i].doccreatedate+"</span></li>";
							
							jQuery("#sifaLd_ul").append(str);
						}
					},
				   error : function(XMLHttpRequest, textStatus, errorThrown){
					  alert("获取失败！");
				   }
				});
				
				jQuery.ajax({ 
					url : "/sifa/ps03.jsp",  
					type:"post",
					async: false,
					dataType:"text",
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:"page=6&numPages=1",
					success : function(content) {
						content = eval('('+content.replace(/(^\s*)|(\s*$)/g, "")+')');
						for(var i=0;i<content.docInfo.length;i++){
							var str = "<li class='clearfix'><span class='fd_zuob'>"+
									  "<a href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaGzdt%>&id="+content.docInfo[i].id+"')\">"+
							          "<img src='img/small_logo_24.png'/>"+"  "+
									  content.docInfo[i].docSubject+"</a></span>"+
									  "<span class='fd_youb'>"+
									  content.docInfo[i].doccreatedate+"</span></li>";
							
							jQuery("#sifaGz_ul").append(str);
						}
					},
				   error : function(XMLHttpRequest, textStatus, errorThrown){
					  alert("获取失败！");
				   }
				});
				
				jQuery.ajax({ 
					url : "/sifa/ps04.jsp",  
					type:"post",
					async: false,
					dataType:"text",
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:"page=5&numPages=1",
					success : function(content) {
						content = eval('('+content.replace(/(^\s*)|(\s*$)/g, "")+')');
						for(var i=0;i<content.docInfo.length;i++){
							var str = "<li class='clearfix'><span class='fd_zuos'>"+
									  "<a href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaTzgg%>&id="+content.docInfo[i].id+"')\">"+
							          "<img src='img/small_logo_24.png'/>"+"  "+
									  content.docInfo[i].docSubject+"</a></span>"+
									  "<span class='fd_yous'>"+
									  content.docInfo[i].doccreatedate+"</span></li>";
							
							jQuery("#sifaTz_ul").append(str);
						}
					},
				   error : function(XMLHttpRequest, textStatus, errorThrown){
					  alert("获取失败！");
				   }
				});
				
				jQuery.ajax({ 
					url : "/sifa/ps05.jsp",  
					type:"post",
					async: false,
					dataType:"text",
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:"page=5&numPages=1",
					success : function(content) {
						content = eval('('+content.replace(/(^\s*)|(\s*$)/g, "")+')');
						for(var i=0;i<content.docInfo.length;i++){
							var str = "<li class='clearfix'><span class='fd_zuof'>"+
									  "<a href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaZcwj%>&id="+content.docInfo[i].id+"')\">"+
							          "<img src='img/small_logo_24.png'/>"+"  "+
									  content.docInfo[i].docSubject+"</a></span>"+
									  "<span class='fd_you_k'>"+
									  content.docInfo[i].doccreatedate+"</span></li>";
							
							jQuery("#sifaZc_ul").append(str);
						}
					},
				   error : function(XMLHttpRequest, textStatus, errorThrown){
					  alert("获取失败！");
				   }
				});
				jQuery("#userName_span").text("<%=userName%>");
				jQuery("#countMail_span").text("<%=countMail%>");
				jQuery("#countResourse_span").text("<%=countResourse%>");
				jQuery("#countZx_span").text("<%=localMap.size()%>");
				jQuery("#countDb_span").text("<%=countDb%>");
				jQuery.ajax({
					type: "GET",
					url: "http://wthrcdn.etouch.cn/weather_mini?citykey=101060101",
					data: "",
					async:false,
					success: function(msg){
						var jsondata = 	eval('(' + msg + ')');
						arrSplit(jsondata.data.forecast[0].high);
						jQuery("#p_weaterN").text("今天是<%=mouth%>月<%=day%>日"+"  "+jsondata.data.forecast[0].fengli.substring(jsondata.data.forecast[0].fengli.lastIndexOf("[")+1,jsondata.data.forecast[0].fengli.indexOf("]"))+jsondata.data.forecast[0].fengxiang);
						jQuery("#p_weaterM").text(jsondata.data.forecast[0].type+"  "+ arrSplit(jsondata.data.forecast[0].low)+"~"+arrSplit(jsondata.data.forecast[0].high));
						//alert(jsondata.data.wendu);
						//jQuery("#wendu").html(jsondata.data.wendu + "<i>℃</i>");
					}
				});
				
				var bannerSlider = new Slider(jQuery('#banner_tabs'), {
					time: 2000,
					delay: 400,
					event: 'hover',
					auto: true,
					mode: 'fade',
					controller: jQuery('#bannerCtrl'),
					activeControllerCls: 'active'
				});
				jQuery('#banner_tabs .flex-prev').click(function() {
					bannerSlider.prev()
				});
				jQuery('#banner_tabs .flex-next').click(function() {
					bannerSlider.next()
				});
			})

			jQuery(function() {
				var bannerSlider = new Slider(jQuery('#banner'), {
					time: 3000,
					delay: 400,
					event: 'hover',
					auto: true,
					mode: 'fade',
					controller: jQuery('#bannerCtrlss'),
					activeControllerCls: 'active'
				});
				jQuery('#banner .flex-prevss').click(function() {
					bannerSlider.prev()
				});
				jQuery('#banner .flex-nextss').click(function() {
					bannerSlider.next()
				});
			})
		</script>
		<!--<script type="text/javascript">
            jQuery(document).ready(function() {
                var 	imgId0 = jQuery("#yes"),
                        imgId1 = jQuery("#yes1"),
                        imgId2 = jQuery("#yes2"),
                        imgId3 = jQuery("#yes3");
                var zhuce0 =  jQuery("#zhuce"),
                        zhuce1 = jQuery("#zhuce1"),
                        zhuce2 = jQuery("#zhuce2"),
                        zhuce3 = jQuery("#zhuce3");
                var ListClass = jQuery(".erji");

                function ShowHide (img, list) {
                    img.on('click',function(){
                        if(list.css("display")=='none'){
                            ListClass.hide();
                            list.show(500);
                            "slow"
							"normal"
							"fast"
                        }else{
                            list.hide();
                        }
                    });
                }

                ShowHide(imgId0,zhuce0);
                ShowHide(imgId1,zhuce1);
                ShowHide(imgId2,zhuce2);
                ShowHide(imgId3,zhuce3);
            });
            function brandPicTurn() {
//                jQuery(".erji li").hide();
                jQuery(".erji li").hover(
                        function() {
//                            jQuery(this).children(".erji1").hide();
                            jQuery(this).children(".erji1").show();
                        },
                        function() {
                            jQuery(this).children(".erji1").hide();
//
                        }
                );
            }
        </script>-->
		<title>司法局</title>

	<div class="main_bg1" style="overflow-y:hidden">
		<!-- 导航开始 -->
		<div class="bt">
			<div class="logo"><img src="img/logo_03.png" /></div>
			<div class="right">
				<div class="xiala" style="margin-top:9px;">
					<ul>
						<li class="daohang hover_bg">
							<a href="http://<%=locathostIp%>/sifa/index.jsp"><img src="img/logo_01 (2).png "></a>
							<a href="http://<%=locathostIp%>/sifa/index.jsp">政务内网</li>
						</a>
						<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/wui/main.jsp')"><img src="img/logo_05.gif "></a>
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/wui/main.jsp')">办公平台</a>
						</li>
						<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://139.215.206.91:9000/portal/login.jsp')"><img src="img/menu_10.png"></a>
							<a href="#" onclick="javascript:window.open('http://139.215.206.91:9000/portal/login.jsp')">办案平台</a>
						</li>
						<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=133')"><img alt="img/11111_shujuzhongxin.gif图片不存在" src="img/11111_shujuzhongxin.gif"></a>
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=133')" class="tianjia_one yincang" id="yes">数据中心</a>
							<ul class="caidan_one erji" id="zhuce"> </ul>
						</li>
						<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/docs/search/DocMain.jsp?urlType=5')"><img alt="img/menu_30.png图片不存在" src="img/menu_30.png"></a>
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/docs/search/DocMain.jsp?urlType=5')" class="tianjia_three yincang" id="yes">文档中心</a>
						</li>
						
						<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/hrm/HrmTab.jsp?_fromURL=HrmResource')"><img alt="img/menu_75.png图片不存在" src="img/menu_75.png"></a>
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/hrm/HrmTab.jsp?_fromURL=HrmResource')" class="tianjia_two yincang" id="yes">个人中心</a>
							
						</li>

					</ul>
				</div>
				<div class="right_one" style="width: 240px;height: 30px;">
					<!--<img src="img/top_logo_07.gif" class="add" />-->
					<!--<img src="img/top_logo_09.png" class="add" />-->
					<!--  onclick="my_form.submit();"  -->
					<form method="post" id="frm1"  action="" name="frm1" >
						<input type="text" id="key" name="key"  class="shuru" placeholder="请输入关键词搜索" style="margin-top: 2px;"/>
						<a id="search-button" href="#" class="suosou"><img src="img/sou.png"></a>
					</form>
				</div>
			</div>
		</div>
		<!-----------------------------------------导航结束---------------------------------------------- -->
		<!-- 内容开始 -->
		<div class="content ">
			<div class="zuo ">
				<div class="weater ">
					<!--<img src="img/bg_center_06.png " class="img_100 " />-->
					<p id="p_weaterN"></p>
					<p id="p_weaterM"></p>
				</div>
				<div class="">
					<div id="banner" class="flex">
						<ul id="banner_ul" class="slip">

						</ul>

						<ul class="flex-directions">
							<li>
								<a class="flex-prevss" href="javascript:;">Previous</a>
							</li>
							<li>
								<a class="flex-nextss" href="javascript:;">Next</a>
							</li>
						</ul>
						<ol id="bannerCtrlss" class="flex-controls flex-control-pagings">
							
						</ol>
					</div>
				</div>
				<div class="">
					<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=126')">
						<img style="width:100%;" src="img/logo_45_63.gif" class="tupians tu1" /></a>
				</div>
				<div class="lan_one ">
					<p class="ws_p "><img src="./img/jj_26.png">领导讲话
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=<%=sifaLdjh%>')">更多>></a>
					</p>
					<!--<img src="img/title_66.png " class="img_100 pic_neirong " />-->
					<ul id="sifaLd_ul" class="neirong genggai_one " />

					
					</ul>
				</div>
			</div>
			<div class="you ">
				<div class="you_zuo ">
					<div class="weaters ">
						<!--<img src="img/bg_center_51.gif " class="img_100 " />-->
						<p>您好，<span id="userName_span"></span></p>
						<p>提醒:您有
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/email/new/MailInBox.jsp')"><span id="countMail_span"></span>封未读邮件</a>
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/workflow/request/RequestView.jsp')"><span id="countDb_span"></span>待办事项</a>
						</p>
						<div class="small_title ">
							<a href="# " class="brand_name "><img src="img/logo_06.png " class="ws_m1" /></a>
							<!-- <a href="# " class="brand_detail "><img src="img/logo_09.png " class="ws_m1"/></a> -->
						</div>
					</div>
					<div class="lan_two ">
						<p class="wa_p "><img src="./img/dds_18.png">司法要闻
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=<%=sifaYwId%>')">更多>></a>
						</p>
						<ul id="sifaYw_ul" class="neirong_one genggai_one "/>
		
						</ul>
					</div>
					<div class="lantiao " style="height:55px">

						<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=127')">
							<img style="width:100%;" src="img/logo_45_65.png" class="tupians tu1" /></a>

					</div>
					<div class="lan_three " style="margin-top:2.6%">
						<p class="wb_p "><img src="./img/dfs_26.png">工作动态
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=<%=sifaGzdt%>')">更多>></a>
						</p>
						<ul id="sifaGz_ul" class="neirong_two genggai_one " style="min-whidth:100%;" />

						
						</ul>

					</div>
				</div>
				<div class="you_right ">
					<div class="lan_fore ">
						<p class="wd_p "><img src="./img/dgr_12.png">通知公告
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=<%=sifaTzgg%>')">更多>></a>
						</p>
						<ul id="sifaTz_ul" class="neirong_three ">

						
						</ul>
					</div>
					<div class="lan_five ">
						<p class="wd_p "><img src="./img/df_20.png">政策文件
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=<%=sifaZcwj%>')">更多>></a>
						</p>
						<!--<img src="img/section_pic_23.png " class="img_100 pic_neirongdd " />-->
						<ul id="sifaZc_ul" class="neirong_fore ">


						</ul>
					</div>
					<div class="lan_six">
						<p class="wd_p"><img src="./img/df_20.png">聚焦司法
							<!--<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/docs/search/DocMain.jsp?urlType=5&seccategory=<%=sifaYwId%>')">更多>></a>-->
						</p>
						<div id="banner_tabs" class="flexslider" style="margin-top: -1px;">
                            <a href="#	" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=33&id=155')"><img src="./img/video.jpg" style="width:100%;height:200px"/></a>
							<!--<object width="100%" height="200" id="videoPlayer_26" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"><PARAM NAME="_cx" VALUE="8652"><PARAM NAME="_cy" VALUE="5292"><PARAM NAME="FlashVars" VALUE="file=/page/resource/userfile/video/great.flv&amp;autostart=false"><PARAM NAME="Movie" VALUE="/page/element/Video/resource/js/player.swf"><PARAM NAME="Src" VALUE="/page/element/Video/resource/js/player.swf"><PARAM NAME="WMode" VALUE="Transparent"><PARAM NAME="Play" VALUE="0"><PARAM NAME="Loop" VALUE="-1"><PARAM NAME="Quality" VALUE="High"><PARAM NAME="SAlign" VALUE="LT"><PARAM NAME="Menu" VALUE="-1"><PARAM NAME="Base" VALUE=""><PARAM NAME="AllowScriptAccess" VALUE="always"><PARAM NAME="Scale" VALUE="NoScale"><PARAM NAME="DeviceFont" VALUE="0"><PARAM NAME="EmbedMovie" VALUE="0"><PARAM NAME="BGColor" VALUE="FFFFFF"><PARAM NAME="SWRemote" VALUE=""><PARAM NAME="MovieData" VALUE=""><PARAM NAME="SeamlessTabbing" VALUE="1"><PARAM NAME="Profile" VALUE="0"><PARAM NAME="ProfileAddress" VALUE=""><PARAM NAME="ProfilePort" VALUE="0"><PARAM NAME="AllowNetworking" VALUE="all"><PARAM NAME="AllowFullScreen" VALUE="true"><PARAM NAME="AllowFullScreenInteractive" VALUE="false"><PARAM NAME="IsDependent" VALUE="-1"><PARAM NAME="BrowserZoom" VALUE="scale">
								<param name="movie" value="/page/element/Video/resource/js/player.swf">
								<param name="bgcolor" value="#FFFFFF">
								<param name="quality" value="9">
								<param name="allowfullscreen" value="true">
								<param name="allowscriptaccess" value="always">
								<param name="wmode" value="transparent">
								<param name="flashvars" value="file=/page/resource/userfile/video/great.flv&amp;autostart=false">
								<embed width="100%" height="200" pluginspage="http://www.macromedia.com/go/getflashplayer" src="/page/element/Video/resource/js/player.swf?file=/page/resource/userfile/video/great.flv&amp;autostart=false" type="application/x-shockwave-flash" allowscriptaccess="sameDomain" quality="high" menu="false" wmode="transparent" mce_src="flash/top.swf">
							</object>-->
						</div>
						
					</div>
				</div>

			</div>

		</div>
		<!-- 内容结束 -->

		<div class="bottom ">
			<div class="lianjie ">
				<ul>
					<li>
						<a href=" "><img src="img/lianjie_27.png " /></a>
					</li>
					<li>
						<a href=" ">
							<img src="img/lianjie.png" class="pic_lianjie" /></a>
					</li>
				</ul>
			</div>
			<div class="footer ">
				<ul class="pic_jianju ">
					<li class="tupian ">
						<a href="# "><img src="img/footer_07.png " class="shangla_one" /></a>
						<ul class="up_one ">
							<li>
								<a href="http://www.gov.cn/guowuyuan/ ">国务院</a>
							</li>
							<li>
								<a href="http://www.moj.gov.cn/ ">司法部</a>
							</li>
							<li>
								<a href="http://sft.jl.gov.cn/ ">司法厅</a>

							</li>
							<li>
								<a href="http://www.court.gov.cn/ ">最高人民法院</a>

							</li>
							<li>
								<a href="http://www.spp.gov.cn/ ">最高人民检察院</a>

							</li>
						</ul>
					</li>
					<li class="tupian ">
						<a href="# "><img src="img/footer_08_11.png " class="shangla_two" /></a>
						<ul class="up_two ">
							<li>
								<a href="http://www.bjsf.gov.cn/publish/portal0/ ">北京市司法局</a>
							</li>
							<li>
								<a href="http://www.justice.gov.cn/ ">上海市司法局</a>
							</li>
							<li>
								<a href="http://www.cqsfj.gov.cn/ ">重庆市司法局</a>

							</li>
							<li>
								<a href="http://www.tjsf.gov.cn/ ">天津市司法局</a>
							</li>
							<li>
								<a href="http://www.gzsfj.gov.cn/ ">广州市司法局</a>
							</li>
							<li>
								<a href="http://www.szsf.gov.cn/ ">深圳市司法局</a>

							</li>
							<li>
								<a href="http://www.whsfxz.gov.cn/ ">武汉市司法局</a>
							</li>
							<li>
								<a href="http://www.hrbsf.gov.cn/ ">哈尔滨市司法局</a>
							</li>
							<li>
								<a href="http://www.hrbsf.gov.cn/ ">沈阳市司法局</a>

							</li>
							<li>
								<a href="http://www.sfj.dl.gov.cn/ ">大连市司法局</a>

							</li>
							<li>
								<a href="http://www.xasfj.gov.cn/ptl/index.html ">西安市司法局</a>
							</li>
							<li>
								<a href="http://www.njsfj.gov.cn/ ">南京市司法局</a>
							</li>
							<li>
								<a href="http://www.hzsf.gov.cn/ ">杭州市司法局</a>

							</li>
							<li>
								<a href="http://www.nbsfj.gov.cn/ ">宁波市司法局</a>
							</li>
							<li>
								<a href="http://www.jnssfj.gov.cn/ ">济南市司法局</a>
							</li>
							<li>
								<a href="http://qdsf.qingdao.gov.cn/ ">青岛市司法局</a>

							</li>
							<li>
								<a href="http://www.xmsf.gov.cn/ ">厦门市司法局</a>
							</li>
							<li>
								<a href="http://www.cdjustice.chengdu.gov.cn/ ">成都市司法局</a>
							</li>

						</ul>
					</li>
					<li class="tupian ">
						<a href="# "><img src="img/footer_08_09.png " class="shangla_two" /></a>
						<ul class="up_three ">

							<li>
								<a href="http://www.jledu.gov.cn/jyt/ ">市教育局</a>
							</li>
							<li>
								<a href="http://www.ccst.gov.cn/ ">市科学技术局</a>
							</li>
							<li>
								<a href="http://www.ccgxj.gov.cn/ ">市工业和信息化局</a>

							</li>
							<li>
								<a href="http://www.ccga.gov.cn/ga/1/tindex.shtml ">市公安局</a>
							</li>
							<li>
								<a href="http://www.ccmz.gov.cn/ccmz/54/tweb.shtml ">市民政局</a>
							</li>
							<li>
								<a href="http://www.cccz.gov.cn/cccz/6/tindex.shtml ">市财政局</a>

							</li>
							<li>
								<a href="http://www.ccrs.gov.cn/ ">市人力资源和社会保障局</a>
							</li>
							<li>
								<a href="http://www.ccgt.gov.cn/ ">市国土资源局</a>
							</li>
							<li>
								<a href="http://www.ccepb.gov.cn/ ">市环境保护局</a>
							</li>
							<li>
								<a href="http://jst.jl.gov.cn/ ">市城乡建设委员会</a>

							</li>
							<li>
								<a href="http://www.ccghj.gov.cn/ ">市规划局</a>
							</li>
							<li>
								<a href="http://wang067074.honpu.com/ ">市住房保障和房地产管理局</a>
							</li>
							<li>
								<a href="http://gyj.changchun.gov.cn/ ">市政公用局</a>

							</li>
							<li>
								<a href="http://www.ccylj.gov.cn/ ">市园林绿化局</a>

							</li>
							<li>
								<a href="http://www.cccgwb.gov.cn/ ">市容环境卫生管理局</a>
							</li>
							<li>
								<a href="http://www.cctraffic.com.cn/ ">市交通运输局</a>
							</li>

						</ul>
					</li>
					<li class="tupian ">
						<a href="# "><img src="img/footer_08.png " class="shangla_fore" /></a>
						<ul class="up_fore ">

							<li>
								<a href="http://www.ccchaoyang.gov.cn/cccy/site/163/news/n4803338757.html ">朝阳区司法局</a>
							</li>
							<li>
								<a href="http://qiye832842289.xinlimaoyi.com/ ">宽城区司法局</a>
							</li>
							<li>
								<a href="http://com82539535.hongniumaoyi.com/ ">南关区司法局</a>

							</li>
							<li>
								<a href="http://www.ccerdao.gov.cn/moban/1/index.php?dw=18 ">二道区司法局</a>
							</li>
							<li>
								<a href="http://qiye838787568.xinlimaoyi.com/ ">绿园区司法局</a>
							</li>
							<li>
								<a href="http://com57663892.hongniumaoyi.com/ ">双阳区司法局</a>

							</li>
							<li>
								<a href="http://yss.jlsf.gov.cn/ ">榆树区司法局</a>
							</li>
							<li>
								<a href="http://www.nong-an.gov.cn/bmdh/xsgbm/sfj.htm ">农安区司法局</a>

							</li>
							<li>
								<a href="http://qiye836577843.xinlimaoyi.com/">德惠区司法局</a>
							</li>
							<li>
								<a href="http://qiye837985291.xinlimaoyi.com/ ">九台区司法局</a>

							</li>
						</ul>
					</li>
				</ul>
				<div class="number_p">
					<div class="people">
						<ul>
							<li style="color:white">总人数:<span id="countResourse_span"></span>人</li>

						</ul>
					</div>
					<div class="peoples">
						<ul>
							<li>在线人数:</li>
							<li><span id="countZx_span"></span></li>
							<li>人</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<style>
			.peoples {
				color: red;
			}
		</style>
	</div>

<style>
	.weater p {
		font-family: "宋体";
	}
	
	.weaters p {
		font-family: "宋体";
	}
</style>
