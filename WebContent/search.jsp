<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="java.util.*"%>
    <%@ page language="java" import="type.TableTool"%>
<%@ page language="java" import="type.StringHandle"%>
<%@ page language="java" import="type.EntityToString"%>
<%@ page language="java" import="type.ClassService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>基本信息</title>

</head>
<body background="9d4a2332efb6818320fef860cbab20a0.jpg">
	<%
	     Object message = request.getAttribute("message");
	     if(message!=null && !"".equals(message)){
	 
	%>
	     <script type="text/javascript">
	          alert("<%=request.getAttribute("message")%>");
	     </script>
	<%} %>
	
	<div align="center">
		<h1 style="color: black;margin-top:10%;" >搜索</h1>
		<br/>
		<form action="searchResult.jsp" method="post" onsubmit="return check()">
			<table>
				<tr>
					<td>
					选择查询表：
					</td>
					<td>
					<%
					ClassService service=new ClassService();
					StringHandle sh=new StringHandle();
					List<String> ls=service.getTableName("user");
					
					
					ls.remove("user");
					ls.remove("userflag");
					ls.remove("usermibao");
					ls.remove("zhuce");
					
					
					for(int i=0;i<ls.size();i++)
						ls.set(i, ls.get(i)+"\">"+ls.get(i));
					ls=sh.StringListAdd(ls, "<option value=\"", "</option>");
					%>
					<select name="searchtable">
					  <%=sh.StringListIntoString(ls, "\r\n") %>
					</select>
					
					</td>
					
					
				</tr>
				<tr>
					<td>搜索信息：</td>
					<td><input type="text" id="searchinfo" name="searchinfo" style="width:120px;"/></td>
				</tr>
				<tr>
					<td colspan="3" align="center"> 
						<button type="submit" style="border-radius:5px;background:lightblue;border:0px;margin-top:15px;">确&nbsp;&nbsp;&nbsp;定</button> 
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function check() {
			var number = document.getElementById("searchinfo");;
			
			//非空
			if(number.value == '') {
				alert('搜索信息错误');
				number.focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>