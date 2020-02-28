<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="type.PointInfo"%>
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
<title>搜索结果处理页</title>
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
	if(request.getSession().getAttribute("flag")==null)
	{
		request.getRequestDispatcher("flag.jsp").forward(request,response);
		return;
	}
	//处理函数===================================
	//---------------------
	ClassService service=new ClassService();
	StringHandle sh=new StringHandle();
	Gson gson=new Gson();
	PointInfo lpi[]=gson.fromJson((String)request.getSession().getAttribute("nodesJson"), PointInfo[].class);
	int g_times=Integer.parseInt((String)request.getSession().getAttribute("times"));
	List<String> info1=new ArrayList<String>();
	List<String> info2=new ArrayList<String>();
	List<String> row=new ArrayList<String>();
	List<String> searchtype=new ArrayList<String>();
	List<String> operator=new ArrayList<String>();
	for(int i=0;i<g_times;i++)
	{
		info1.add(request.getSession().getAttribute("info1_"+i)!=null?(String)request.getSession().getAttribute("info1_"+i):"");
		info2.add(request.getSession().getAttribute("info2_"+i)!=null?(String)request.getSession().getAttribute("info2_"+i):"");
		row.add(request.getSession().getAttribute("row"+i)!=null?(String)request.getSession().getAttribute("row"+i):"");
		searchtype.add(request.getSession().getAttribute("searchtype"+i)!=null?(String)request.getSession().getAttribute("searchtype"+i):"");
		operator.add(request.getSession().getAttribute("operator"+i)!=null?(String)request.getSession().getAttribute("operator"+i):"");
	}
	String starttime=request.getSession().getAttribute("starttime")!=null?(String)request.getSession().getAttribute("starttime"):"";
	String endtime=request.getSession().getAttribute("endtime")!=null?(String)request.getSession().getAttribute("endtime"):"";
	/*System.out.println(info1);
	System.out.println(info2);
	System.out.println(row);
	System.out.println(searchtype);
	System.out.println(operator);
	System.out.println(starttime);
	System.out.println(endtime);*/
	
	//---------------------(String)request.getSession().getAttribute("nodesJson")
%>


<%request.getSession().setAttribute("showTar", "<div align='left'><span style='font-weight:bold;font-size:15px;color:#0066CC;margin-left:0.5%;margin-right:0.5%;'>当前位置</span>><span style='font-weight:bold;font-size:15px;color:#0066CC;margin-left:0.5%;margin-right:0.5%;'>搜索</span>><span style='font-weight:bold;font-size:15px;color:#0066CC;margin-left:0.5%;margin-right:0.5%;'>结果</span></div>"); %>
	<div id="tar" align="center" style="height:25px;"><%String tarinfo=(String)request.getSession().getAttribute("showTar");if(tarinfo!=null){%><%=tarinfo %><%} %>
	</div>
	<br>
	<div class="ddd">
	<a href="advancesearch.jsp"><button class="btselected">搜索</button></a>
	</div>
	<br>
	
	<%
			request.setCharacterEncoding("utf-8");
			String searchtable="jbxx";
			int daterowindex=2;	//表中作为时间的列
			List<String> resultinfo=new ArrayList<String>();
			List<List<String>> tempinfos=new ArrayList<List<String>>();
			List<List<String>> infos=new ArrayList<List<String>>();
			//service.searchByTime("jbxx", sh.StringListToStringNlist(service.getTableColumn("jbxx")), new String[]{}, "pzny", starttime, endtime);
			String sql=new String();
			for(int j=0;j<row.size();j++)
			{
				if(j!=0)
					sql+=" and";
				String condition1=(searchtype.get(j).equals("mohu")?" like '%"+info1.get(j)+"%'":" ='"+info1.get(j)+"'");
				String condition2=(searchtype.get(j).equals("mohu")?" like '%"+info2.get(j)+"%'":" ='"+info2.get(j)+"'");
				sql+=" ("+row.get(j)+condition1+" "+operator.get(j)+" "+row.get(j)+condition2+" )";
				if(request.getSession().getAttribute("secordsearch")!=null)
				{
					if(request.getSession().getAttribute("sql")!=null)
						sql+=" and"+request.getSession().getAttribute("sql");
				}
			}
			System.out.println("select * from "+searchtable+" where "+sql);
			ResultSet rs=service.executeQuery("select * from "+searchtable+" where "+sql);
			request.getSession().setAttribute("sql", sql);
			List<String> columns=service.getTableColumn(searchtable);
			while(rs.next())
			{
				List<String> sinfo=new ArrayList<String>();
				for(int k=0;k<columns.size();k++)
				{
					String rowinfo=rs.getString(columns.get(k));
					
					if(sh.StringListContainString(row,columns.get(k)))
					{
						String tinfo1=info1.get(row.indexOf(columns.get(k))).equals("")?info1.get(row.indexOf(columns.get(k))):".*";
						String tinfo2=info2.get(row.indexOf(columns.get(k))).equals("")?info2.get(row.indexOf(columns.get(k))):".*";
						rowinfo=rowinfo.replaceAll("(("+tinfo1+")|("+tinfo2+"))", "<span style=\"color:red;\">$1</span>");
					}
					sinfo.add(rowinfo);
				}
				infos.add(sinfo);
			}
			//System.out.print(infos);
			//年月格式------------------------------------------
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			//------------------------------------------------------
			
			int g_infossize=infos.size();
			Iterator<List<String>> is=infos.iterator();
			while(is.hasNext())
			{
				List<String> ls=is.next();
				boolean g_remove=false;
				
				//判断符合树lpi
				//一次表定位
				List<List<String>> shb=service.list("shb");
				List<String> indexs=sh.StringListListInitSingleList(shb, 0);
				int index=indexs.indexOf(ls.get(0));
				//二次表定位
				if(index==-1)
				{
					is.remove();
					continue;
				}
					
				String jsly=shb.get(index).get(1);
				/*List<List<String>> jslyb=service.list("jslyb");
				List<String> jslyindexs=sh.StringListListInitSingleList(jslyb, 0);
				int jsindex=jslyindexs.indexOf(jsly);*/
				boolean g_searchout=false;
				if(lpi!=null)
				{
					for(PointInfo pi:lpi)
					{
						if(pi.getId()==Integer.parseInt(jsly))
						{
							g_searchout=true;
							break;
						}
					}
				}
				else g_searchout=true;
				if(!g_searchout)
					g_remove=true;
				//---------------------------
				
				//判断符合时间
				Date temptime=sdf.parse(ls.get(daterowindex));
				Date start=null;
				if(!starttime.equals(""))
				{
					start=sdf.parse(starttime);
					if(start.compareTo(temptime )>0)
					{
						g_remove=true;
					}
				}	
				Date end=null;
				if(!endtime.equals(""))
				{
					end=sdf.parse(endtime);
					if(end.compareTo(temptime)<0)
					{
						g_remove=true;
					}
				}
				//-------------------------------
				
				
				if(g_remove)
					is.remove();
			}
				
			
			
			//技术领域(树判断)
			
			//-----------
			
			resultinfo=sh.StringListListIntoStringList(infos, "\t");
			tempinfos=sh.StringSplitByExpToStringList(resultinfo, "\t");
			//request.getSession().setAttribute("searchresult", tempinfos);
			
			
	%>
	<div id="targray" align="center">
		<h4 style="text-align:left;">表搜索结果 <%="共"+resultinfo.size()+"条匹配结果" %><a style="margin-left:78%" href="otherhandle5.jsp?rym=advancesearch.jsp">在搜索结果中再匹配</a></h4>
	</div>
	<br>
	<div id="infolist">
			
			<%
				for(int i=0;i<resultinfo.size();i++)
				{
					%>
					<a href="resultinfo.jsp?ptbh=<%=tempinfos.get(i).get(0) %>" style="font-size:20px;font-weight:bold;color:blue;"><%=tempinfos.get(i).get(1) %></a>
					<br>
					<span><%=resultinfo.get(i).substring(0, (resultinfo.get(i).length()-1))+"..." %></span>
					<br>
					<br>
					<% 
				}
			%>
			

	</div>


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