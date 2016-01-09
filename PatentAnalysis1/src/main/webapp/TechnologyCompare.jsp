<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>专利分组对比图</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-1.11.1.js"></script>
<script src="js/d3.min.js"></script>
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<style>	
	.axis path,
	.axis line{
		fill: none;
		stroke: black;
		shape-rendering: crispEdges;
	}
	.axis text {
		font-family: sans-serif;
		font-size: 11px;
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
								class="col-md-12">请在下方查询选择年份</font> <br>
							<select class="form-control" id="year1" style="margin-left:5px;margin-top:10px;width:170px" >
								<option>选择年份</option>
							</select>
							<hr>
							<font size="3px" style="font-weight: bold; font-family: KaiTi"
								class="col-md-12">请在下方查询选择组别</font> <br>
							<select class="form-control" id="group" style="margin-left:5px;margin-top:10px;width:170px" >
								<option>选择组别</option>
								<option>大组</option>
								<option>小组</option>
							</select>
							<hr>
							<div align="right"><button class="btn btn-warning" type="button" onClick="javascript:drawChart()"
								style="width: 100px;" >查询数据</button></div>
						</div>
					</div>
					<div class="col-md-7">
						<form method="post" action="FileController/getAlgorithmParameter">
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
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

		<script>
			init();
			var w = 600;
			var h = 400;
			var dataset = [33,33,33];
			var padding = 40;
			//定义画布
			var svg = d3.select("div#display").append("svg").attr("width",w).attr("height",h);
			//1. 确定初始数据
			var dataset = [
		        { name: "发明专利" , 
				  sales: [	{ year:2005, profit: 3000 },
							{ year:2006, profit: 1300 },
							{ year:2007, profit: 3700 },
							{ year:2008, profit: 4900 },
							{ year:2009, profit: 700 }] },
				{ name: "实用新型" , 
				  sales: [	{ year:2005, profit: 2000 },
							{ year:2006, profit: 4000 },
							{ year:2007, profit: 1810 },
							{ year:2008, profit: 6540 },
							{ year:2009, profit: 2820 }] },
		    ];
			
			//2. 转换数据
			var stack = d3.layout.stack()
							.values(function(d){ return d.sales; })
							.x(function(d){ return d.year; })
							.y(function(d){ return d.profit; });
			var data = stack(dataset);
			//3. 绘制
			//外边框
			var padding1 = { left:50, right:100, top:30, bottom:30 };
			//创建x轴比例尺
			var xRangeWidth = w - padding1.left - padding1.right;
			var xScale = d3.scale.ordinal()
							.domain(data[0].sales.map(function(d){ return d.year; }))
							.rangeBands([0, xRangeWidth],0.3);
			//创建y轴比例尺
			//最大利润（定义域的最大值）
			var maxProfit = d3.max(data[data.length-1].sales, function(d){ 
									return d.y0 + d.y; 
							});
			
			//最大高度（值域的最大值）
			var yRangeWidth = h - padding1.top - padding1.bottom;
			
			var yScale = d3.scale.linear()
							.domain([0, maxProfit])		//定义域
							.range([0, yRangeWidth]);	//值域
			//颜色比例尺
			var color = d3.scale.category10();
			//添加分组元素
			var groups = svg.selectAll("g")
							.data(data)
							.enter()
							.append("g")
							.style("fill",function(d,i){ return color(i); });
			//添加矩形
			var rects = groups.selectAll("rect")
							.data(function(d){ return d.sales; })
							.enter()
							.append("rect")
							.attr("x",function(d){ return xScale(d.year); })
							.attr("y",function(d){ return yRangeWidth - yScale( d.y0 + d.y ); })
							.attr("width",function(d){ return xScale.rangeBand(); })
							.attr("height",function(d){ return yScale(d.y); })
							.attr("transform","translate(" + padding1.left + "," + padding1.top + ")");
			
			//添加坐标轴
			var xAxis = d3.svg.axis()
						.scale(xScale)
						.orient("bottom");
			yScale.range([yRangeWidth, 0]);
			var yAxis = d3.svg.axis()
							.scale(yScale)
							.orient("left");
			svg.append("g")
					.attr("class","axis")
					.attr("transform","translate(" + padding1.left + "," + (h - padding1.bottom) +  ")")
					.call(xAxis);
			svg.append("g")
					.attr("class","axis")
					.attr("transform","translate(" + padding1.left + "," + (h - padding1.bottom - yRangeWidth) +  ")")
					.call(yAxis); 
			//添加分组标签
			var labHeight = 50;
			var labRadius = 10;
			var labelCircle = groups.append("circle")
								.attr("cx",function(d){ return w - padding1.right*0.98; })
								.attr("cy",function(d,i){ return padding1.top * 2 + labHeight * i; })
								.attr("r",labRadius);
			var labelText = groups.append("text")
								.attr("x",function(d){ return w - padding1.right*0.8; })
								.attr("y",function(d,i){ return padding1.top * 2 + labHeight * i; })
								.attr("dy",labRadius/2)
								.text(function(d){ return d.name; });
			function init(){
				for (var i = 2006; i < 2016; i++) {
					$("select#year1").append("<option>" + i + "</option>");
				};
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
			}
		</script>
</body>
</html>