<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ include file="/systeminfo/init_wev8.jsp" %>
<%@ page import="weaver.general.Util" %>
<%@ page import="weaver.general.BaseBean" %>
<%
	BaseBean loggers = new BaseBean();
	String sifaLdjh = Util.null2String(request.getParameter("sifaLdjh"));
	String locathostIp = Util.null2String(loggers.getPropValue("sifa_page", "locathostIP"));

%>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>司法局</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/xinwen.css" />
	<script src="js/jquery-1.8.3.min.js"></script>
	
	<script type="text/javascript">
	    var counts = 0;
		var url = "";
		$(function(){
			jQuery.ajax({ 
				url : "/sifa/ps06.jsp",  
				type:"post",
				async: false,
				dataType:"text",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				data:"sifaid=<%=sifaLdjh%>",
				success : function(content) {
					content = eval('('+content.replace(/(^\s*)|(\s*$)/g, "")+')');
					if(<%=sifaLdjh%> == "118"){
						$("#sifa_xinwen_h2").text("领导讲话");
						url = "/sifa/ps02.jsp";
						jQuery.ajax({ 
							url : "/sifa/ps02.jsp",  
							type:"post",
							async: false,
							dataType:"text",
							contentType: "application/x-www-form-urlencoded; charset=utf-8",
							data:"page=10&numPages=1",
							success : function(content02) {
								content02 = eval('('+content02.replace(/(^\s*)|(\s*$)/g, "")+')');
								fyPages(Math.ceil(content.counts/10),"showpageId","select_page");
								for(var i=0;i<content02.docInfo.length;i++){
									var str = "<li class='clearfix'> <span></span>"+
												"<a href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaLdjh%>&id="+content02.docInfo[i].id+"')\">"+content02.docInfo[i].docSubject+"</a>"+
												"<em class='fr'>["+content02.docInfo[i].doccreatedate+"]</em>"+
												"</li>";
									$("#sifa_xinwen_ul").append(str);
								}
							},
						   error : function(XMLHttpRequest, textStatus, errorThrown){
							  alert("获取失败！");
						   }
						});
					}else if(<%=sifaLdjh%> == "115"){
						$("#sifa_xinwen_h2").text("司法要闻");
						url = "/sifa/ps.jsp";
						jQuery.ajax({ 
							url : "/sifa/ps.jsp",  
							type:"post",
							async: false,
							dataType:"text",
							contentType: "application/x-www-form-urlencoded; charset=utf-8",
							data:"page=10&numPages=1",
							success : function(content02) {
								content02 = eval('('+content02.replace(/(^\s*)|(\s*$)/g, "")+')');
								fyPages(Math.ceil(content.counts/10),"showpageId","select_page");
								for(var i=0;i<content02.docInfo.length;i++){
									var str = "<li class='clearfix'> <span></span>"+
												"<a href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaLdjh%>&id="+content02.docInfo[i].id+"')\">"+content02.docInfo[i].docSubject+"</a>"+
												"<em class='fr'>["+content02.docInfo[i].doccreatedate+"]</em>"+
												"</li>";
									$("#sifa_xinwen_ul").append(str);
								}
							},
						   error : function(XMLHttpRequest, textStatus, errorThrown){
							  alert("获取失败！");
						   }
						});
					}else if(<%=sifaLdjh%> == "116"){
						$("#sifa_xinwen_h2").text("工作动态");
						url = "/sifa/ps03.jsp";
						jQuery.ajax({ 
							url : "/sifa/ps03.jsp",  
							type:"post",
							async: false,
							dataType:"text",
							contentType: "application/x-www-form-urlencoded; charset=utf-8",
							data:"page=10&numPages=1",
							success : function(content02) {
								content02 = eval('('+content02.replace(/(^\s*)|(\s*$)/g, "")+')');
								fyPages(Math.ceil(content.counts/10),"showpageId","select_page");
								for(var i=0;i<content02.docInfo.length;i++){
									var str = "<li class='clearfix'> <span></span>"+
												"<a href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaLdjh%>&id="+content02.docInfo[i].id+"')\">"+content02.docInfo[i].docSubject+"</a>"+
												"<em class='fr'>["+content02.docInfo[i].doccreatedate+"]</em>"+
												"</li>";
									$("#sifa_xinwen_ul").append(str);
								}
							},
						   error : function(XMLHttpRequest, textStatus, errorThrown){
							  alert("获取失败！");
						   }
						});
					}else if(<%=sifaLdjh%> == "88"){
						$("#sifa_xinwen_h2").text("通知公告");
						url = "/sifa/ps04.jsp";
						jQuery.ajax({ 
							url : "/sifa/ps04.jsp",  
							type:"post",
							async: false,
							dataType:"text",
							contentType: "application/x-www-form-urlencoded; charset=utf-8",
							data:"page=10&numPages=1",
							success : function(content02) {
								content02 = eval('('+content02.replace(/(^\s*)|(\s*$)/g, "")+')');
								fyPages(Math.ceil(content.counts/10),"showpageId","select_page");
								for(var i=0;i<content02.docInfo.length;i++){
									var str = "<li class='clearfix'> <span></span>"+
												"<a href='#' onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaLdjh%>&id="+content02.docInfo[i].id+"')\">"+content02.docInfo[i].docSubject+"</a>"+
												"<em class='fr'>["+content02.docInfo[i].doccreatedate+"]</em>"+
												"</li>";
									$("#sifa_xinwen_ul").append(str);
								}
							},
						   error : function(XMLHttpRequest, textStatus, errorThrown){
							  alert("获取失败！");
						   }
						});
					}else if(<%=sifaLdjh%> == "117"){
						$("#sifa_xinwen_h2").text("政策文件");
						url = "/sifa/ps05.jsp";
						jQuery.ajax({ 
							url : "/sifa/ps05.jsp",  
							type:"post",
							async: false,
							dataType:"text",
							contentType: "application/x-www-form-urlencoded; charset=utf-8",
							data:"page=10&numPages=1",
							success : function(content02) {
								content02 = eval('('+content02.replace(/(^\s*)|(\s*$)/g, "")+')');
								fyPages(Math.ceil(content.counts/10),"showpageId","select_page");
								for(var i=0;i<content02.docInfo.length;i++){
									var str = "<li class='clearfix'> <span></span>"+
												"<a href='#'  onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaLdjh%>&id="+content02.docInfo[i].id+"')\">"+content02.docInfo[i].docSubject+"</a>"+
												"<em class='fr'>["+content02.docInfo[i].doccreatedate+"]</em>"+
												"</li>";
									$("#sifa_xinwen_ul").append(str);
								}
							},
						   error : function(XMLHttpRequest, textStatus, errorThrown){
							  alert("获取失败！");
						   }
						});
					}else if(<%=sifaLdjh%> == "126"){
						$("#sifa_xinwen_h2").text("专题专栏");
						url = "/sifa/ps08.jsp";
						jQuery.ajax({ 
							url : "/sifa/ps08.jsp",  
							type:"post",
							async: false,
							dataType:"text",
							contentType: "application/x-www-form-urlencoded; charset=utf-8",
							data:"page=10&numPages=1",
							success : function(content02) {
								content02 = eval('('+content02.replace(/(^\s*)|(\s*$)/g, "")+')');
								fyPages(Math.ceil(content.counts/10),"showpageId","select_page");
								for(var i=0;i<content02.docInfo.length;i++){
									var str = "<li class='clearfix'> <span></span>"+
												"<a href='#'  onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=126&id="+content02.docInfo[i].id+"')\">"+content02.docInfo[i].docSubject+"</a>"+
												"<em class='fr'>["+content02.docInfo[i].doccreatedate+"]</em>"+
												"</li>";
									$("#sifa_xinwen_ul").append(str);
								}
							},
						   error : function(XMLHttpRequest, textStatus, errorThrown){
							  alert("获取失败！");
						   }
						});
					}else if(<%=sifaLdjh%> == "127"){
						$("#sifa_xinwen_h2").text("司法行政改革");
						url = "/sifa/ps07.jsp";
						jQuery.ajax({ 
							url : "/sifa/ps07.jsp",  
							type:"post",
							async: false,
							dataType:"text",
							contentType: "application/x-www-form-urlencoded; charset=utf-8",
							data:"page=10&numPages=1",
							success : function(content02) {
								content02 = eval('('+content02.replace(/(^\s*)|(\s*$)/g, "")+')');
								fyPages(Math.ceil(content.counts/10),"showpageId","select_page");
								for(var i=0;i<content02.docInfo.length;i++){
									var str = "<li class='clearfix'> <span></span>"+
												"<a href='#'  onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=127&id="+content02.docInfo[i].id+"')\">"+content02.docInfo[i].docSubject+"</a>"+
												"<em class='fr'>["+content02.docInfo[i].doccreatedate+"]</em>"+
												"</li>";
									$("#sifa_xinwen_ul").append(str);
								}
							},
						   error : function(XMLHttpRequest, textStatus, errorThrown){
							  alert("获取失败！");
						   }
						});
					}else if(<%=sifaLdjh%> == "124"){
						$("#sifa_xinwen_h2").text("数据中心");
						url = "/sifa/ps09.jsp";
						jQuery.ajax({ 
							url : "/sifa/ps09.jsp",  
							type:"post",
							async: false,
							dataType:"text",
							contentType: "application/x-www-form-urlencoded; charset=utf-8",
							data:"page=10&numPages=1",
							success : function(content02) {
								content02 = eval('('+content02.replace(/(^\s*)|(\s*$)/g, "")+')');
								fyPages(Math.ceil(content.counts/10),"showpageId","select_page");
								for(var i=0;i<content02.docInfo.length;i++){
									var str = "<li class='clearfix'> <span></span>"+
												"<a href='#'  onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=124&id="+content02.docInfo[i].id+"')\">"+content02.docInfo[i].docSubject+"</a>"+
												"<em class='fr'>["+content02.docInfo[i].doccreatedate+"]</em>"+
												"</li>";
									$("#sifa_xinwen_ul").append(str);
								}
							},
						   error : function(XMLHttpRequest, textStatus, errorThrown){
							  alert("获取失败！");
						   }
						});
					}else if(<%=sifaLdjh%> == "13"){
						$("#sifa_xinwen_h2").text("公文管理");
						url = "/sifa/ps10.jsp";
						jQuery.ajax({ 
							url : "/sifa/ps10.jsp",  
							type:"post",
							async: false,
							dataType:"text",
							contentType: "application/x-www-form-urlencoded; charset=utf-8",
							data:"page=10&numPages=1",
							success : function(content02) {
								content02 = eval('('+content02.replace(/(^\s*)|(\s*$)/g, "")+')');
								fyPages(Math.ceil(content.counts/10),"showpageId","select_page");
								for(var i=0;i<content02.docInfo.length;i++){
									var str = "<li class='clearfix'> <span></span>"+
												"<a href='#'  onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=127&id="+content02.docInfo[i].id+"')\">"+content02.docInfo[i].docSubject+"</a>"+
												"<em class='fr'>["+content02.docInfo[i].doccreatedate+"]</em>"+
												"</li>";
									$("#sifa_xinwen_ul").append(str);
								}
							},
						   error : function(XMLHttpRequest, textStatus, errorThrown){
							  alert("获取失败！");
						   }
						});
					}
				},
			   error : function(XMLHttpRequest, textStatus, errorThrown){
				  alert("获取失败！");
			   }
			});
			jQuery("#search-button").click(function(){
				window.open('http://<%=locathostIp%>/fullsearch/Search.jsp?ecode=1');
			});
		});
		function fyPages(countPage,showpageId,select_page){
			var currentPage = 1-1; //所在页从0开始
			var strPage = "";
			var beginClick = "pageClick(1,1,\""+showpageId+"\",\""+select_page+"\")";
			var endClick = "pageClick("+countPage+","+countPage+",\""+showpageId+"\",\""+select_page+"\")";
			var onsClick = "pageClick(-2,"+countPage+",\""+showpageId+"\",\""+select_page+"\")";
			var upsClick = "pageClick(-1,"+countPage+",\""+showpageId+"\",\""+select_page+"\")";
			var selectClick = "pageClick(this.value,"+countPage+",\""+showpageId+"\",\""+select_page+"\")";
			
			strPage = "<a href='#' onclick='javascript:"+beginClick+"'>首页</a>&nbsp;";
			if(countPage > 1 && currentPage != (countPage - 1))
			   strPage += "<a href='#' onclick='javascript:"+onsClick+"'>上一页</a>&nbsp;";
			else
				strPage += "&nbsp;<a href='#'>上一页</a>&nbsp;";

			//设置下一页代码
			if(countPage > 1 && currentPage != (countPage - 1))
				strPage += "<a href='#' onclick='javascript:"+upsClick+"'>下一页</a>";
			else
				strPage += "&nbsp;<a href='#'>下一页</a>&nbsp;";
				strPage += "&nbsp;<a href='#'  onclick='javascript:"+endClick+"'>尾页</a>&nbsp;";

			//设置select

			strPage += "<span>转到:<select onchange='"+selectClick+"' id='select_page'>";
			for(var i = 0; i < countPage; i++) {

				if(currentPage == i)
					strPage += "<option selected='selected' value='1'>" + (i + 1) + "</option>&nbsp;";
				else if(i == (countPage-1)) {
					strPage += "<option value="+countPage+">" + (i+1) + "</option>&nbsp;";
				} else
					strPage += "<option value="+(i+1)+" >" + (i + 1) + "</option>&nbsp;";
			}
			strPage += "</select>";
			strPage += "页 页次：<span id='showpageId'>1</span>/"+countPage+"&nbsp;每页10条记录</span>";
			$("#sifa_xinwen_page").append(strPage);
		}
		function pageClick(values,countPage,showpageId,select_page){
			if(values == -2){
				values = Number($("#"+showpageId).text()) - 1;
				if(Number($("#"+showpageId).text()) == 1){
					values = 1;
				}
			}
			if(values == -1){
				values = Number($("#"+showpageId).text()) + 1;
				if(Number($("#"+showpageId).text()) == countPage){
					values = countPage;
				}
			}
			jQuery.ajax({ 
				url : url,  
				type:"post",
				async: false,
				dataType:"text",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				data:"page=10&numPages="+values,
				success : function(content02) {
					content02 = eval('('+content02.replace(/(^\s*)|(\s*$)/g, "")+')');
					$("#sifa_xinwen_ul").empty();
					for(var i=0;i<content02.docInfo.length;i++){	
						var str = "<li class='clearfix'> <span></span>"+
									"<a href='#'  onclick=\"javascript:window.open('http://<%=locathostIp%>/sifa/ziye.jsp?sifaLdjh=<%=sifaLdjh%>&id="+content02.docInfo[i].id+"')\">"+content02.docInfo[i].docSubject+"</a>"+
									"<em class='fr'>["+content02.docInfo[i].doccreatedate+"]</em>"+
									"</li>";
						$("#sifa_xinwen_ul").append(str);
					}
				},
			   error : function(XMLHttpRequest, textStatus, errorThrown){
				  alert("获取失败！");
			   }
			});
			$("#"+showpageId).text(values);
			$("#"+select_page).val(values);
		}
		
	</script>	
<div class="main_bg1"  id="bh-page-index">
<div class="bt">
	<div class="logo"><img src="img/logo_03.png" /></div>
	<div class="right">
		<div class="xiala " style="margin-top:9px;">
		<ul>
			<li class="daohang hover_bg">
				<a href="http://<%=locathostIp%>/sifa/index.jsp"><img src="img/logo_01 (2).png "></a>
				<a href="http://<%=locathostIp%>/sifa/index.jsp">政务内网</a>
			</li>
			<li class="daohang hover_bg">
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xuni.jsp')"><img src="img/logo_05.gif "></a>
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xuni.jsp')">办公平台</a>
			</li>
			<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://124.235.155.164:8081/blog/myBlog.jsp?e71508726730350=')"><img src="img/menu_10.png"></a>
							<a href="#" onclick="javascript:window.open('http://124.235.155.164:8081/blog/myBlog.jsp?e71508726730350=')">办案平台</a>
						</li>
						<li class="daohang hover_bg">
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=124')"><img alt="img/11111_shujuzhongxin.gif图片不存在" src="img/11111_shujuzhongxin.gif"></a>
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=124')" class="tianjia_one yincang" id="yes">数据中心</a>
				<ul class="caidan_one erji" id="zhuce"> </ul>
			</li>
			
			<li class="daohang hover_bg">
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/docs/search/DocMain.jsp?urlType=5')"><img src="img/menu_30.png"></a>
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/docs/search/DocMain.jsp?urlType=5')" class="tianjia_three ">文档中心</a>
			</li>
			<li class="daohang hover_bg">
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/hrm/HrmTab.jsp?_fromURL=HrmResource')"><img src="img/menu_75.png"></a>
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/hrm/HrmTab.jsp?_fromURL=HrmResource')" class="tianjia_two ">个人中心</a>
			</li>	
		</ul>
		</div>
		<div class="right_one" style="height: 30px;">
					<!--<img src="img/top_logo_07.gif" class="add" />-->
					<!--<img src="img/top_logo_09.png" class="add" />-->
					<!--  onclick="my_form.submit();"  -->
					<form method="post" id="frm1"  action="" name="frm1" >
						<input type="text" id="key" name="key"  class="shuru" placeholder="请输入关键词搜索" style="margin-top: 2px;"/>
						<a id="search-button" href="#" class="suosou"><img src="img/sou.png"></a>
					</form>
				</div>

	</div>
	<div class="bt_bg ">
		<!--<img src="img/bg_02.png " />-->
	</div>
	
</div>
				

<!------------------------------------导航栏结束-----------------------------------------------------！------------>
<div class="section_bg">

    <!--zhuti start-->
    <div class="zhuti">
        <div class="zht_s clearfix">
            <div class="xbt">
                <img src="img/dds_18.png"/>
                <h2 id="sifa_xinwen_h2"></h2>
            </div>
        </div>
        <div class="zht_z">
            <div class="nr">
                <ul id="sifa_xinwen_ul">
                                   
                    <!--<li class="clearfix">
                        <span></span>
                        <a href="#">市司法局召开局党委（扩大）会议学习贯彻市委政法委第五次会议</a>
                        <em class="fr">[2017-01-03]</em>
                        
                    </li>
                    <li class="clearfix">
                        <span></span>
                        <a href="#">局办公室党支部组织召开学习党的十八届六中全会精神专题会议</a>
                        <em class="fr">[2017-01-02]</em>
                    </li>-->
                </ul>
            </div>
        </div>
        <div class="zht_x">
			<div class="page" id="sifa_xinwen_page">
			</div>
        </div>
        </div>
<!------------------------------------主题内容结束-----------------------------------------------------！------------>
<div class="bottom ">
			<div class="lianjie ">
				<ul>
					<li>
						<a href=" "><img src="img/lianjie_27.png " /></a>
					</li>
					<li>
						<a href=" ">
							<img src="img/lianjie.png" class="pic_lianjie"/></a>
					</li>
				</ul>
			</div>
			<div class="footer ">
				<ul class="pic_jianju ">
					<li class="tupian ">
						<a href="# " ><img src="img/footer_07.png "class="shangla_one"/></a>
						<ul class="up_one ">
								<li>
									<a href="http://www.gov.cn/guowuyuan/ " target="_blank">国务院</a>
								</li>
								<li>
									<a href="http://www.moj.gov.cn/ " target="_blank">司法部</a>
								</li>
								<li>
									<a href="http://sft.jl.gov.cn/ " target="_blank">司法厅</a>

								</li>
								<li>
									<a href="http://www.court.gov.cn/ " target="_blank" target="_blank">最高人民法院</a>

								</li>
								<li>
									<a href="http://www.spp.gov.cn/ " target="_blank">最高人民检察院</a>

								</li>
								
						</ul>
					</li>
					<li class="tupian ">
						<a href="# " ><img src="img/footer_08_11.png " class="shangla_two"/></a>
						<ul class="up_two ">
						<li>
								<a href="http://www.cc148.com/index.htm" target="_blank">长春市司法局</a>
							</li>
							<li>
									<a href="http://www.bjsf.gov.cn/publish/portal0/ " target="_blank">北京市司法局</a>
								</li>
								<li>
									<a href="http://www.justice.gov.cn/ " target="_blank">上海市司法局</a>
								</li>
								<li>
									<a href="http://www.cqsfj.gov.cn/ " target="_blank">重庆市司法局</a>

								</li>
								<li>
									<a href="http://www.tjsf.gov.cn/ " target="_blank">天津市司法局</a>
								</li>
								<li>
									<a href="http://www.gzsfj.gov.cn/ " target="_blank">广州市司法局</a>
								</li>
								<li>
									<a href="http://www.szsf.gov.cn/ " target="_blank">深圳市司法局</a>

								</li>
								<li>
									<a href="http://www.whsfxz.gov.cn/ " target="_blank">武汉市司法局</a>
								</li>
								<li>
									<a href="http://www.hrbsf.gov.cn/ " target="_blank">哈尔滨市司法局</a>
								</li>
								<li>
									<a href="http://www.hrbsf.gov.cn/ " target="_blank">沈阳市司法局</a>

								</li>
								<li>
									<a href="http://www.sfj.dl.gov.cn/ " target="_blank">大连市司法局</a>

								</li>
								<li>
									<a href="http://www.xasfj.gov.cn/ptl/index.html " target="_blank">西安市司法局</a>
								</li>
								<li>
									<a href="http://www.njsfj.gov.cn/ " target="_blank">南京市司法局</a>
								</li>
								<li>
									<a href="http://www.hzsf.gov.cn/ " target="_blank">杭州市司法局</a>

								</li>
								<li>
									<a href="http://www.nbsfj.gov.cn/ " target="_blank">宁波市司法局</a>
								</li>
								<li>
									<a href="http://www.jnssfj.gov.cn/ " target="_blank">济南市司法局</a>
								</li>
								<li>
									<a href="http://qdsf.qingdao.gov.cn/ " target="_blank">青岛市司法局</a>

								</li>
								<li>
									<a href="http://www.xmsf.gov.cn/ " target="_blank">厦门市司法局</a>
								</li>
								<li>
									<a href="http://www.cdjustice.chengdu.gov.cn/ " target="_blank">成都市司法局</a>
								</li>
							
							
							
						</ul>
					</li>
					<li class="tupian ">
						<a href="# "><img src="img/footer_08_09.png "  class="shangla_two"/></a>
						<ul class="up_three ">
							<li>
								<a href="http://www.ccga.gov.cn/ga/1/tindex.shtml " target="_blank">市公安局</a>
							</li>
							<li>
									<a href="http://www.jledu.gov.cn/jyt/ " target="_blank">市教育局</a>
								</li>
								<li>
									<a href="http://www.ccst.gov.cn/ " target="_blank">市科学技术局</a>
								</li>
								<li>
									<a href="http://www.ccgxj.gov.cn/ " target="_blank">市工业和信息化局</a>

								</li>
								</li>
								<li>
									<a href="http://www.ccmz.gov.cn/ccmz/54/tweb.shtml " target="_blank">市民政局</a>
								</li>
								<li>
									<a href="http://www.cccz.gov.cn/cccz/6/tindex.shtml " target="_blank">市财政局</a>

								</li>
								<li>
									<a href="http://www.ccrs.gov.cn/ " target="_blank">市人力资源和社会保障局</a>
								</li>
								<li>
									<a href="http://www.ccgt.gov.cn/ " target="_blank">市国土资源局</a>
								</li>
								<li>
									<a href="http://www.ccepb.gov.cn/ " target="_blank">市环境保护局</a>
								</li>
								<li>
									<a href="http://jst.jl.gov.cn/ " target="_blank">市城乡建设委员会</a>

								</li>
								<li>
									<a href="http://www.ccghj.gov.cn/ " target="_blank">市规划局</a>
								</li>
								<li>
									<a href="http://wang067074.honpu.com/ " target="_blank">市住房保障和房地产管理局</a>
								</li>
								<li>
									<a href="http://gyj.changchun.gov.cn/ " target="_blank">市政公用局</a>

								</li>
								<li>
									<a href="http://www.ccylj.gov.cn/ " target="_blank">市园林绿化局</a>

								</li>
								<li>
									<a href="http://www.cccgwb.gov.cn/ " target="_blank">市容环境卫生管理局</a>
								</li>
								<li>
									<a href="http://www.cctraffic.com.cn/ " target="_blank">市交通运输局</a>
								</li>
							
							
				
						</ul>
					</li>
					<li class="tupian ">
						<a href="# "><img src="img/footer_08.png " class="shangla_fore"/></a>
						<ul class="up_fore ">
										
					<li>
									<a href="http://www.ccchaoyang.gov.cn/cccy/site/163/news/n4803338757.html " target="_blank">朝阳区司法局</a>
								</li>
								<li>
									<a href="http://qiye832842289.xinlimaoyi.com/ " target="_blank">宽城区司法局</a>
								</li>
								<li>
									<a href="http://com82539535.hongniumaoyi.com/ " target="_blank">南关区司法局</a>

								</li>
								<li>
									<a href="http://www.ccerdao.gov.cn/moban/1/index.php?dw=18 " target="_blank">二道区司法局</a>
								</li>
								<li>
									<a href="http://qiye838787568.xinlimaoyi.com/ " target="_blank">绿园区司法局</a>
								</li>
								<li>
									<a href="http://com57663892.hongniumaoyi.com/ " target="_blank">双阳区司法局</a>

								</li>
								<li>
									<a href="http://yss.jlsf.gov.cn/ " target="_blank">榆树区司法局</a>
								</li>
								<li>
									<a href="http://www.nong-an.gov.cn/bmdh/xsgbm/sfj.htm " target="_blank">农安区司法局</a>

								</li>
								<li>
									<a href="http://qiye836577843.xinlimaoyi.com/" target="_blank">德惠区司法局</a>
								</li>
								<li>
									<a href="http://qiye837985291.xinlimaoyi.com/ " target="_blank">九台区司法局</a>

								</li>
						</ul>
					</li>
				</ul>
    				<div class="number_p">
            <div class="people">
                <ul>
                    <li style="color:white">总人数:189人</li>

                </ul>
            </div>
            <div class="peoples">
                <ul>
                    <li>在线人数:</li>
                    <li >1</li>
                    <li>人</li>
                </ul>
            </div>
        </div>
			</div>
		</div>
		<style>
			.peoples{
				color:red;
			}
			
		</style><!------------------------------------页脚结束-----------------------------------------------------！------------>
<!--</div>--!-->

</div>
