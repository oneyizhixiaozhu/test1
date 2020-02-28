<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="type.ClassService"%>
<%@ page language="java" import="type.TableTool"%>
<%@ page language="java" import="type.StringHandle"%>
<%@ page language="java" import="type.EntityToString"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<%
	request.getSession().setAttribute("flag",1);
	if(request.getSession().getAttribute("flag")==null)
	{
		request.getRequestDispatcher("flag.jsp").forward(request,response);
		return;
	}
	
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
	table tr:nth-child(odd)
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
	 .btselect
	 {
	 	border-radius:3px;
	 	background:lightblue;
	 	border:1px solid lightblue;
	 	height:30px;
	 	width:90px;
	 	margin-left:2%;
	 }
	 
	 .btselected
	 {
	 	border-radius:3px;
	 	background:white;
	 	color:red;
	 	border:1px solid lightblue;
	 	height:30px;
	 	width:90px;
	 	margin-left:2%;
	 }
	 .ddd{
	 	margin-left:10%;
	 }
	 #targray
	 {
	 	height:40px;
	 	width:80%;
	 	background:lightgray;
	 	margin:0 auto;
	 }
	 
	 #infolist
	 {
	 	width:80%;
	 	margin-left:10%;
	 }

</style>
<body>

	<%request.getSession().setAttribute("showTar", "<div align='left'><span style='font-weight:bold;font-size:15px;color:#0066CC;margin-left:0.5%;margin-right:0.5%;'>当前位置</span>><span style='font-weight:bold;font-size:15px;color:#0066CC;margin-left:0.5%;margin-right:0.5%;'>搜索</span>><span style='font-weight:bold;font-size:15px;color:#0066CC;margin-left:0.5%;margin-right:0.5%;'>结果</span></div>"); %>
	<div id="tar" align="center" style="height:25px;"><%String tarinfo=(String)request.getSession().getAttribute("showTar");if(tarinfo!=null){%><%=tarinfo %><%} %>
	</div>
	<br>
	<div class="ddd">
	<a href="simplesearch.jsp"><button class="btselected">搜索</button></a>
	</div>
	<br>
	
	<%
			request.setCharacterEncoding("utf-8");
			String searchtable="jbxx";
			ClassService service=new ClassService();
			List<String> ls=service.getTableColumn(searchtable);
			StringHandle sh=new StringHandle();
			//ls=sh.StringListAdd(ls, "</br>", "");
			String searchinfo=request.getParameter("searchinfo");
			List<List<String>> infos=service.list(searchtable);
			
			List<String> doubleInofs=sh.StringListListIntoStringList(infos, "\t");
			System.out.print(sh.StringListReplaceAll(doubleInofs, "\\s"));
			List<String> resultinfo=sh.StringListGetSuitSubExpStringList(doubleInofs, searchinfo);
			List<List<String>> tempinfos=sh.StringSplitByExpToStringList(resultinfo, "\t");
			//List<Integer> indexInfo=sh.StringListInStringListIndexof(doubleInofs, resultinfo);
			
	%>
	<div id="targray" align="center">
		<h4 style="text-align:left;">表搜索结果 <%="共"+resultinfo.size()+"条匹配结果" %></h4>
	</div>
	<br>
	<div id="infolist">
			
			<%
				for(int i=0;i<resultinfo.size();i++)
				{
					%>
					<a href="resultinfo.jsp?ptbh=<%=tempinfos.get(i).get(0) %>" style="font-size:20px;font-weight:bold;color:blue;"><%=tempinfos.get(i).get(1).replace(searchinfo, "<span style=\"color:red;\">"+searchinfo+"</span>") %></a>
					<br>
					<span><%=resultinfo.get(i).substring(0, resultinfo.get(i).length()>200?200:(resultinfo.get(i).length()-1)).replace(searchinfo, "<span style=\"color:red;\">"+searchinfo+"</span>")+"..." %></span>
					<br>
					<br>
					<% 
				}
			%>
			

	</div>
			
			
		
</body>
</html>