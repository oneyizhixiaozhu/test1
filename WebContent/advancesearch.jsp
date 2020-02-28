<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="type.StringHandle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="type.ClassService"%>
<html>
<head> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>信息搜索</title>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="css/bootstrapztree.css" type="text/css">
	<%
	
	int g_init=0;
	        	
	        	if(request.getParameter("num")!=null)
	        		g_init=Integer.parseInt(request.getParameter("num"));
	        	if(g_init>5)
	        	{
	        		%>
	        		<script>alert('最多暂时仅支持6个')</script>
	        		<%g_init=5;
	        	}
	        	
	        	
	        	String []strlist=new String[]{
	        					"平台名称","平台网站名称","批准文号","平台级别","所在市县","平台组织形态"
	        			};
	        	String []strplist=new String[]{
	        			"ptmc","ptwzmc","pzwh","ptjb","szsx","ptzzxt"
	        	};
	        %>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="js/jquery.ztree.exedit.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <SCRIPT type="text/javascript">
        var setting = {
            view: {
                //addHoverDom: addHoverDom,
                //removeHoverDom: removeHoverDom,
                //selectedMulti: false
            },
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
                //enable: true
            },
			key:{
				name:"test"
			},
            callback:{
                onCheck: onCheckNode    //回调函数,获取选节点
            }
        };

        var zNodes =[
        	<%ClassService service=new ClassService();
        	List<List<String>> infos=service.list("jslyb");
        	for(int i=0;i<infos.size();i++)
        	{%>{id:<%=infos.get(i).get(0)%>, pId:<%=infos.get(i).get(2)%>, name:"<%=infos.get(i).get(1)%>",open:true}<%if(i!=infos.size()-1){%>,<%}%><%}%>
        	];

        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });

        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
                return false;
            });
        };
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };
        
        
        
        $(document).ready(function () {
       	 
        	var treenode = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
			var formData=$("#form1").serialize();
            $('#sendinfo').click(function () {
            	
                $.ajax({
                    url: 'ClassServlet?method=jsonhandle&ym=otherhandle4.jsp',
                    //信息补缺
                    type: 'POST',
                    async: true,
                    data: {
                        nodesJson: chkNodeStr,
                        times: <%=g_init+1%>,
                        starttime: $('#starttime').val(),
                        endtime: $('#endtime').val(),
                        info1_0: $('#info1_0').val(),
                        info2_0: $('#info2_0').val(),
                        row0: $('#row0').val(),
                        operator0: $('#operator0').val(),
                        searchtype0: $('#searchtype0').val()
                        	<%for(int i1=0;i1<g_init;i1++){%>,
                        	info1_<%=i1+1%>: $('#info1_<%=i1+1%>').val(),
                            info2_<%=i1+1%>: $('#info2_<%=i1+1%>').val(),
                            row<%=i1+1%>: $('#row<%=i1+1%>').val(),
                            operator<%=i1+1%>: $('#operator<%=i1+1%>').val(),
                            searchtype<%=i1+1%>: $('#searchtype<%=i1+1%>').val()
                        	<%}
                        	%>
                    },
                    dataType: 'json',
                    success: function (data) {
                        console.log(data)
                        window.location.href=data;
                        //alert(data);
                    },
                    error: function (xhr, textStatus) {
                        console.log(xhr)
                        console.log(textStatus)
                        alert(textStatus);
                    },
                });
            });
        })
        var chkNodeArr;
        var chkNodeStr="";
        var nodeJson = [];
        function onCheckNode() {
            var treenode = $.fn.zTree.getZTreeObj("treeDemo");
            chkNodeArr = treenode.getCheckedNodes(true);    //true获取选中节点,false未选中节点,默认为true
            for (var i = 0; i < chkNodeArr.length; i++) {
                nodeJson[i] = { "name": chkNodeArr[i].name, "id": chkNodeArr[i].id ,"pid":chkNodeArr[i].pId};
            }
            //console.log(chkNodeArr);
            chkNodeStr = JSON.stringify(nodeJson);
        }
    </SCRIPT>
</head>

<style>
	.container{
			width: 570px;
			height: 50px;
			margin: 7% auto;

		}
		.parent {
			width: 100%;
			height: 42px;
			top: 4px;
			position: relative;
		}
			
		.infoall {
			/*输入框高度设置为40px, border占据2px，总高度为42px*/
			width: 150px;
			height: 40px; 
			border: 1px solid #ccc;
			font-size: 16px;
			outline: none;
		}
			
		.infoall {
			border: 1px solid lightblue;
			padding-left: 10px;
		}
		.Wdate{
			/*输入框高度设置为40px, border占据2px，总高度为42px*/
			width: 150px;
			height: 40px; 
			border: 1px solid #ccc;
			font-size: 16px;
			outline: none;
			border: 1px solid lightblue;
			padding-left: 10px;
			
		}
			
		.parent>Button:first-of-type {
			/*button按钮border并不占据外围大小，设置高度42px*/
			margin-top:<%=(g_init+2)*40.5+20%>px;
			margin-left:-100px;
			width: 100px;
			height: 40px; 
			position: absolute;
			background:lightblue;
			border: 1px solid lightblue;
			color: #fff;
			font-size: 16px;
			outline: none;

		}
		.addbutton {
			/*button按钮border并不占据外围大小，设置高度42px*/
			
			width: 100px;
			height: 40px; 
			/*position: absolute;*/
			background:lightblue;
			margin-top:20px;
			border: 1px solid lightblue;
			color: #fff;
			font-size: 16px;
			outline: none;

		}
		#treeDemo
		{
			border-top:solid 1px black;
			border-right:solid 1px black;
			border-left:solid 1px black;
			border-bottom:solid 1px black;
			background:#EEEEEE;
		}
		<!--RGB-->
</style>
<body>
	<ul id="treeDemo" class="ztree" style="position:absolute"></ul>
	<div style="text-align:center;margin-top:7%;">
		<span style="font-size:30px;color:lightblue;font-weight:bold;" >搜索一下，你就知道</span>
	</div>
	
	<div class="container">
	<div class="parent">
	    <!-- <form action="#" method="post" class="parent"> -->
	        <select style="height:40px;" name="row0" id="row0">
	        	<%for(int z=0;z<strlist.length;z++)
	        		{%>
	        	<option value="<%=strplist[z]%>">
	        		<%=strlist[z]%>
	        	</option>
	        	<%} %>
	        </select>&nbsp;<input type="text" class="infoall" name="info1_0" id="info1_0">
	        <select style="height:40px;" name="operator0" id="operator0">
	        	<option value="and">
	        		并含
	        	</option>
	        	<option value="or">
	        		或含
	        	</option>
	        </select>&nbsp;<input type="text" class="infoall" name="info2_0" id="info2_0">
	        <select style="height:40px;" name="searchtype0" id="searchtype0">
	        	<option value="mohu">
	        		模糊
	        	</option>
	        	<option  value="jingque">
	        		精确
	        	</option>
	        </select>
	        <button id="sendinfo">搜索</button>
	        
	        <%for(int i=0;i<g_init;i++){%>
	        	<select style="height:40px;" name="row<%=i+1%>" id="row<%=i+1%>">
	        	<%for(int z=0;z<strlist.length;z++)
	        		{%>
	        	<option value="<%=strplist[z]%>">
	        		<%=strlist[z]%>
	        	</option>
	        	<%} %>
	        </select>&nbsp;<input type="text" class="infoall" name="info1_<%=i+1%>" id="info1_<%=i+1%>">
	        <select style="height:40px;" name="operator<%=i+1%>" id="operator<%=i+1%>">
	        	<option value="and">
	        		并含
	        	</option>
	        	<option value="or">
	        		或含
	        	</option>
	        </select>&nbsp;<input type="text" class="infoall" name="info2_<%=i+1%>" id="info2_<%=i+1%>">
	        <select style="height:40px;" name="searchtype<%=i+1%>" id="searchtype<%=i+1%>">
	        	<option value="mohu">
	        		模糊
	        	</option>
	        	<option value="jingque">
	        		精确
	        	</option>
	        </select>
	        <%} %>
	       	<br><span style="font-size:20px;margin-right:0px;margin-left:8.5px;font-family:幼圆;">批准时间:&nbsp;</span><input class="Wdate" type="text" name="starttime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" id="starttime"><span style="font-size:20px;margin-left:5px;margin-right:5px;font-family:幼圆;" id="starttime">&nbsp;到&nbsp;&nbsp;</span><input class="Wdate" type="text" name="endtime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" id="endtime">
	        <br><button class="addbutton" onclick="return addfunction();">添加条件</button>
	        <%if(g_init>0){ %>
	        <button class="addbutton" onclick="return minusfunction();">删除条件</button>
	        <%} %>
	        <!-- 条件加入 -->
	        <%if(request.getSession().getAttribute("secordsearch")!=null){ %>
	        <button class="addbutton" onclick="return cancelpipei();" style="width:140px">取消再次匹配</button>
	        <%} %>
	        
	    <!-- </form> -->
	    </div>
	</div>

	<div style="text-align:center;margin-top:20%;">
		<span style="color:gray;"> ©版权所有：石家庄铁道大学信息科学与技术学院  </span>

	</div>
	
	
	
</body>
<script type="text/javascript">
function addfunction(){
	
	 window.location.href="advancesearch.jsp?num=<%=g_init+1%>";
	 return false;
}
function minusfunction()
{
	window.location.href="advancesearch.jsp?num=<%=g_init-1%>";
	return false;
}
function cancelpipei()
{
	window.location.href="otherhandle3.jsp?rym=advancesearch.jsp";
	return false;
}

</script>
