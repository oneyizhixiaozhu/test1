<%@page import="java.sql.ResultSet"%>
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
<%
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
	ResultSet rs=service.executeQuery("select * from jbxx where ptbh='"+request.getParameter("ptbh")+"'");
	if(rs.next())
	{
		%>
		<form action="ClassServlet?method=addinfobase&table=shb&ym=managerCheck.jsp&checkspace=true" method="post">
		<table align="center" border="1">
			<tr >
				<td colspan="5" style="background:#D0D0D0">
					<h3 >表格信息
					</h3>
				</td>
			</tr>
			<tr>
			<tr>
				<td>姓名：</td>
				<td ><%=rs.getString("xm") %></td>
				<td>性别：</td>
				<td><%=rs.getString("xb") %></td>
			</tr>
			
			<tr>
				<td>民族：</td>
				<td ><%=rs.getString("mz") %></td>
				<td>政治面貌：</td>
				<td><%=rs.getString("zzmm") %></td>
			</tr>
			<tr>
				<td>批准年月：</td>
				<td><%=rs.getString("pzny") %></td>
				
			</tr>
			<tr>
				<td>技术领域：</td>
				<td colspan="3"><select name="jsly">
				<option value="">尚未选择</option>
				<%
				List<List<String>> ls=service.list("jslyb");
				for(int i=0;i<ls.size();i++) 
				{%>
				<option value="<%=ls.get(i).get(0)%>"><%=ls.get(i).get(1)%></option>
				<%} %>
				</select></td>
			</tr>
			
			
			<tr>
				<td colspan="4" align="center"><button>审核通过</button>&nbsp;<button onclick="return jump();">返回列表页面</button></td>
			</tr>
		</table>
		</form>
		<script type="text/javascript">
		function jump()
		{
			window.location.href="managerCheck.jsp";
			return false;
		}
		</script>
		<% 
	}
	//---------------------
%>
<%
if(!(request.getParameter("rym")==null||request.getParameter("rym").equals("")))
	request.getRequestDispatcher(request.getParameter("rym")).forward(request,response); %>
</body>
</html>