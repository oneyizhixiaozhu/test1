<%@page import="type.StringHandle"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="type.ClassService"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<%
	
	     Object message = request.getAttribute("message");
	     if(message!=null && !"".equals(message)){
	 
	%>
	     <script type="text/javascript">
	          alert("<%=request.getAttribute("message")%>");
	     </script>
	<%} %>
</head>
<style type="text/css">
	td
	{
		height: 40px;
		border: 1px solid #E0E0E0;
	}
	table tr:nth-child(even)
	{
		background: #F0F0F0;
	}
	table td:nth-child(odd)
	{
		background: #F0F0F0;
		width:20%;

	}
	table td:nth-child(even)
	{
		width:30%;

	}
	 table{
	 	border: 1px solid #F0F0F0;
	 	width:80%;
	 } 
	 #tar
	 {
	 	height:40px;
	 	width:80%;
	 	background:lightblue;
	 	margin:0 auto;
	 }
</style>
<body>
	<div id="tar" align="center" style="height:25px;"><%String tarinfo=(String)request.getSession().getAttribute("showTar");if(tarinfo!=null){%><%=tarinfo %><%} %>
	</div>
	<br>
	<form action="ClassServlet?method=updatehandle" method="post">
		<table border="1" cellspacing="0" align="center" >
			<tr >
				<td colspan="5" style="background:#D0D0D0">
					<h3 >一、基本信息
					</h3>
				</td>
			</tr>
			<tr>
			<% 
			ClassService service=new ClassService();
			ResultSet rs=service.executeQuery("select * from jbxx where ptbh='"+request.getParameter("ptbh")+"'");
			rs.next();
			
			//------------中介表搜搜
			//一次表定位
			List<List<String>> infos=service.list("shb");
			StringHandle sh=new StringHandle();
			List<String> indexs=sh.StringListListInitSingleList(infos, 0);
			int index=indexs.indexOf(request.getParameter("ptbh"));
			//二次表定位
			String jsly=infos.get(index).get(1);
			List<List<String>> jslyb=service.list("jslyb");
			List<String> jslyindexs=sh.StringListListInitSingleList(jslyb, 0);
			int jsindex=jslyindexs.indexOf(jsly);
			%>
				<td>平台名称：</td>
				<td ><%=rs.getString("ptmc") %></td>
				<td>平台编号：</td>
				<td><%=rs.getString("ptbh") %></td>
			</tr>
			<tr>
				<td>批准年月：</td>
				<td><%=rs.getString("pzny") %></td>
				<td>批准文号：</td>
				<td><%=rs.getString("pzwh") %></td>
			</tr>
			<tr>
				<td>技术领域：</td>
				<td colspan="3"><%=jslyb.get(jsindex).get(1) %></td>
			</tr>
			<tr>
				<td>平台级别：</td>
				<td ><%=rs.getString("ptjb") %></td>
				<td>所在市县（区）：</td>
				<td><%=rs.getString("szsx") %></td>
			</tr>
			<tr >
				<td rowspan="2">平台组织形态：</td>
				<td rowspan="2">
					<%=rs.getString("ptzzxt") %></td>
				
				<td colspan="2" ><%=rs.getString("ptzzxt1") %></td>
				
			</tr>
			<tr>
				<td>京津冀共建：</td>
				<td><%=rs.getString("ptzzxt2") %></td>
			</tr>
			<tr>
				<td>服务的主要国民经济行业：</td>
				<td colspan="3"><%=rs.getString("filed1") %><br>
					<%=rs.getString("filed2") %><br>
					<%=rs.getString("filed3") %></td>
			</tr>
			<tr>
			<td>所属学科：</td>
				<td colspan="3">1.<%=rs.getString("belong1") %>
					2.<%=rs.getString("belong2") %>
					3.<%=rs.getString("belong3") %></td>
			</tr>
			<tr>
				<td>依托单位名称：</td>
				<td ><%=rs.getString("ytdwmc") %></td>
				<td>社会信用代码：</td>
				<td><%=rs.getString("shxydm") %></td>
			</tr>
			<tr>
				<td>依托单位法人：</td>
				<td ><%=rs.getString("ytdwfr") %></td>
				<td>办公电话：</td>
				<td><%=rs.getString("bgdh") %></td>
			</tr>

			<tr >
				<td >依托单位类型：</td>
				<td colspan="3"><%=rs.getString("ytdwlx") %>
				</td>
			</tr>
			<tr>
				<td>共建单位：</td>
				<td colspan="3"><%=rs.getString("gjdw") %></td>
			</tr>
			
			<tr>
				<td>平台网站名称：</td>
				<td ><%=rs.getString("ptwzmc") %></td>
				<td>网址：</td>
				<td><%=rs.getString("wz") %></td>
			</tr>
			<tr>
				<td>平台通讯地址：</td>
				<td ><%=rs.getString("pttxdz") %></td>
				<td>邮编：</td>
				<td><%=rs.getString("yb") %></td>
			</tr>
			<tr>
				<td colspan="4">平台主任（院长） </td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td ><%=rs.getString("xm") %></td>
				<td>性别：</td>
				<td><%=rs.getString("xb") %></td>
			</tr>
			
			<tr>
				<td>出生年月：</td>
				<td ><%=rs.getString("csny") %></td>
				<td>职称：</td>
				<td><%=rs.getString("zc") %></td>
			</tr>
			<tr>
				<td>所学专业：</td>
				<td ><%=rs.getString("sxzy") %></td>
				<td>学历：</td>
				<td><%=rs.getString("xl") %>
				</td>
			</tr>
			<tr>
				<td>学位：</td>
				<td ><%=rs.getString("xw") %></td>
				<td>办公电话</td>
				<td><%=rs.getString("bgdh1") %></td>
			</tr>
			<tr>
				<td>手机：</td>
				<td ><%=rs.getString("sj") %></td>
				<td>E-mail：</td>
				<td><%=rs.getString("email") %></td>
			</tr>
			<tr>
			<td colspan="4" align="center">
				<a href="otherhandle4.jsp">返回搜索页面</a>
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>