<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.util.Iterator"%>
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
</head>
<style>
	.container{
			width: 500px;
			height: 50px;
			margin: 7% auto;

		}
		.parent {
			width: 100%;
			height: 42px;
			top: 4px;
			position: relative;
		}
			
		.parent>input:first-of-type {
			/*输入框高度设置为40px, border占据2px，总高度为42px*/
			width: 380px;
			height: 40px; 
			border: 1px solid #ccc;
			font-size: 16px;
			outline: none;
		}
			
		.parent>input:first-of-type:focus {
			border: 1px solid lightblue;
			padding-left: 10px;
		}
			
		.parent>input:last-of-type {
			/*button按钮border并不占据外围大小，设置高度42px*/
			width: 100px;
			height: 44px; 
			position: absolute;
			background:lightblue;
			border: 1px solid lightblue;
			color: #fff;
			font-size: 16px;
			outline: none;

		}
</style>
<body>
	<div style="text-align:center;margin-top:7%;">
		<span style="font-size:30px;color:lightblue;font-weight:bold;" >搜索一下，你就知道</span>
	</div>
	
	<div class="container">
	    <form action="searchResult.jsp" class="parent" method="post">
	        <input type="text" id="infoall" name="searchinfo">
	        <input type="submit" value="搜索">
	    </form>
	</div>

	<div style="text-align:center;margin-top:20%;">
		<span style="color:gray;"> ©版权所有：石家庄铁道大学信息科学与技术学院  </span>

	</div>
	
	<%
	ClassService service=new ClassService();
	List<List<String>> infos=service.list("jbxx");
	
	StringHandle sh=new StringHandle();
	List<List<String>> refreshinfo=new ArrayList<List<String>>();
	for(int z=0;z<infos.size();z++)
	{
		List<String> abc=new ArrayList<String>();
		for(int z1=0;z1<infos.get(z).size();z1++)
		{
			if(infos.get(z).get(z1)==null)
				continue;
			if(infos.get(z).get(z1).length()>10)
			{
				abc.add(infos.get(z).get(z1).substring(0, 10));
			}
			else 
			{
				abc.add(infos.get(z).get(z1));
			}
		}
		refreshinfo.add(abc);
	}
	String result="\""+sh.StringListIntoString(sh.StringListListIntoStringList(refreshinfo, "\",\""), "\",\"")+"\"";
	%>
	
</body>
<script type="text/javascript">
    $(function() {
    	
        var availableTags = [<%=result.replaceAll("\\s", "") %>];
        $( "#infoall" ).autocomplete({
            source:
                    function(request, response) {
                        var results = $.ui.autocomplete.filter(availableTags, request.term);
                        response(results.slice(0, 10));//只显示自动提示的前十条数据
                    },
            messages: {
                noResults: '',
                results: function() {}
            },
        });
 
    });
</script>
</html>