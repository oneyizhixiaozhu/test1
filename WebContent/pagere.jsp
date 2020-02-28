

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="entity.*"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<%
	//request.getSession().setAttribute("flag",1);
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
	<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
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
<%request.getSession().setAttribute("showTar", "<div align='left'><span style='font-weight:bold;font-size:15px;color:#0066CC;margin-left:0.5%;margin-right:0.5%;'>当前位置</span>><span style='font-weight:bold;font-size:15px;color:#0066CC;margin-left:0.5%;margin-right:0.5%;'>基础信息填报</span></div>"); %>
	<div id="tar" align="center" style="height:25px;"><%String tarinfo=(String)request.getSession().getAttribute("showTar");if(tarinfo!=null){%><%=tarinfo %><%} %>
	</div>
	<br>
	<form action="ClassServlet?method=addinfobase&table=jbxx&ym=pagere.jsp&xh=true&checkspace=true" method="post">
		<table border="1" cellspacing="0" align="center" >
			<tr >
				<td colspan="5" style="background:#D0D0D0">
					<h3 >一、基本信息
					</h3>
				</td>
			</tr>
			<tr>
			
				<td>平台名称：
					<input type="text" style="display:none" name="ptbh-int#11-true"></td>
				<td ><input name="ptmc" type="text" value="${sessionScope.ptmc }"></td>
				<td>平台编号：</td>
				<td>自动生成</td>
			</tr>
			<tr>
				<td>批准年月：</td>
				<td><input class="Wdate" type="text" name="pzny" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"></td>
				<td>批准文号：</td>
				<td><input name="pzwh" type="text" value="${sessionScope.pzwh }"></td>
			</tr>
			<tr>
				<td>技术领域：</td>
				<td colspan="3">尚未设置</td>
			</tr>
			<tr>
				<td>平台级别：</td>
				<td ><input name="ptjb" type="radio" value="国家级" />国家级
					<input name="ptjb" type="radio" value="省级" />省级</td>
				<td>所在市县（区）：</td>
				<td><input type="text" name="szsx" value="${sessionScope.szsx }"></td>
			</tr>
			<tr >
				<td rowspan="2">平台组织形态：</td>
				<td rowspan="2">
					<input name="ptzzxt" type="radio" value="无法人" />无法人<br>
					<input name="ptzzxt" type="radio" value="独立法人" />独立法人
					<input name="ptzzxt" type="radio" value="企业法人" />企业法人
					<input name="ptzzxt" type="radio" value="事业法人" />事业法人
					<input name="ptzzxt" type="radio" value="社团法人" />社团法人</td>
				
				<td colspan="2" ><input name="ptzzxt1" type="radio" value="多单位联合共建" />多单位联合共建
					<input name="ptzzxt1" type="radio" value="依托单位独自建设" />依托单位独自建设 </td>
				
			</tr>
			<tr>
				<td>京津冀共建：</td>
				<td><input name="ptzzxt2" type="radio" value="京津冀共建" />是
					<input name="ptzzxt2" type="radio" value="非京津冀共建" />否</td>
			</tr>
			<tr>
				<td>服务的主要国民经济行业：</td>
				<td colspan="3">1.<input type="text" name="filed1-varchar#255-true" value="${sessionScope.filed1 }">
					2.<input type="text" name="filed2-varchar#255-true" value="${sessionScope.filed2 }">
					3.<input type="text" name="filed3-varchar#255-true"value="${sessionScope.filed3 }"></td>
			</tr>
			<tr>
			<td>所属学科：</td>
				<td colspan="3">1.<input type="text" name="belong1-varchar#255-true"value="${sessionScope.belong1 }">
					2.<input type="text" name="belong2-varchar#255-true"value="${sessionScope.belong2 }">
					3.<input type="text" name="belong3-varchar#255-true"value="${sessionScope.belong3 }"></td>
			</tr>
			<tr>
				<td>依托单位名称：</td>
				<td ><input name="ytdwmc" type="text" value="${sessionScope.ytdwmc }"></td>
				<td>社会信用代码：</td>
				<td><input name="shxydm" type="number"value="${sessionScope.shxydm }"></td>
			</tr>
			<tr>
				<td>依托单位法人：</td>
				<td ><input name="ytdwfr" type="text"  value="${sessionScope.ytdwfr }"/></td>
				<td>办公电话：</td>
				<td><input type="text" name="bgdh" value="${sessionScope.bgdh }"></td>
			</tr>

			<tr >
				<td >依托单位类型：</td>
				<td colspan="3"><input name="ytdwlx" type="radio" value="企业" />企业<br>
					<input name="ytdwlx" type="radio" value="科研机构" />科研机构
					<input name="ytdwlx" type="radio" value="高等院校" />高等院校
					<input name="ytdwlx" type="radio" value="检测机构" />检测机构
					<input name="ytdwlx" type="radio" value="医疗机构" />医疗机构
					<input name="ytdwlx" type="radio" value="政府机构" />政府机构
					<input name="ytdwlx" type="radio" value="社团组织" />社团组织
					<input name="ytdwlx" type="radio" value="其他" />其他
				</td>
			</tr>
			<tr>
				<td>共建单位：</td>
				<td colspan="3"><input type="text" name="gjdw" value="${sessionScope.gjdw }"></td>
			</tr>
			
			<tr>
				<td>平台网站名称：</td>
				<td ><input name="ptwzmc" type="text" value="${sessionScope.ptwzmc }"></td>
				<td>网址：</td>
				<td><input type="text" name="wz" value="${sessionScope.wz }"></td>
			</tr>
			<tr>
				<td>平台通讯地址：</td>
				<td ><input name="pttxdz" type="text" value="${sessionScope.pttxdz }"></td>
				<td>邮编：</td>
				<td><input type="text" name="yb" value="${sessionScope.yb }"></td>
			</tr>
			<tr>
				<td colspan="4">平台主任（院长） </td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td ><input name="xm" type="text" value="${sessionScope.xm }"></td>
				<td>性别：</td>
				<td><input name="xb" type="radio" value="男" />男&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="xb" type="radio" value="女" />女</td>
			</tr>
			
			<tr>
				<td>出生年月：</td>
				<td ><input name="csny" type="text" value="${sessionScope.csny }"></td>
				<td>职称：</td>
				<td><input name="zc" type="text" value="${sessionScope.zc }"></td>
			</tr>
			<tr>
				<td>所学专业：</td>
				<td ><input name="sxzy" type="text" value="${sessionScope.sxzy }"></td>
				<td>学历：</td>
				<td><select name="xl">
					  <option value ="硕士研究生">硕士研究生</option>
					  <option value ="博士研究生">博士研究生</option>
					  <option value="教授">教授</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>学位：</td>
				<td ><select name="xw">
					  <option value ="硕士">硕士</option>
					  <option value ="博士">博士</option>
					  <option value="教授">教授</option>
					</select></td>
				<td>办公电话</td>
				<td><input name="bgdh1" type="text" value="${sessionScope.bgdh1 }"></td>
			</tr>
			<tr>
				<td>手机：</td>
				<td ><input name="sj" type="text" value="${sessionScope.sj }"></td>
				<td>E-mail：</td>
				<td><input name="email" type="text" value="${sessionScope.email }"></td>
			</tr>
			<tr >
				<td colspan="4">
					<span style="color:blue">注：1.“平台编号”：与用户名相同,由平台批准单位统一配置派发。
					</br>&nbsp;&nbsp;&nbsp;&nbsp;  3. “平台组织形态”：“内设机构相对独立（无法人资格）”或“独立法人”由系统自动生成，独立法人的需同时填写法人类型。“多单位联合共建”和“依托单位独自建设”据实单选。“京津冀共建”由北京、天津单位参加共建的选择“是”
					</br>&nbsp;&nbsp;&nbsp;&nbsp; 4. “服务的主要国民经济行业”：按国家标准《国民经济行业分类与代码》（GB/T4754-2011）中的分类代码填写；如服务于多个国民经济行业，按服务的主要行业依次填写，填写三级小类。
					</br>&nbsp;&nbsp;&nbsp;&nbsp; 5. “所属的主要学科”：按国家标准《学科分类与代码》（GB/T 13745-2009）按国家学科分类，填写三级小类。
					</br>&nbsp;&nbsp;&nbsp;&nbsp; 6. “依托单位组织机构代码(社会信用代码)”：填写依托单位的法人组织机构代码或社会信用代码。
					</br>&nbsp;&nbsp;&nbsp;&nbsp; 7. “依托单位类型”：单选。“科研机构”指事业法人性质的公益性非营利国办独立科研机构，不包括整体转制为企业的科研机构。大学附属医院按“医疗机构”填写。政府机构是指政府下设机构，如生产力促进中心、管委会、孵化器等其他事业机构。
					</br>&nbsp;&nbsp;&nbsp;&nbsp; 8.“平台通讯地址”：是指平台办公所在地地址。</span>
				</td>
			</tr>
			<tr >
				<td colspan="4"  align="center"><button style="width:100px">保存</button>&nbsp;&nbsp;&nbsp;<button>保存并下一步</button></td>
			</tr>
		</table>
		
	</form>
</body>
</html>