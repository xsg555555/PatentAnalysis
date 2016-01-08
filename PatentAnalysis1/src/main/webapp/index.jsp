<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css" src="css/bootstrap.min.css"></style>
<script src="js/d3.min.js" charset="utf-8"></script>
<script src="js/jquery-2.1.4.min.js" charset="utf-8"></script>
<script src="js/bootstrap.min.js" charset="utf-8"></script>
<title>数据展示</title>
</head>
<style type="text/css">
body {
	height: 100%;
}

.axis path, .axis line {
	fill: none;
	stroke: black;
	shape-rendering: crispEdges;
}

.axis text {
	font-family: sans-serif;
	font-size: 11px;
}

.title {
	font-family: Arial, 微软雅黑;
	font-size: 18px;
	text-anchor: middle;
}

.subTitle {
	font-family: Arial, 宋体;
	font-size: 12px;
	text-anchor: middle;
	fill: #666
}

.inner_line path, .inner_line line {
	fill: none;
	stroke: #E7E7E7;
	shape-rendering: crispEdges;
}
</style>
<body>
	<p align="left">
		<button onClick="javascript:drawChart();">刷新数据</button>
	</p>
	<script type="text/javascript">
		var dataset = [];
		var xMarks = [];
		var w = 600;
		var h = 400;
		var padding = 40;
		var head_height = padding;
		var title = "收支平衡统计图";
		var subTitle = "2013年1月 至 2013年6月";
		var foot_height = padding;
		//模拟数据
		getData();
		//定义画布
		var svg = d3.select("body").append("svg").attr("width", w).attr(
				"height", h);
		//添加背景
		svg.append("g").append("rect").attr("x", 0).attr("y", 0).attr("width",
				w).attr("height", h).style("fill", "#FFF").style(
				"stroke-width", 2).style("stroke", "#E7E7E7");
		//添加标题
		if (title != "") {
			svg.append("g").append("text").text(title).attr("class", "title")
					.attr("x", w / 2).attr("y", head_height);
			head_height += 30;
		}
		//添加副标题
		if (subTitle != "") {
			svg.append("g").append("text").text(subTitle).attr("class",
					"subTitle").attr("x", w / 2).attr("y", head_height);
			head_height += 20;
		}

		//横坐标轴比例尺
		var xScale = d3.scale.linear().domain([ 0, dataset.length - 1 ]).range(
				[ padding, w - padding ]);
		//纵坐标轴比例尺
		var yScale = d3.scale.linear().domain([ 0, d3.max(dataset) ]).range(
				[ h - foot_height, head_height ]);
		//定义横轴
		var xAxis = d3.svg.axis().scale(xScale).orient("bottom").ticks(
				dataset.length);
		//添加横坐标轴并通过编号获取对应的横轴标签
		var xBar = svg.append("g").attr("class", "axis").attr("transform",
				"translate(0," + (h - padding) + ")").call(xAxis).selectAll(
				"text").text(function(d) {
			return xMarks[d];
		});
		//定义纵轴
		var yAxis = d3.svg.axis().scale(yScale).orient("left").ticks(10);
		//添加纵轴
		var yBar = svg.append("g").attr("class", "axis").attr("transform",
				"translate(" + padding + ",0)").call(yAxis);
		//定义横轴网格线 
		var xInner = d3.svg.axis().scale(xScale).tickSize(
				-(h - head_height - foot_height), 0, 0).orient("bottom").ticks(
				dataset.length);
		//添加横轴网格线 
		svg.append("g").attr("class", "inner_line").attr("transform",
				"translate(0," + (h - padding) + ")").call(xInner).selectAll(
				"text").text("");
		//定义纵轴网格线 
		var yInner = d3.svg.axis().scale(yScale).tickSize(-(w - padding * 2),
				0, 0).tickFormat("").orient("left").ticks(10);
		//添加纵轴网格线 
		var yBar = svg.append("g").attr("class", "inner_line").attr(
				"transform", "translate(" + padding + ",0)").call(yInner);
		//添加折线
		var line = d3.svg.line().x(function(d, i) {
			return xScale(i);
		}).y(function(d) {
			return yScale(d);
		});
		var path = svg.append("path").attr("d", line(dataset)).style("fill",
				"#F00").style("fill", "none").style("stroke-width", 1).style(
				"stroke", "#F00").style("stroke-opacity", 0.9);
		//添加系列的小圆点
		svg.selectAll("circle").data(dataset).enter().append("circle").attr(
				"cx", function(d, i) {
					return xScale(i);
				}).attr("cy", function(d) {
			return yScale(d);
		}).attr("r", 5).attr("fill", function(d) {
			return "red";
		});

		//重新作图
		function drawChart() {
			getData();
			yBar.transition().duration(1000).call(yAxis);
			//纵轴数据更新
			var yScale = d3.scale.linear().domain([ 0, d3.max(dataset) ])
					.range([ h - foot_height, head_height ]);
			//重绘路径
			path.transition().duration(1000).attr("d", line(dataset));
			//重绘4圆点
			svg.selectAll("circle").data(dataset).transition().duration(1000)
					.attr("cx", function(d, i) {
						return xScale(i);
					}).attr("cy", function(d) {
						return yScale(d);
					}).attr("fill", function(d) {
						return "rgb( " + (d % 255) + ",0, 0)";
					});
		}
		//产生随机数据
		function getData() {
			var dataNum = 15;
			dataset = [];
			xMarks = [];
			for (i = 1; i < dataNum; i++) {
				dataset.push(Math.round(Math.random() * h));
				xMarks.push("标签" + i);
			}
		}
	</script>
</body>
</html>