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
	Object message = request.getAttribute("message");
	if(message!=null && !"".equals(message)){
%>
<script type="text/javascript">
     alert("<%=request.getAttribute("message")%>");
</script>
<%} 
//非管理员不能操作--------------------------------
/*	if(request.getSession().getAttribute("flag")==null||request.getSession().getAttribute("flag")!=null&&(Integer)request.getSession().getAttribute("flag")!=1)
	{
		request.getRequestDispatcher("flag.jsp").forward(request,response);
		return;
	}*/
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
	request.getSession().setAttribute("secordsearch", true);
%>

<%

if(!(request.getParameter("rym")==null||request.getParameter("rym").equals("")))
	request.getRequestDispatcher(request.getParameter("rym")).forward(request,response); 
if(request.getSession().getAttribute("rym")!=null)
{
	String rym=(String)request.getSession().getAttribute("rym");
	request.getSession().setAttribute("rym",null);
	request.getRequestDispatcher(rym).forward(request,response);
	
}
%>
	
	
</body>
</html>