<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>省份疫情视图</title>
</head>
<body>
<h1 style="margin-left: 10%">
	<script type="text/javascript">
        var province=window.location.href//.split(“=”)[0];
		province=province.split("=")[1];
        document.write(province);  //直接写变量名，输出变量存储的内容。
    </script>
	</h1>
	
	<p style="margin-left: 10%">更新至 2020.xx.xx xx:xx</p>
	
    <div style="margin-left: 10%; width:80%;height:100px;text-align: center">
	    <div style="width:20%;height:100px;float:left">
			<p>现有确诊</p>
			<p>1234</p>
			<p>昨日+00</p>
		</div>
		<div style="width:20%;height:100px;float:left">
			<p>累计确诊</p>
			<p>1234</p>
			<p>昨日+00</p>
		</div>
		<div style="width:20%;height:100px;float:left">
			<p>累计治愈</p>
			<p>1234</p>
			<p>昨日+00</p>
		</div>
		<div style="width:20%;height:100px;float:left">
			<p>累计死亡</p>
			<p>1234</p>
			<p>昨日+00</p>
		</div>
    </div>
	
	<div style="margin-left: 10%; width:80%;height:600px;background:yellow">
		此处有折线图
	</div>
	<div style="margin-left: 11%; width:78%;height:75px;background:green">
		<div style="width:26%;height:75px;float: left">
			<input type="button" value="新增确诊趋势" οnclick="">
		</div>
		<div style="width:26%;height:75px;float: left">
			<input type="button" value="累计确诊趋势" οnclick="">
		</div>
		<div style="width:26%;height:75px;float: left">
			<input type="button" value="累计治愈/死亡趋势" οnclick="">
		</div>
	</div>
</body>
</html>