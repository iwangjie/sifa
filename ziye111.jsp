<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ include file="/systeminfo/init_wev8.jsp" %>
<%@ page import="weaver.general.Util" %>
<%@ page import="weaver.general.BaseBean" %>

<jsp:useBean id="RecordSet" class="weaver.conn.RecordSet" scope="page" />
<%
	String doccontent = "";//����
	String docsubject = "";//����
	String doclastmodtime = "";//ʱ��
	String doclastmoddate = "";//����
	BaseBean loggers = new BaseBean();
	String sifaLdjh = Util.null2String(request.getParameter("sifaLdjh"));
	String id = Util.null2String(request.getParameter("id"));
	String locathostIp = Util.null2String(loggers.getPropValue("sifa_page", "locathostIP"));
	
	RecordSet.executeSql("select * from DocDetail where id = "+id);
	if(RecordSet.next()){
		doccontent = RecordSet.getString("doccontent");
		docsubject = RecordSet.getString("docsubject");
		doclastmoddate = RecordSet.getString("doclastmoddate");
		doclastmodtime = RecordSet.getString("doclastmodtime");
	}
	List<String> images = new ArrayList<String>();
	//��ѯͼƬ
	RecordSet.executeSql("select imagefileid from docdetail d1 left join docimagefile d2 on(d1.id = d2.docid) where not(imagefileid is null or imagefileid = '') and  seccategory = "+sifaLdjh+" order by doccreatedate desc ,doccreatetime desc");
	while(RecordSet.next()){
		if(!Util.null2String(RecordSet.getString("imagefileid")).equals("") || Util.null2String(RecordSet.getString("imagefileid")) != null){
			images.add(Util.null2String(RecordSet.getString("imagefileid")));
		}
	}
	
%>
		<meta charset="gbk">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="css/ziye.css" />
		<script src="js/jquery-1.8.3.min.js"></script>

		<script type="text/javascript">
			$(function(){
				jQuery("#search-button").click(function(){
					window.open('http://<%=locathostIp%>/fullsearch/Search.jsp?ecode=1');
				});
				var arrImg = new Array();
				arrImg = <%=images%>;
				$("#sifa_ziye_li").text("<%=docsubject%>");
				$("#sifa_ziye_dateli").text("<%=doclastmoddate%>   <%=doclastmodtime%>");
				$("#sifa_ziye_h1").text("<%=docsubject%>");
				
				/*for(var i=0;i<arrImg.length;i++){
					if(arrImg[i] != null || arrImg[i] != "" || arrImg[i] != undefined){
						$("#sifa_ziye_p").append("<img class='img_100' alt='' src='http://<%=locathostIp%>/weaver/weaver.file.FileDownload?fileid="+arrImg[i]+"' style='background-size: 100% 100%; '>");
					}
				}*/
				
				$("#sifa_ziye_p").append('<%=doccontent%>');
			});
		</script>
<body class="main_bg1"  id="bh-page-index">
<!--<div class="all">--!-->

<div class="bt">
	<div class="logo"><img src="img/logo_03.png" /></div>
	<div class="right">
		<div class="xiala " style="margin-top:9px;">
		<ul>
						<li class="daohang hover_bg">
							<a href="http://<%=locathostIp%>/sifa/index.jsp"><img src="img/logo_01 (2).png "></a>
							<a href="http://<%=locathostIp%>/sifa/index.jsp">��������</li>
						</a>
						<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xuni.jsp')"><img src="img/logo_05.gif "></a>
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xuni.jsp')">�칫ƽ̨</a>
						</li>
						<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://139.215.206.91:9000/portal/login.jsp')"><img src="img/menu_10.png"></a>
							<a href="#" onclick="javascript:window.open('http://139.215.206.91:9000/portal/login.jsp')">�참ƽ̨</a>
						</li>
						<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=133')"><img alt="img/11111_shujuzhongxin.gifͼƬ������" src="img/11111_shujuzhongxin.gif"></a>
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/sifa/xinwen.jsp?urlType=16&eid=6&date2during=0&sifaLdjh=133')" class="tianjia_one yincang" id="yes">��������</a>
							<ul class="caidan_one erji" id="zhuce"> </ul>
						</li>
						
						<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/docs/search/DocMain.jsp?urlType=5')"><img alt="img/menu_30.pngͼƬ������" src="img/menu_30.png"></a>
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/docs/search/DocMain.jsp?urlType=5')" class="tianjia_three yincang" id="yes">�ĵ�����</a>
						</li>
						
						<li class="daohang hover_bg">
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/hrm/HrmTab.jsp?_fromURL=HrmResource')"><img alt="img/menu_75.pngͼƬ������" src="img/menu_75.png"></a>
							<a href="#" onclick="javascript:window.open('http://<%=locathostIp%>/hrm/HrmTab.jsp?_fromURL=HrmResource')" class="tianjia_two yincang" id="yes">��������</a>
							
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
    <div class="section">

            <div class="title">
                
                <ul>
                    <img class='dian' src='img/pic_dian_06.png'><li id="sifa_ziye_li"></li>
                    <li id="sifa_ziye_dateli"></li>
                                    </ul>
            </div>
            <div class="content">
                <ul class="content_one">
<li></li>

	<li>
                        <h1 id="sifa_ziye_h1"></h1></li>
                    <li>
                        <div>
                            <p id="sifa_ziye_p" style="font-family: Microsoft Yahei" ;></p>
                        </div>
                    </li>
                    
                    <li></li>
                      
      



</div>


        </ul>
                <div class="top" style="margin-bottom: 2rem;">
                    <a href="#bh-page-index"><img src="img/top_14.png" /></a>
                </div>
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
									<a href="http://www.moj.gov.cn/ " target="_blank" target="_blank" target="_blank" target="_blank">˾����</a>
								</li>
								<li>
									<a href="http://sft.jl.gov.cn/ " target="_blank" target="_blank" target="_blank">˾����</a>

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
									<a href="http://www.bjsf.gov.cn/publish/portal0/ " target="_blank" target="_blank">������˾����</a>
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
									<a href="http://www.szsf.gov.cn/ " target="_blank" target="_blank" target="_blank" target="_blank" target="_blank">������˾����</a>

								</li>
								<li>
									<a href="http://www.whsfxz.gov.cn/ " target="_blank" target="_blank" target="_blank" target="_blank">�人��˾����</a>
								</li>
								<li>
									<a href="http://www.hrbsf.gov.cn/ " target="_blank" target="_blank" target="_blank">��������˾����</a>
								</li>
								<li>
									<a href="http://www.hrbsf.gov.cn/ " target="_blank" target="_blank">������˾����</a>

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
									<a href="http://www.jledu.gov.cn/jyt/ " target="_blank">�н�����</a>
								</li>
								<li>
									<a href="http://www.ccst.gov.cn/ " target="_blank">�п�ѧ������</a>
								</li>
								<li>
									<a href="http://www.ccgxj.gov.cn/ " target="_blank">�й�ҵ����Ϣ����</a>

								</li>
								<li>
									<a href="http://www.ccga.gov.cn/ga/1/tindex.shtml " target="_blank" target="_blank" target="_blank">�й�����</a>
								</li>
								<li>
									<a href="http://www.ccmz.gov.cn/ccmz/54/tweb.shtml " target="_blank" target="_blank">��������</a>
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



<style>
.content ul li img{
	width:auto;
}
.attach_div a{
	display:none;
}
.attach_link.attach_link_block img{
	width:20px;
}
.right_one{width: 10px;}
</style>


</body>


