<%@ page language="java" contentType="text/html; charset=UTF-8" %> 
<%@ page import="weaver.general.Util" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="weaver.general.BaseBean" %>
<%@ page import="weaver.conn.RecordSet" %>

<%@ page import="weaver.workflow.webservices.WorkflowRequestInfo" %>
<%@ page import="weaver.hrm.User"%>
<%@ page import="weaver.hrm.HrmUserVarify"%>
<%@ page import="weaver.docs.webservices.DocInfo" %>

<%@ page import="java.util.ArrayList" %>

<%@ page import="weaver.mobile.plugin.ecology.service.DocumentService" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.sifa.ContentInfos" %>

<%


String pages = Util.null2String(request.getParameter("page"));
String numPages = Util.null2String(request.getParameter("numPages"));
BaseBean log = new BaseBean();
JSONObject returnJson = new JSONObject();
String	tableName = Util.null2String(log.getPropValue("sifa_page", "sifaGzdt"));
User user = HrmUserVarify.getUser(request, response);
DocInfo[] docinfo = ContentInfos.getList(Integer.parseInt(numPages),Integer.parseInt(pages),user,tableName);
returnJson.put("docInfo",docinfo);
out.print(returnJson.toString().trim());
%>
