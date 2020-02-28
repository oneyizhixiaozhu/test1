<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="type.ClassService"%>
<%@ page language="java" import="type.TableTool"%>
<%@ page language="java" import="type.StringHandle"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>xxx处理页</title>
</head>
<body>
<h3 align="center">技术领域设置</h3>
<%
	Object message = request.getAttribute("message");
	if(message!=null && !"".equals(message)){
%>
<script type="text/javascript">
     alert("<%=request.getAttribute("message")%>");
</script>
<%} 
//非管理员不能操作--------------------------------
	if(request.getSession().getAttribute("flag")==null||request.getSession().getAttribute("flag")!=null&&(Integer)request.getSession().getAttribute("flag")!=1)
	{
		request.getRequestDispatcher("flag.jsp").forward(request,response);
		return;
	}
//游客禁止操作--------------------------------
/*	if(request.getSession().getAttribute("flag")==null)
	{
		request.getRequestDispatcher("flag.jsp").forward(request,response);
		return;
	}*/
	//处理函数===================================
	//---------------------
	ClassService service=new ClassService();
	StringHandle sh=new StringHandle();
	//---------------------
%>
<style>
	td{
		width:100px;
	}
	td input
	{
		width:70%;
	}
</style>
<form action="ClassServlet?method=addinfobase&table=jslyb&ym=otherhandle2.jsp&xh=true&checkspace=true" method="post">
<table align="center" border="1" cellspacing="1">
	<tr align="center">
		<td>编&nbsp;号     </td>
		<td>名&nbsp;称 </td>
		<td>父编号 (类型)</td>
		<td>操&nbsp;作 </td>
	</tr>
	<%List<List<String>> list=service.list("jslyb");
	TableTool tt=new TableTool();
	List<String> info=new ArrayList<String>();
	System.out.println(list);
	for(int i=0;i<list.size();i++)
	{
		info.add("<a href='ClassServlet?method=deleteinfobase&table=jslyb&row=bh&xh="+list.get(i).get(0)+"&ym=otherhandle2.jsp'>删除</a>");
	}
	list=sh.StringListListAddToStringListList(list, info);
	%>
	<%=tt.createTableTrWithouttitles(list, "align='center'") %>
	
	<tr  align="center">
		<td>...<input type="text" style="display:none" name="bh-int#11-true"></td>
		<td><input type="text"  name="mc-varchar#255=mc"></td>
		<td><select  name="fubianhao-varchar#255-true">
		<%
		for(int j=0;j<list.size();j++)
		{
		%>
		<option value="<%=list.get(j).get(0) %>"><%=list.get(j).get(1) %></option>
		<%} %>
		<option value="-1">根节点</option>
		</select></td>
		<td>无法操作的项</td>
	</tr>
</table>
	<div align="center" style="margin-top:10px;">
	<input type="reset" style="margin-right:2%;" value="清空">
	<button style="margin-left:2%;">确定</button>
	<hr style="width:30%">
	</div>
	
</form>


<%
if(!(request.getParameter("rym")==null||request.getParameter("rym").equals("")))
	request.getRequestDispatcher(request.getParameter("rym")).forward(request,response); %>
</body>
</html>