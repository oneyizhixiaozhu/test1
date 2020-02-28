<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h1 style="color: black;">地铁基本信息</h1>
		<br/>
		<form action="ClassServlet?method=addinfo&Class=entity.Subway" method="post" onsubmit="return check()">
			<table>
				<tr>
					<td>线路号</td>
					<td><input type="number" id="number" name="number" oninput="if(value>99999)value=99999"/></td>
				</tr>
				<tr>
					<td>站点数目</td>
					<td><input type="number" id="count" name="count" oninput="if(value>999)value=999"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"> 
						<button type="submit" class="b">确&nbsp;&nbsp;&nbsp;定</button> 
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function check() {
			var number = document.getElementById("number");;
			var count = document.getElementById("count");
			
			//非空
			if(number.value == '') {
				alert('线路号错误');
				number.focus();
				return false;
			}
			if(count.value == '') {
				alert('站点数目错误');
				count.focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>