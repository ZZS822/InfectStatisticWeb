<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="Statistic.InfectStatistic"%>
<%@ page import="Statistic.Lib"%>
<%@ page import="Statistic.Province"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>省份疫情视图</title>
<script type="text/javascript" src="Scripts/echarts.min.js" ></script>
<link rel="stylesheet" type="text/css" href="css/pstyles.css" />
</head>
<body>

<%
   Province p=(Province)request.getAttribute("province");
   String date=(String)request.getAttribute("date");
   
   int temp=(int)request.getAttribute("lastnewip");
   String lastnewip=String.valueOf(temp);
   if(temp>0)
	   lastnewip="+"+lastnewip;
   
   temp=(int)request.getAttribute("lastnewcure");
   String lastnewcure=String.valueOf(temp);
   if(temp>0)
	   lastnewcure="+"+lastnewcure;
   
   temp=(int)request.getAttribute("lastnewdead");
   String lastnewdead=String.valueOf(temp);
   if(temp>0)
	   lastnewdead="+"+lastnewdead;
   
   temp=(int)request.getAttribute("lastnewallip");
   String lastnewallip=String.valueOf(temp);
   if(temp>0)
	   lastnewallip="+"+lastnewallip;
%>

<h1 id="q1" ><%=p.getName() %></h1>
	
	<p id="q2">更新至<%=date %></p>
	
     <div id="q3">
	    <div class="a1">
			<p class="b1">现有确诊</p>
			<p class="c1"><%=p.getIp() %></p>
			<p>昨日<b class="c1"><%=lastnewip %></b></p>
		</div>
		<div class="a1">
			<p class="b1">累计确诊</p>
			<p class="c2"><%=p.getAllIp() %></p>
			<p>昨日<b class="c2"><%=lastnewallip %></b></p>
		</div>
		<div class="a1">
			<p class="b1">累计治愈</p>
			<p class="c3"><%=p.getCure() %></p>
			<p>昨日<b class="c3"><%=lastnewcure %></b></p>
		</div>
		<div class="a1">
			<p class="b1">累计死亡</p>
			<p class="c4"><%=p.getDead() %></p>
			<p>昨日<b class="c4"><%=lastnewdead %></b></p>
		</div>
    </div>
	
	<div id="main">
		此处有折线图
	</div>
	
	<div id="q4">
		<div class="a2">
		    <button id="now" class="button1" type="button">新增确诊趋势</button>
		</div>
		<div class="a2">
		    <button id="all" class="button1" type="button">累计确诊趋势</button>
		</div>
		<div class="a2">
			<button id="DeadAndCure" class="button1" type="button">累计治愈/死亡趋势</button>
		</div>
	</div>
	
	<script>
	
	var i=0;
	var xdate=new Array();
	
	var newIp=new Array();
	var allIp=new Array();
	var Cure=new Array();
	var Dead=new Array();
	
	<%
	String[] months=(String[])request.getAttribute("months");
	String[] days=(String[])request.getAttribute("days");
	
	int[] newIp=(int[])request.getAttribute("newIp");
	int[] allIp=(int[])request.getAttribute("allIp");
	int[] Cure=(int[])request.getAttribute("Cure");
	int[] Dead=(int[])request.getAttribute("Dead");
	
	for(int i=0;i<months.length;i++)
	{
	%>
	var month=<%=months[i] %>;
	if(month<10)month='0'+month;
	var day=<%=days[i] %>;
	if(day<10)day='0'+day;
	xdate[i]=month+"-"+day;
	
	newIp[i]=<%=newIp[i] %>;
	allIp[i]=<%=allIp[i] %>;
	Cure[i]=<%=Cure[i] %>;
	Dead[i]=<%=Dead[i] %>;
	
	i=i+1;
	<%} %>
	
	function setData()
	{
		var option = {
                title:{
                    text:'新增确诊趋势',//标题
                    left: 'left',//标题位置
                },
                //提示框组件
                tooltip:{
                    //坐标轴触发，主要用于柱状图，折线图等
                    trigger:'axis'
                },
                //横轴
                xAxis:{
                    data:xdate
                },
                //纵轴
                yAxis:{},
                //系列列表。每个系列通过type决定自己的图表类型
                series:[{
	    	                 name:'新增确诊',//series名称
	    	                 type:'line',//series图表类型,line折线图 、scatter散点图
	    	                 data:newIp  //  
	    	                }]
            };
		
		var arr = document.getElementsByTagName('button');
		for (var i = 0; i < arr.length; i++)
		{
	        arr[i].onclick = function () {
	            if (this.id == 'now') 
	            {
	            	option = {
	                        title:{
	                            text:'折线图实例',//标题
	                            left: 'center',//标题位置
	                        },
	                        //提示框组件
	                        tooltip:{
	                            //坐标轴触发，主要用于柱状图，折线图等
	                            trigger:'axis'
	                        },
	                        //横轴
	                        xAxis:{
	                            data:xdate
	                        },
	                        //纵轴
	                        yAxis:{},
	                        //系列列表。每个系列通过type决定自己的图表类型
	                        series:[{
	                        	name:'新增确诊',//series名称
	        	    	        type:'line',//series图表类型,line折线图 、scatter散点图
	        	    	        data:newIp  //  
	        	    	                }]
	                    };
	            	
	            	draw(option);
	            }
	            else if(this.id=='all')
	            {
	            	option = {
	                        title:{
	                            text:'累计确诊趋势',//标题
	                            left: 'left',//标题位置
	                        },
	                        //提示框组件
	                        tooltip:{
	                            //坐标轴触发，主要用于柱状图，折线图等
	                            trigger:'axis'
	                        },
	                        //横轴
	                        xAxis:{
	                            data:xdate
	                        },
	                        //纵轴
	                        yAxis:{},
	                        //系列列表。每个系列通过type决定自己的图表类型
	                        series:[{
	                        	name:'累计确诊',//series名称
	        	    	        type:'line',//series图表类型,line折线图 、scatter散点图
	        	    	        data:allIp  //  
	        	    	                }]
	                    };
	            	
	            	draw(option);
	            }
	            else if(this.id=='DeadAndCure')
	            {
	            	option = {
	                        title:{
	                            text:'累计治愈/死亡趋势',//标题
	                            left: 'left',//标题位置
	                        },
	                        //提示框组件
	                        tooltip:{
	                            //坐标轴触发，主要用于柱状图，折线图等
	                            trigger:'axis'
	                        },
	                        //横轴
	                        xAxis:{
	                            data:xdate
	                        },
	                        //纵轴
	                        yAxis:{},
	                        //系列列表。每个系列通过type决定自己的图表类型
	                        series:[{
	                        	name:'治愈',//series名称
	        	    	        type:'line',//series图表类型,line折线图 、scatter散点图
	        	    	        data:Cure  //
	        	    	        },{
	        	    	        	name:'死亡',//series名称
	        	    	            type:'line',//series图表类型,line折线图 、scatter散点图
	        	    	            data:Dead //
	        	    	                }]
	                    };
	            	
	            	draw(option);
	            	}
	        }
		}
		
		console.log(option);
		return option;
	}
	
	var option=setData();
	
	function draw(option)
	{
		//基于准备好的DOM，初始化echarts实例--echarts.init() 方法初始化一个 ECharts 实例，在 init() 中传入图表容器 Dom 对象，
        var myChart = echarts.init(document.getElementById('main'));
          //指定图表的配置项和数据
        myChart.clear();
            //使用刚指定的配置项和数据显示图表
        myChart.setOption(option);
	}
    
	draw(option);
	
    </script>
	

</body>
</html>