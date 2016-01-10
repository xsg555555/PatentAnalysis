<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>专利公开趋势</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-1.11.1.js"></script>
<script src="js/d3.min.js"></script>
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
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
	<div class="well container" style="background: #616161">
		<hr>
		<div>
			<div class="container">
				<div class="row">
					<div class="col-md-4" align="left">
						<div class="well">
							<font size="4px" style="font-weight: bold; font-family: KaiTi" class="col-md-12">请在下方选择要查看的公司</font> <br>
								<select class="form-control" id="company" style="margin-left:5px;margin-top:10px">
									<option>公司</option>
								</select>	
							<hr>
							<font size="3px" style="font-weight: bold; font-family: KaiTi"
								class="col-md-12">请在下方选择起始年份</font> <br>
							<select class="form-control" id="year1" style="margin-left:5px;margin-top:10px;width:170px" >
								<option>起始年份</option>
							</select>
							<hr>
							<font size="3px" style="font-weight: bold; font-family: KaiTi"
								class="col-md-12">请在下方选择终止年份</font> <br>
							<select class="form-control" id="year2" style="margin-left:5px;margin-top:10px;width:170px">
								<option>终止年份</option>
							</select>
							<div align="right"><button class="btn btn-warning" type="button" onClick="javascript:drawChart()"
								style="width: 100px;" >查询数据</button></div>
						</div>
					</div>
					<div class="col-md-7">
							<div class="panel">
								<div class="panel-heading" align="center"
									style="color: black; height: 50px; background-color: #E6E8FA">
								</div>
								<div class="panel-body" align="center">
									<div id="display" align="center"></div>
								</div>
								<div class="panel-footer">
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<script type="text/javascript">
		var dataset = [];
		var xMarks = [];
		var w = 600;
		var h = 400;
		var padding = 40;
		var head_height = padding;
		var title = "专利公开趋势图";
		var foot_height = padding;
		for (var i = 2006; i < 2016; i++) {
			$("select#year1").append("<option>" + i + "</option>");
			$("select#year2").append("<option>" + i + "</option>");
		};
		//模拟数据
		getInitData();
		//定义画布
		var svg = d3.select("div#display").append("svg").attr("width", w).attr(
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
		//定义纵轴网格线 
		var yInner = d3.svg.axis().scale(yScale).tickSize(-(w - padding * 2),
				0, 0).tickFormat("").orient("left").ticks(10);
		//添加纵轴网格线 
		var yBar1 = svg.append("g").attr("class", "inner_line").attr(
				"transform", "translate(" + padding + ",0)").call(yAxis);
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
			//纵轴数据更新
			yScale = d3.scale.linear().domain([ 0, d3.max(dataset) ]).range(
					[ h - padding, head_height ]);
			//横坐标轴比例尺
			xScale = d3.scale.linear().domain([ 0, dataset.length - 1 ]).range(
					[ padding, w - padding ]);
			//定义纵轴
			yAxis = d3.svg.axis().scale(yScale).orient("left").ticks(10);
			
			yBar1.transition().duration(1000).call(yAxis);
			
			//定义横轴
			xAxis = d3.svg.axis().scale(xScale).orient("bottom").ticks(dataset.length);
			
			d3.select(".axis").remove();
			
			var xBar = svg.append("g").attr("class", "axis").attr("transform",
					"translate(0," + (h - padding) + ")").call(xAxis).selectAll(
					"text").text(function(d) {
				return xMarks[d];
			});
			
			//重绘路径
			path.transition().duration(1000).attr("d", line(dataset));
			//update、enter、exit
			svg.selectAll("circle").data(dataset).exit().remove();
			svg.selectAll("circle").data(dataset).transition().duration(1000)
					.attr("cx", function(d, i) {
						return xScale(i);
					}).attr("cy", function(d) {
						return yScale(d);
					})
			svg.selectAll("circle").data(dataset).enter().append("circle").attr(
				"cx", function(d, i) {
					return xScale(i);
				}).attr("cy", function(d) {
					return yScale(d);
				}).attr("r", 5).attr("fill", function(d) {
					return "red";
				});
		}
		
		//产生随机数据
		function getInitData() {
			$.ajax({
				type : "post",
				url : "company/getCompanyList",
				dataType : "json",
				success : function(data) {
					var obj = eval(data);
					$.each(obj.companyList, function(index,content) {
						$("select#company").append(
								"<option>" + content + "</option>");
					});
				},
				error : function(msg) {
					alert("post fail!!!");
				}
			});
			subTitle = "20xx年x月 至 20xx年x月";
			var dataNum = 10;
			dataset = [];
			xMarks = [];
			for (i = 1; i < dataNum; i++) {
				dataset.push(Math.round(Math.random() * h));
				xMarks.push("标签" + i);
			}
		}
		
		//获取json长度
		function getJsonLength(jsonData) {
			var jsonLength = 0;
			for ( var item in jsonData) {
				jsonLength++;
			}
			return jsonLength;
		}
		
		//产生随机数据
		function getData() {
			$.ajax({
				type : "post",
				url : "patent/queryPublicity",
				async:false,
				data : {
					company : $("#company option:selected").text(),
					startYear : $("#year1 option:selected").text(),
					endYear : $("#year2 option:selected").text()
				},
				dataType : "json",
				success : function(data) {
					var obj = eval(data);
					dataset = [];
					xMarks = [];
					var company = $("#company option:selected").text();
					var year1 = parseInt($("#year1 option:selected").text());
					var year2 = parseInt($("#year2 option:selected").text());
					var month=0;
					var quantity=0;
					title = company+"专利公开趋势图";
					subTitle = year1+"年 至"+year2+"年";
					$(".title").text(title);
					$(".subTitle").text(subTitle);
					$.each(obj.publicityData,function(index,content) {
						month++;
						quantity+=parseInt(content);
						if(month%12==0){
							dataset.push(quantity);
							xMarks.push(year1);
							year1++;
							quantity=0;
						}
					});
				},
				error : function(msg) {
					alert("post fail!!!");
				}
			});
		}
	</script>
</body>
</html>