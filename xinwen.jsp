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
    <title>˾����</title>
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
						$("#sifa_xinwen_h2").text("�쵼����");
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
							  alert("��ȡʧ�ܣ�");
						   }
						});
					}else if(<%=sifaLdjh%> == "115"){
						$("#sifa_xinwen_h2").text("˾��Ҫ��");
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
							  alert("��ȡʧ�ܣ�");
						   }
						});
					}else if(<%=sifaLdjh%> == "116"){
						$("#sifa_xinwen_h2").text("������̬");
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
							  alert("��ȡʧ�ܣ�");
						   }
						});
					}else if(<%=sifaLdjh%> == "88"){
						$("#sifa_xinwen_h2").text("֪ͨ����");
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
							  alert("��ȡʧ�ܣ�");
						   }
						});
					}else if(<%=sifaLdjh%> == "117"){
						$("#sifa_xinwen_h2").text("�����ļ�");
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
							  alert("��ȡʧ�ܣ�");
						   }
						});
					}else if(<%=sifaLdjh%> == "126"){
						$("#sifa_xinwen_h2").text("ר��ר��");
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
							  alert("��ȡʧ�ܣ�");
						   }
						});
					}else if(<%=sifaLdjh%> == "127"){
						$("#sifa_xinwen_h2").text("˾�������ĸ�");
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
							  alert("��ȡʧ�ܣ�");
						   }
						});
					}else if(<%=sifaLdjh%> == "124"){
						$("#sifa_xinwen_h2").text("��������");
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
							  alert("��ȡʧ�ܣ�");
						   }
						});
					}else if(<%=sifaLdjh%> == "13"){
						$("#sifa_xinwen_h2").text("���Ĺ���");
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
							  alert("��ȡʧ�ܣ�");
						   }
						});
					}
				},
			   error : function(XMLHttpRequest, textStatus, errorThrown){
				  alert("��ȡʧ�ܣ�");
			   }
			});
			jQuery("#search-button").click(function(){
				window.open('http://<%=locathostIp%>/fullsearch/Search.jsp?ecode=1');
			});
		});
		function fyPages(countPage,showpageId,select_page){
			var currentPage = 1-1; //����ҳ��0��ʼ
			var strPage = "";
			var beginClick = "pageClick(1,1,\""+showpageId+"\",\""+select_page+"\")";
			var endClick = "pageClick("+countPage+","+countPage+",\""+showpageId+"\",\""+select_page+"\")";
			var onsClick = "pageClick(-2,"+countPage+",\""+showpageId+"\",\""+select_page+"\")";
			var upsClick = "pageClick(-1,"+countPage+",\""+showpageId+"\",\""+select_page+"\")";
			var selectClick = "pageClick(this.value,"+countPage+",\""+showpageId+"\",\""+select_page+"\")";
			
			strPage = "<a href='#' onclick='javascript:"+beginClick+"'>��ҳ</a>&nbsp;";
			if(countPage > 1 && currentPage != (countPage - 1))
			   strPage += "<a href='#' onclick='javascript:"+onsClick+"'>��һҳ</a>&nbsp;";
			else
				strPage += "&nbsp;<a href='#'>��һҳ</a>&nbsp;";

			//������һҳ����
			if(countPage > 1 && currentPage != (countPage - 1))
				strPage += "<a href='#' onclick='javascript:"+upsClick+"'>��һҳ</a>";
			else
				strPage += "&nbsp;<a href='#'>��һҳ</a>&nbsp;";
				strPage += "&nbsp;<a href='#'  onclick='javascript:"+endClick+"'>βҳ</a>&nbsp;";

			//����select

			strPage += "<span>ת��:<select onchange='"+selectClick+"' id='select_page'>";
			for(var i = 0; i < countPage; i++) {

				if(currentPage == i)
					strPage += "<option selected='selected' value='1'>" + (i + 1) + "</option>&nbsp;";
				else if(i == (countPage-1)) {
					strPage += "<option value="+countPage+">" + (i+1) + "</option>&nbsp;";
				} else
					strPage += "<option value="+(i+1)+" >" + (i + 1) + "</option>&nbsp;";
			}
			strPage += "</select>";
			strPage += "ҳ ҳ�Σ�<span id='showpageId'>1</span>/"+countPage+"&nbsp;ÿҳ10����¼</span>";
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
				  alert("��ȡʧ�ܣ�");
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
				<a href="http://<%=locathostIp%>/sifa/index.jsp">��������</a>
			</li>
			<li class="daohang hover_bg">
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xuni.jsp')"><img src="img/logo_05.gif "></a>
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xuni.jsp')">�칫ƽ̨</a>
			</li>
			<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://124.235.155.164:8081/blog/myBlog.jsp?e71508726730350=')"><img src="img/menu_10.png"></a>
							<a href="#" onclick="javascript:window.open('http://124.235.155.164:8081/blog/myBlog.jsp?e71508726730350=')">�참ƽ̨</a>
						</li>
						<li class="daohang hover_bg">
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=124')"><img alt="img/11111_shujuzhongxin.gifͼƬ������" src="img/11111_shujuzhongxin.gif"></a>
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=124')" class="tianjia_one yincang" id="yes">��������</a>
				<ul class="caidan_one erji" id="zhuce"> </ul>
			</li>
			
			<li class="daohang hover_bg">
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/docs/search/DocMain.jsp?urlType=5')"><img src="img/menu_30.png"></a>
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/docs/search/DocMain.jsp?urlType=5')" class="tianjia_three ">�ĵ�����</a>
			</li>
			<li class="daohang hover_bg">
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/hrm/HrmTab.jsp?_fromURL=HrmResource')"><img src="img/menu_75.png"></a>
				<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/hrm/HrmTab.jsp?_fromURL=HrmResource')" class="tianjia_two ">��������</a>
			</li>	
		</ul>
		</div>
		<div class="right_one" style="height: 30px;">
					<!--<img src="img/top_logo_07.gif" class="add" />-->
					<!--<img src="img/top_logo_09.png" class="add" />-->
					<!--  onclick="my_form.submit();"  -->
					<form method="post" id="frm1"  action="" name="frm1" >
						<input type="text" id="key" name="key"  class="shuru" placeholder="������ؼ�������" style="margin-top: 2px;"/>
						<a id="search-button" href="#" class="suosou"><img src="img/sou.png"></a>
					</form>
				</div>

	</div>
	<div class="bt_bg ">
		<!--<img src="img/bg_02.png " />-->
	</div>
	
</div>
				

<!------------------------------------����������-----------------------------------------------------��------------>
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
                        <a href="#">��˾�����ٿ��ֵ�ί�����󣩻���ѧϰ�᳹��ί����ί����λ���</a>
                        <em class="fr">[2017-01-03]</em>
                        
                    </li>
                    <li class="clearfix">
                        <span></span>
                        <a href="#">�ְ칫�ҵ�֧����֯�ٿ�ѧϰ����ʮ�˽�����ȫ�ᾫ��ר�����</a>
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
<!------------------------------------�������ݽ���-----------------------------------------------------��------------>
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
									<a href="http://www.gov.cn/guowuyuan/ " target="_blank">����Ժ</a>
								</li>
								<li>
									<a href="http://www.moj.gov.cn/ " target="_blank">˾����</a>
								</li>
								<li>
									<a href="http://sft.jl.gov.cn/ " target="_blank">˾����</a>

								</li>
								<li>
									<a href="http://www.court.gov.cn/ " target="_blank" target="_blank">�������Ժ</a>

								</li>
								<li>
									<a href="http://www.spp.gov.cn/ " target="_blank">���������Ժ</a>

								</li>
								
						</ul>
					</li>
					<li class="tupian ">
						<a href="# " ><img src="img/footer_08_11.png " class="shangla_two"/></a>
						<ul class="up_two ">
						<li>
								<a href="http://www.cc148.com/index.htm" target="_blank">������˾����</a>
							</li>
							<li>
									<a href="http://www.bjsf.gov.cn/publish/portal0/ " target="_blank">������˾����</a>
								</li>
								<li>
									<a href="http://www.justice.gov.cn/ " target="_blank">�Ϻ���˾����</a>
								</li>
								<li>
									<a href="http://www.cqsfj.gov.cn/ " target="_blank">������˾����</a>

								</li>
								<li>
									<a href="http://www.tjsf.gov.cn/ " target="_blank">�����˾����</a>
								</li>
								<li>
									<a href="http://www.gzsfj.gov.cn/ " target="_blank">������˾����</a>
								</li>
								<li>
									<a href="http://www.szsf.gov.cn/ " target="_blank">������˾����</a>

								</li>
								<li>
									<a href="http://www.whsfxz.gov.cn/ " target="_blank">�人��˾����</a>
								</li>
								<li>
									<a href="http://www.hrbsf.gov.cn/ " target="_blank">��������˾����</a>
								</li>
								<li>
									<a href="http://www.hrbsf.gov.cn/ " target="_blank">������˾����</a>

								</li>
								<li>
									<a href="http://www.sfj.dl.gov.cn/ " target="_blank">������˾����</a>

								</li>
								<li>
									<a href="http://www.xasfj.gov.cn/ptl/index.html " target="_blank">������˾����</a>
								</li>
								<li>
									<a href="http://www.njsfj.gov.cn/ " target="_blank">�Ͼ���˾����</a>
								</li>
								<li>
									<a href="http://www.hzsf.gov.cn/ " target="_blank">������˾����</a>

								</li>
								<li>
									<a href="http://www.nbsfj.gov.cn/ " target="_blank">������˾����</a>
								</li>
								<li>
									<a href="http://www.jnssfj.gov.cn/ " target="_blank">������˾����</a>
								</li>
								<li>
									<a href="http://qdsf.qingdao.gov.cn/ " target="_blank">�ൺ��˾����</a>

								</li>
								<li>
									<a href="http://www.xmsf.gov.cn/ " target="_blank">������˾����</a>
								</li>
								<li>
									<a href="http://www.cdjustice.chengdu.gov.cn/ " target="_blank">�ɶ���˾����</a>
								</li>
							
							
							
						</ul>
					</li>
					<li class="tupian ">
						<a href="# "><img src="img/footer_08_09.png "  class="shangla_two"/></a>
						<ul class="up_three ">
							<li>
								<a href="http://www.ccga.gov.cn/ga/1/tindex.shtml " target="_blank">�й�����</a>
							</li>
							<li>
									<a href="http://www.jledu.gov.cn/jyt/ " target="_blank">�н�����</a>
								</li>
								<li>
									<a href="http://www.ccst.gov.cn/ " target="_blank">�п�ѧ������</a>
								</li>
								<li>
									<a href="http://www.ccgxj.gov.cn/ " target="_blank">�й�ҵ����Ϣ����</a>

								</li>
								</li>
								<li>
									<a href="http://www.ccmz.gov.cn/ccmz/54/tweb.shtml " target="_blank">��������</a>
								</li>
								<li>
									<a href="http://www.cccz.gov.cn/cccz/6/tindex.shtml " target="_blank">�в�����</a>

								</li>
								<li>
									<a href="http://www.ccrs.gov.cn/ " target="_blank">��������Դ����ᱣ�Ͼ�</a>
								</li>
								<li>
									<a href="http://www.ccgt.gov.cn/ " target="_blank">�й�����Դ��</a>
								</li>
								<li>
									<a href="http://www.ccepb.gov.cn/ " target="_blank">�л���������</a>
								</li>
								<li>
									<a href="http://jst.jl.gov.cn/ " target="_blank">�г��罨��ίԱ��</a>

								</li>
								<li>
									<a href="http://www.ccghj.gov.cn/ " target="_blank">�й滮��</a>
								</li>
								<li>
									<a href="http://wang067074.honpu.com/ " target="_blank">��ס�����Ϻͷ��ز������</a>
								</li>
								<li>
									<a href="http://gyj.changchun.gov.cn/ " target="_blank">�������þ�</a>

								</li>
								<li>
									<a href="http://www.ccylj.gov.cn/ " target="_blank">��԰���̻���</a>

								</li>
								<li>
									<a href="http://www.cccgwb.gov.cn/ " target="_blank">���ݻ������������</a>
								</li>
								<li>
									<a href="http://www.cctraffic.com.cn/ " target="_blank">�н�ͨ�����</a>
								</li>
							
							
				
						</ul>
					</li>
					<li class="tupian ">
						<a href="# "><img src="img/footer_08.png " class="shangla_fore"/></a>
						<ul class="up_fore ">
										
					<li>
									<a href="http://www.ccchaoyang.gov.cn/cccy/site/163/news/n4803338757.html " target="_blank">������˾����</a>
								</li>
								<li>
									<a href="http://qiye832842289.xinlimaoyi.com/ " target="_blank">�����˾����</a>
								</li>
								<li>
									<a href="http://com82539535.hongniumaoyi.com/ " target="_blank">�Ϲ���˾����</a>

								</li>
								<li>
									<a href="http://www.ccerdao.gov.cn/moban/1/index.php?dw=18 " target="_blank">������˾����</a>
								</li>
								<li>
									<a href="http://qiye838787568.xinlimaoyi.com/ " target="_blank">��԰��˾����</a>
								</li>
								<li>
									<a href="http://com57663892.hongniumaoyi.com/ " target="_blank">˫����˾����</a>

								</li>
								<li>
									<a href="http://yss.jlsf.gov.cn/ " target="_blank">������˾����</a>
								</li>
								<li>
									<a href="http://www.nong-an.gov.cn/bmdh/xsgbm/sfj.htm " target="_blank">ũ����˾����</a>

								</li>
								<li>
									<a href="http://qiye836577843.xinlimaoyi.com/" target="_blank">�»���˾����</a>
								</li>
								<li>
									<a href="http://qiye837985291.xinlimaoyi.com/ " target="_blank">��̨��˾����</a>

								</li>
						</ul>
					</li>
				</ul>
    				<div class="number_p">
            <div class="people">
                <ul>
                    <li style="color:white">������:189��</li>

                </ul>
            </div>
            <div class="peoples">
                <ul>
                    <li>��������:</li>
                    <li >1</li>
                    <li>��</li>
                </ul>
            </div>
        </div>
			</div>
		</div>
		<style>
			.peoples{
				color:red;
			}
			
		</style><!------------------------------------ҳ�Ž���-----------------------------------------------------��------------>
<!--</div>--!-->

</div>
