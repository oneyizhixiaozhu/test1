
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单页面</title>
<style type="text/css">
			@charset "utf-8";
			/* 以下实际使用若已初始化可删除 .nav height父级需逐级设置为100%*/
			
			body,
			html {
				height: 100%;
				background: #E2E2E2
			}
			
			body,
			ul {
				margin: 0;
				padding: 0
			}
			
			body {
				font: 14px "微软雅黑", "宋体", "Arial Narrow", HELVETICA;
				-webkit-text-size-adjust: 100%;
			}
			
			li {
				list-style: none
			}
			
			a {
				text-decoration: none;
			}
			/* 以上实际使用若已初始化可删除 */
			
			#navn>div {
				display: inline-block;
				vertical-align: top;
			}
			/* nav */
			
			.nav-top {
				border-bottom: 1px solid rgba(255, 255, 255, .1);
			}
			
			.nav-top .nav-toptxt {
				border-bottom: 1px solid rgba(255, 255, 255, .1);
				color: #fff;
				font-size: 30px;
				width: 60px;
				text-align: center;
				cursor: pointer;
			}
			
			.nav {
				width: 220px;
				height: 100%;
				background: #144B85;
				transition: all .3s;
				overflow: auto;
			}
			
			.nav a {
				display: block;
				overflow: hidden;
				padding-left: 20px;
				line-height: 46px;
				max-height: 46px;
				color: #fff;
				transition: all .3s;
			}
			
			.nav a span {
				margin-left: 30px;
			}
			
			.nav-item {
				position: relative;
			}
			
			.nav-item.nav-show {
				border-bottom: none;
			}
			
			.nav-item ul {
				display: none;
				background: rgba(0, 0, 0, .1);
			}
			
			.nav-item.nav-show ul {
				display: block;
			}
			
			.nav-item>a:before {
				content: "";
				position: absolute;
				left: 0px;
				width: 2px;
				height: 46px;
				background: #34A0CE;
				opacity: 0;
				transition: all .3s;
			}
			
			.nav .nav-icon {
				font-size: 20px;
				position: absolute;
				margin-left: -1px;
				top: 14px;
			}
			/* 此处修改导航图标 可自定义iconfont 替换*/
			
			.icon_1::after {
				content: "";
				display: block;
				width: 20px;
				height: 20px;
				/*background: url(men1.png)no-repeat;*/
			}
			
			.nav-item:nth-child(1) .icon_1::after {
				background: url(NewDocument.png)no-repeat;
				background-size: 100% 100%;
			}
			
			.nav-item:nth-child(2) .icon_1::after {
				background: url(Gear.png)no-repeat;
				background-size: 100% 100%;
			}
			
			.nav-item:nth-child(4) .icon_1::after {
				background: url(search_32px_1218536_easyicon.net.png)no-repeat;
				background-size: 100% 100%;
			}
			.nav-item:nth-child(3) .icon_1::after {
				background: url(Menu.png)no-repeat;
				background-size: 100% 100%;
			}
			/*.nav-item:nth-child(5) .icon_1::after {
				background: url(Menu.png)no-repeat;
				background-size: 100% 100%;
			}*/
			/*.nav-item:nth-child(2) .icon_1::after{background: url(men1.png)no-repeat;}*/
			/*.icon_2::after{content: "\e669";}*/
			/*.icon_3::after{content: "\e61d";}*/
			/*---------------------*/
			
			.nav-more {
				float: right;
				margin-right: 20px;
				font-size: 12px;
				transition: transform .3s;
			}
			/* 此处为导航右侧箭头 如果自定义iconfont 也需要替换*/
			
			.nav-more::after {
				content: ">";
				color: #fff;
				font-style: normal;
				font-family: SimSun;
			}
			/*---------------------*/
			
			.nav-show .nav-more {
				transform: rotate(90deg);
			}
			
			.nav-show,
			.nav-item>a:hover {
				color: #2AF8CB;
			}
			
			.nav-show>a:before,
			.nav-item>a:hover:before {
				opacity: 1;
			}
			
			.nav-item li:hover a {
				color: #FFF;
				background: #3399FF;
			}
			/* nav-mini */
			
			.nav-mini.nav {
				width: 60px;
			}
			
			.nav-mini.nav .nav-icon {
				/* margin-left:-2px; */
			}
			
			.nav-mini.nav .nav-item>a span {
				display: none;
			}
			
			.nav-mini.nav .nav-more {
				margin-right: -20px;
			}
			
			.nav-mini.nav .nav-item ul {
				position: absolute;
				top: 0px;
				left: 60px;
				width: 180px;
				z-index: 99;
				background: #144B76;
				overflow: hidden;
			}
			
			.nav-mini.nav .nav-item:hover {
				background: rgba(255, 255, 255, .1);
			}
			
			.nav-mini.nav .nav-item:hover .nav-item a {
				color: #FFF;
			}
			
			.nav-mini.nav .nav-item:hover a:before {
				opacity: 1;
			}
			
			.nav-mini.nav .nav-item:hover ul {
				display: block;
			}
			
			li.act {
				background: #3399FF;
			}
			* {
            margin: 0;
            padding: 0;
   }
			
		</style>
		<!--link rel="stylesheet" type="text/css" href="font/iconfont.css"-->
 
		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script>
			$(function() {
//				 nav收缩展开
				  $('#aat').on('click','.nav-item>a',function(){
				      if (!$('.nav').hasClass('nav-mini')) {
				          if ($(this).next().css('display') == "none") {
				              //展开未展开
				              $('.nav-item').children('ul').slideUp(300);
				              $(this).next('ul').slideDown(300);
				              $(this).parent('li').addClass('nav-show').siblings('li').removeClass('nav-show');
				          }else{
				              //收缩已展开
				              $(this).next('ul').slideUp(300);
				              $('.nav-item.nav-show').removeClass('nav-show');
				          }
				      }
				  });
//				 标志点击样式
				  $('#aat').on('click','.nav-item>ul>li',function(){
						$(this).addClass("act").siblings().removeClass("act");
						$(this).parents(".nav-item").siblings().find(">ul>li").removeClass("act");
						console.log($(this).text())
				  })
//				nav-mini切换
				
				  $('#mini').on('click',function(){
				      if (!$('.nav').hasClass('nav-mini')) {
				          $('.nav-item.nav-show').removeClass('nav-show');
				          $('.nav-item').children('ul').removeAttr('style');
				          $('.nav').addClass('nav-mini');
				          $('.nav').css('overflow','visible');
				      }else{
				          $('.nav').removeClass('nav-mini');
				          $('.nav').css('overflow','auto');
				      }
				  });
			});
			
			
			//开始时自动缩回
				$(document).ready(function(){
					document.getElementById('mini').click();
				    });

			
		</script>
 
	</head>
 
	<body>
 
 	<%
 	//假装登录测试
 	request.getSession().setAttribute("flag", 0);
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
 
		<div class="nav" style="float:left">
			<div class="nav-top">
				<div id="mini" class="nav-toptxt">≡</div>
			</div>
			<ul id="aat">
				<li class="nav-item">
					<a href="javascript:;">
						<i class="my-icon nav-icon icon_1"></i><span>报表在线填写</span>
						<i class="my-icon nav-more"></i>
					</a>
					<ul>
						<li>
							<a href="main.jsp" target="scrshow"><span>封面</span></a>
						</li>
						<li>
							<a href="pagere.jsp" target="scrshow"><span>基础信息填报</span></a>
						</li>
						<li>
							<a href="page.jsp" target="scrshow"><span>一.基本信息</span></a>
						</li>
						<li><a href="page2_1.jsp" target="scrshow"><span>二.主要研究</span></a></li>
						<li><a href="page3_1.jsp" target="scrshow"><span>三.人员情况</span></a></li>
						<li><a href="page4_1.jsp" target="scrshow"><span>四.科研用房仪器</span></a></li>
						<li><a href="page5.jsp" target="scrshow"><span>五.年度经筹支出</span></a></li>
						<li><a href="page6_1.jsp" target="scrshow"><span>六.年度研发项目</span></a></li>
						<li><a href="page7_1_1.jsp" target="scrshow"><span>七.年度研发成果</span></a></li>
						<li><a href="page8_1.jsp" target="scrshow"><span>八.开放合作情况</span></a></li>
						<li><a href="page9_1_1.jsp" target="scrshow"><span>九.成果转化对外</span></a></li>
						<li><a href="page10_1.jsp" target="scrshow"><span>十.人才培养情况</span></a></li>
					</ul>
				</li>
				<li class="nav-item">
					<a href="javascript:;">
						<i class="my-icon nav-icon icon_1"></i><span>管理选项</span>
						<i class="my-icon nav-more"></i>
					</a>
					<ul>
						<li>
							<a href="changemimaLogin.jsp" target="scrshow"><span>修改密码</span></a>
						</li>
						<li>
							<a href="addmibao.jsp" target="scrshow"><span>添加密保</span></a>
						</li>
						
						
					</ul>
				</li>
				<li class="nav-item">
					<a href="javascript:;">
						<i class="my-icon nav-icon icon_1"></i><span>表格管理</span>
						<i class="my-icon nav-more"></i>
					</a>
					<ul>
						<li>
							<a href="otherhandle2.jsp" target="scrshow"><span>技术领域设置</span></a>
						</li>
						<li>
							<a href="managerCheck.jsp" target="scrshow"><span>表格审核</span></a>
						</li>
						
					</ul>
				</li>
				<li class="nav-item">
					<a href="javascript:;">
						<i class="my-icon nav-icon icon_1"></i><span>统计表查看</span>
						<i class="my-icon nav-more"></i>
					</a>
					<ul>
						<li>
							<a href="advancesearch.jsp" target="scrshow"><span>总搜索浏览</span></a>
						</li>
						<li>
							<a href="simplesearch.jsp" target="scrshow"><span>一体式搜索</span></a>
						</li>
					</ul>
				</li>
				
				
				
				
			</ul>
			
		</div>
		<div style="float:left;background:white;">
			<iframe src="<%=(String)request.getAttribute("webpage")!=null?(String)request.getAttribute("webpage"):"main.jsp" %>" frameborder="0" name="scrshow"  height="99%" width="100%" scrolling="auto" style="position: fixed;background-color: white"></iframe>
		</div>
		
		<script>
			$(function() {
				//		var navList = [
				//		  {
				//		    "p" : "银川市",
				//		    "c" : ["兴庆区","金凤区"]
				//		  },
				//		  {
				//		    "p" : "石嘴山市",
				//		    "c" : ["大武口区","惠农区"]
				//		  }
				//		]
				//		var navData = '';
				//		for(let i=0;i<navList.length;i++){
				//			navData+= "<li class='nav-item'><a href='javascript:;'><i class='my-icon nav-icon icon_1'></i><span>"+navList[i].p+"</span><i class='my-icon nav-more'></i></a><ul>"
				//			for(let w=0;w<navList[i].c.length;w++){
				//				navData+="<li><a href='javascript:;'><span>"+navList[i].c[w]+"</span></a></li>"
				//			}
				//			navData+="</ul></li>"
				//		}
				//		console.log(navData)
				//		$('#aat').html(navData)
			})
		</script>
	</body>
	
 
</html>