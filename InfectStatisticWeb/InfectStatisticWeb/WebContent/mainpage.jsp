<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="Statistic.InfectStatistic"%>
<%@ page import="Statistic.Lib"%>
<%@ page import="Statistic.Province"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>全国疫情视图</title>
<script type="text/javascript" src="Scripts/echarts.min.js" ></script>
<script type="text/javascript" src="Scripts/china.js"></script>
<link rel="stylesheet" type="text/css" href="css/mstyles.css" />
</head>
<body>

<%

     InfectStatistic is=new InfectStatistic();
     is.getFileList("E:\\MyJavaCode\\InfectStatisticWeb\\WebContent\\log");
     Lib[] Datas=is.getLib();
     Lib Data=Datas[Datas.length-1];
     Vector<Province> pro=Data.provinces;
     String date=Data.getDate();
     String []s=date.split("-");
     String year=s[0];
     String month=s[1];
     String day=s[2];
%>

<p id="q1">数据更新至 <%=date %></p>
	
	<div id="q2">
		<div class="a1">
			<p class="b1">现有确诊</p>
			<p><%=Data.provinces.get(0).getIp() %></p>
			<p>昨日<%=Data.provinces.get(0).getIp()-Datas[Datas.length-2].provinces.get(0).getIp() %></p>
		</div>
		<div class="a1">
			<p class="b1">现有疑似</p>
			<p><%=Data.provinces.get(0).getSp() %></p>
			<p>昨日<%=Data.provinces.get(0).getSp()-Datas[Datas.length-2].provinces.get(0).getSp() %></p>
		</div>
		<div class="a1">
			<p class="b1">现有重症</p>
			<p>暂无</p>
			<p>昨日+00</p>
		</div>
		<div class="a1">
			<p class="b1">累计确诊</p>
			<p>暂无</p>
			<p>昨日+00</p>
		</div>
		<div class="a1">
			<p class="b1">累计治愈</p>
			<p><%=Data.provinces.get(0).getCure() %></p>
			<p>昨日<%=Data.provinces.get(0).getCure()-Datas[Datas.length-2].provinces.get(0).getCure() %></p>
		</div>
		<div class="a1">
			<p class="b1">累计死亡</p>
			<p><%=Data.provinces.get(0).getDead() %></p>
			<p>昨日<%=Data.provinces.get(0).getDead()-Datas[Datas.length-2].provinces.get(0).getDead() %></p>
		</div>
	</div>
	
	<div id="q3">
		<div class="a2">
			<button id="now" type="button">现有确诊</button>
		</div>
		<div class="a2">
			<button id="all" type="button">累计确诊</button>
		</div>

	</div>
	
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main">
	</div>
	<script>
	function randomData() 
	{  
		return Math.round(Math.random()*500);
	}
	
	//mydata的value到时候要修改成疫情数据
	
	function setmydatas(){
		 //mydata的value到时候要修改成疫情数据
		var mydata = [  
			            {name: '安徽',value: <%=pro.get(1).getIp() %> },
			            {name: '北京',value: <%=pro.get(2).getIp() %> },
			            {name: '重庆',value: <%=pro.get(3).getIp() %> },
			            {name: '福建',value: <%=pro.get(4).getIp() %> },
			            {name: '甘肃',value: <%=pro.get(5).getIp() %> },
			            {name: '广东',value: <%=pro.get(6).getIp() %> },
			            {name: '广西',value: <%=pro.get(7).getIp() %> },
			            {name: '贵州',value: <%=pro.get(8).getIp() %> },
			            {name: '海南',value: <%=pro.get(9).getIp() %> },
			            {name: '河北',value: <%=pro.get(10).getIp() %> },
			            {name: '河南',value: <%=pro.get(11).getIp() %> },
			            {name: '黑龙江',value: <%=pro.get(12).getIp() %> },
			            {name: '湖北',value: <%=pro.get(13).getIp() %> },
			            {name: '湖南',value: <%=pro.get(14).getIp() %> }, 
			            {name: '吉林',value: <%=pro.get(15).getIp() %> },
			            {name: '江苏',value: <%=pro.get(16).getIp() %> },
			            {name: '江西',value: <%=pro.get(17).getIp() %> },
			            {name: '辽宁',value: <%=pro.get(18).getIp() %> },
			            {name: '内蒙古',value: <%=pro.get(19).getIp() %> },
			            {name: '宁夏',value: <%=pro.get(20).getIp() %> },
			            {name: '青海',value: <%=pro.get(21).getIp() %> },
			            {name: '山东',value: <%=pro.get(22).getIp() %> },
			            {name: '山西',value: <%=pro.get(23).getIp() %> },
			            {name: '陕西',value: <%=pro.get(24).getIp() %> },
			            {name: '上海',value: <%=pro.get(25).getIp() %> },
			            {name: '四川',value: <%=pro.get(26).getIp() %> },
			            {name: '天津',value: <%=pro.get(27).getIp() %> },  
			            {name: '西藏',value: <%=pro.get(28).getIp() %> },
			            {name: '新疆',value: <%=pro.get(29).getIp() %> },
		                {name: '云南',value: <%=pro.get(30).getIp() %> },  
		                {name: '浙江',value: <%=pro.get(31).getIp() %> },
		                
		                {name: '台湾',value: randomData() },  
		                {name: '香港',value: randomData() },
		                {name: '澳门',value: randomData() }  
		            ];
		 
		var arr = document.getElementsByTagName('button');
		for (var i = 0; i < arr.length; i++)
		{
	        arr[i].onclick = function () {
	            if (this.id == 'now') 
	            {
	            	mydata = [  
			            {name: '安徽',value: <%=pro.get(1).getIp() %> },
			            {name: '北京',value: <%=pro.get(2).getIp() %> },
			            {name: '重庆',value: <%=pro.get(3).getIp() %> },
			            {name: '福建',value: <%=pro.get(4).getIp() %> },
			            {name: '甘肃',value: <%=pro.get(5).getIp() %> },
			            {name: '广东',value: <%=pro.get(6).getIp() %> },
			            {name: '广西',value: <%=pro.get(7).getIp() %> },
			            {name: '贵州',value: <%=pro.get(8).getIp() %> },
			            {name: '海南',value: <%=pro.get(9).getIp() %> },
			            {name: '河北',value: <%=pro.get(10).getIp() %> },
			            {name: '河南',value: <%=pro.get(11).getIp() %> },
			            {name: '黑龙江',value: <%=pro.get(12).getIp() %> },
			            {name: '湖北',value: <%=pro.get(13).getIp() %> },
			            {name: '湖南',value: <%=pro.get(14).getIp() %> }, 
			            {name: '吉林',value: <%=pro.get(15).getIp() %> },
			            {name: '江苏',value: <%=pro.get(16).getIp() %> },
			            {name: '江西',value: <%=pro.get(17).getIp() %> },
			            {name: '辽宁',value: <%=pro.get(18).getIp() %> },
			            {name: '内蒙古',value: <%=pro.get(19).getIp() %> },
			            {name: '宁夏',value: <%=pro.get(20).getIp() %> },
			            {name: '青海',value: <%=pro.get(21).getIp() %> },
			            {name: '山东',value: <%=pro.get(22).getIp() %> },
			            {name: '山西',value: <%=pro.get(23).getIp() %> },
			            {name: '陕西',value: <%=pro.get(24).getIp() %> },
			            {name: '上海',value: <%=pro.get(25).getIp() %> },
			            {name: '四川',value: <%=pro.get(26).getIp() %> },
			            {name: '天津',value: <%=pro.get(27).getIp() %> },  
			            {name: '西藏',value: <%=pro.get(28).getIp() %> },
			            {name: '新疆',value: <%=pro.get(29).getIp() %> },
		                {name: '云南',value: <%=pro.get(30).getIp() %> },  
		                {name: '浙江',value: <%=pro.get(31).getIp() %> },
		                
		                {name: '台湾',value: randomData() },  
		                {name: '香港',value: randomData() },
		                {name: '澳门',value: randomData() }  
		            ];
	            	
	            	draw(mydata);
	            } 
	            else if (this.id == 'all') 
	            {
	            	mydata = [  
			            {name: '安徽',value: randomData() },
			            {name: '北京',value: randomData() },
			            {name: '重庆',value: randomData() },
			            {name: '福建',value: randomData() },
			            {name: '甘肃',value: randomData() },
			            {name: '广东',value: randomData() },
			            {name: '广西',value: randomData() },
			            {name: '贵州',value: randomData() },
			            {name: '海南',value: randomData() },
			            {name: '河北',value: randomData() },
			            {name: '河南',value: randomData() },
			            {name: '黑龙江',value: randomData() },
			            {name: '湖北',value: randomData() },
			            {name: '湖南',value: randomData() }, 
			            {name: '吉林',value: randomData() },
			            {name: '江苏',value: randomData() },
			            {name: '江西',value: <%=pro.get(17).getIp() %> },
			            {name: '辽宁',value: <%=pro.get(18).getIp() %> },
			            {name: '内蒙古',value: <%=pro.get(19).getIp() %> },
			            {name: '宁夏',value: <%=pro.get(20).getIp() %> },
			            {name: '青海',value: <%=pro.get(21).getIp() %> },
			            {name: '山东',value: <%=pro.get(22).getIp() %> },
			            {name: '山西',value: <%=pro.get(23).getIp() %> },
			            {name: '陕西',value: <%=pro.get(24).getIp() %> },
			            {name: '上海',value: <%=pro.get(25).getIp() %> },
			            {name: '四川',value: <%=pro.get(26).getIp() %> },
			            {name: '天津',value: <%=pro.get(27).getIp() %> },  
			            {name: '西藏',value: <%=pro.get(28).getIp() %> },
			            {name: '新疆',value: <%=pro.get(29).getIp() %> },
		                {name: '云南',value: <%=pro.get(30).getIp() %> },  
		                {name: '浙江',value: <%=pro.get(31).getIp() %> },
		                
		                {name: '台湾',value: randomData() },  
		                {name: '香港',value: randomData() },
		                {name: '澳门',value: randomData() }  
		            ];
	                
	            	draw(mydata);
	            }
	        };
	    }
		
		console.log(mydata);
		return mydata;
		 
	}
	
	mydata=setmydatas();
     
	function draw(mydata){
		
		//初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        myChart.clear();
		
		var optionMap = {  
                backgroundColor: '#D8DFD8',  
 
                tooltip : {  
                    trigger: 'item'  
                },  
                
                //左侧小导航图标
                visualMap: {  
                    show : true,  
                    x: 'left',  
                    y: 'bottom',  
                    splitList: [   
                        {start: 10000},{start: 1000, end: 9999},  
                        {start: 100, end: 999},{start: 10, end: 99},  
                        {start: 1, end: 9},{ start: 0, end: 0},  
                    ],  
                    color: ['#8D0000', '#A52A2A', '#FF6347','#FA8072','#FFFF0D',  '#FFFFFF']  
                },  
                
                //配置属性
                series: [{  
                    name: '数据',  
                    type: 'map',  
                    mapType: 'china',   
                    roam: false,  
                    label: {  
                        normal: {  
                            show: true  //省份名称  
                        },  
                        emphasis: {  
                            show: false  
                        }  
                    },  
                    data:mydata  //数据
                }]  
            };  
        
        
        //使用制定的配置项和数据显示图表
        myChart.setOption(optionMap);
		
		myChart.on('click', function (params) 
		{
			var url="DataServlet?province="
				 +params.name;
			var year=<%=year %>;
			var month=<%=month %>;
			if(month<10)
		    {
		    	month='0'+month;
		    }
			var day=<%=day %>;
			if(day<10)
		    {
		    	day='0'+day;
		    }
			url=url+"&year="+year+"&month="+month+"&day="+day;
			var newWin =window.open(url);
        });
	}
	
	draw(mydata);
	 
	</script>

</body>
</html>