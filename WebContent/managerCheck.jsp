<%@page import="type.TableTool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="java.util.*"%>
   <%@ page language="java" import="type.ClassService"%>
     <%@ page language="java" import="type.StringHandle"%>
<%@ page language="java" import="type.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>基本信息审核</title>

</head>
<body>
	<%
	request.getSession().setAttribute("flag",1);
	if(request.getSession().getAttribute("flag")==null||request.getSession().getAttribute("flag")!=null&&(Integer)request.getSession().getAttribute("flag")!=1)
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
	<div align="center">
		<h1 style="color: black;">表格列表</h1>
<%ClassService service =new ClassService();
List<List<String>> jbxx=service.list("jbxx");
System.out.print(jbxx);
TableTool tt=new TableTool();
List<List<String>> shb=service.list("shb");
System.out.println(shb);
StringHandle sh=new StringHandle();
List<Integer> nums=sh.StringListInStringListIndexof(sh.StringListListInitSingleList(jbxx, 0), sh.StringListListInitSingleList(shb, 0));
List<List<String>> result=new ArrayList<List<String>>();
System.out.println(jbxx.size());
for(int i=0;i<jbxx.size();i++)
{
	if(nums.contains(i))
		continue;
	result.add(jbxx.get(i));
}
nums.clear();
nums.add(0);
nums.add(1);
System.out.println(nums);
result=sh.StringListListInitIndexOfIntegerList(result, nums);
System.out.println(result);
for(int j=0;j<result.size();j++)
{
	result.get(j).add("<a href='ClassServlet?method=deleteinfobase&table=jbxx&row=ptbh&xh="+result.get(j).get(0)+"'>删除</a>&nbsp;<a href='otherhandle1.jsp?ptbh="+result.get(j).get(0)+"'>审核</a>");
}
%>
		<table class="tb" border="1" cellspacing="0">
			<%=tt.createTableTr(result, sh.StringNlistToStringList(new String[]{"平台编号","平台名称","操作"}), "align='center' style='width:300px;'") %>
			
		</table>
	</div>
</body>
</html>