<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>专利分组对比图</title>
<!-- CSS Files -->
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">

<!-- Javascript Files -->
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/wow.js"></script>
<script type="text/javascript" src="js/main.js"></script>
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
<!-- header Section -->
	<header>
		<div class="container navbar navbar-inverse">
			<div class="row">
				<!-- Logo  -->
				<div class="section_title animated wow fadeInUp col-md-3" style="margin-bottom:10px">
					<a href="index.jsp"><font color="white" size="6px">PatentAnalysis</font></a>
				</div>
				<!-- Navigation Menu  -->
				<nav style="margin-bottom:10px;margin-top:30px" class="col-md-8" >
					<ul>
						<li><a href="PatentApply.jsp"><font color="white">PatentApply</font></a></li>
						<li><a href="PatentPublicity.jsp"><font color="white">PatentPublicity</font></a></li>
						<li><a href="PatentCatagory.jsp"><font color="white">PatentCatagory</font></a></li>
						<li><a href="TechnologyCompare.jsp"><font color="white">TechCompare</font></a></li>
						<li><a href="PeopleQuantity.jsp"><font color="white">PeoQuantity</font></a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header><!-- end header -->
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
<!-- Footer Section -->
	<footer class="clearfix">
		<div class="container">
			<!-- Copyrights  -->
			<div class="copyright animated wow fadeInUp">
				<div class="section_title animated wow fadeInUp">
					<h3>Authors.</h3>
				</div>
				<p>Team of zhejiang university</p>
				<p>More info please call our phone 18868814473</p>
			</div>

			<div class="footer_links">

				<div class="sm columns animated wow fadeInRight media"
					data-wow-delay=".3s">
					<div class="pull-left">
						<img class="media-object img-circle" src="img/man1.png" alt="..."
							height="100" width="100">
					</div>
					<div class="media-body">
						<h3 class="media-heading">shangguangxie</h3>
						<div>Responsible for the overall design and front-end
							production</div>
					</div>
				</div>

				<!-- About Links  -->
				<div class="sm columns animated wow fadeInRight media"
					data-wow-delay=".4s">
					<div class="pull-left">
						<img class="media-object img-circle" src="img/man2.png" alt="..."
							height="100" width="100">
					</div>
					<div class="media-body">
						<h3 class="media-heading">biyuanlin</h3>
						<div>Responsible for the preparation of data preparation and
							control layer</div>
					</div>
				</div>

				<!-- Address  -->
				<div class="sm columns animated wow fadeInRight media"
					data-wow-delay=".5s">
					<div class="pull-left">
						<img class="media-object img-circle" src="img/man3.png" alt="..."
							height="100" width="100">
					</div>
					<div class="media-body">
						<h3 class="media-heading">qiaojieyang</h3>
						<div>Responsible for database data operation and background
							process</div>
					</div>
				</div>

			</div>
		</div>
	</footer>
	<!-- end footer -->
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
			  quantities: [	{ group:"F16D55/224", quantity: 30 },
						{ group:"F16D65/18", quantity: 13 },
						{ group:"B23Q1/28", quantity: 37 },
						{ group:"F16D121/04", quantity: 49 },
			 ]},
			{ name: "实用新型" , 
			  quantities: [	{ group:"F16D55/224", quantity: 20 },
						{ group:"F16D65/18", quantity: 40 },
						{ group:"B23Q1/28", quantity: 18 },
						{ group:"F16D121/04", quantity: 65 },
			  ]},
	    ];
		//alert(dataset);
		//2. 转换数据
		var stack = d3.layout.stack()
						.values(function(d){ return d.quantities; })
						.x(function(d){ return d.group; })
						.y(function(d){ return d.quantity; });
		var data = stack(dataset);
		//3. 绘制
		//外边框
		var padding1 = { left:50, right:100, top:30, bottom:30 };
		//创建x轴比例尺
		var xRangeWidth = w - padding1.left - padding1.right;
		var xScale = d3.scale.ordinal()
						.domain(data[0].quantities.map(function(d){ return d.group; }))
						.rangeBands([0, xRangeWidth],0.3);
		//创建y轴比例尺
		//最大利润（定义域的最大值）
		var maxQuantity = d3.max(data[data.length-1].quantities, function(d){ 
								return d.y0 + d.y; 
						});
		//最大高度（值域的最大值）
		var yRangeWidth = h - padding1.top - padding1.bottom;
		var yScale = d3.scale.linear()
						.domain([0, maxQuantity])		//定义域
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
						.data(function(d){ return d.quantities; })
						.enter()
						.append("rect")
						.attr("x",function(d){ return xScale(d.group); })
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
				.attr("id","xaxis")
				.attr("transform","translate(" + padding1.left + "," + (h - padding1.bottom) +  ")")
				.call(xAxis);
		svg.append("g")
				.attr("class","axis")
				.attr("id","yaxis")
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
			
			function drawChart(){
				getData();
				data = stack(dataset);
				
				xRangeWidth = w - padding1.left - padding1.right;
				xScale= d3.scale.ordinal()
				.domain(data[0].quantities.map(function(d){ return d.group; }))
				.rangeBands([0, xRangeWidth],0.3);
				
				//创建y轴比例尺
				//最大利润（定义域的最大值）
				maxQuantity = d3.max(data[data.length-1].quantities, function(d){ 
										return d.y0 + d.y; 
								});
				//最大高度（值域的最大值）
				yRangeWidth = h - padding1.top - padding1.bottom;
				yScale = d3.scale.linear()
				.domain([0, maxQuantity])		//定义域
				.range([0, yRangeWidth]);	//值域
				
				groups = svg.selectAll("g")
				.data(data)
				.style("fill",function(d,i){ return color(i); });
				
				rects = groups.selectAll("rect")
				.data(function(d){ return d.quantities; })
				.attr("x",function(d){ return xScale(d.group); })
				.attr("y",function(d){ return yRangeWidth - yScale( d.y0 + d.y ); })
				.attr("width",function(d){ return xScale.rangeBand(); })
				.attr("height",function(d){ return yScale(d.y); })
				.attr("transform","translate(" + padding1.left + "," + padding1.top + ")");
				
				rects = groups.selectAll("rect")
				.data(function(d){ return d.quantities; })
				.enter()
				.append("rect")
				.attr("x",function(d){ return xScale(d.group); })
				.attr("y",function(d){ return yRangeWidth - yScale( d.y0 + d.y ); })
				.attr("width",function(d){ return xScale.rangeBand(); })
				.attr("height",function(d){ return yScale(d.y); })
				.attr("transform","translate(" + padding1.left + "," + padding1.top + ")");
				
				rects = groups.selectAll("rect")
				.data(function(d){ return d.quantities; })
				.exit().remove();
				
				//添加坐标轴
				xAxis = d3.svg.axis()
							.scale(xScale)
							.orient("bottom");
				
				yScale.range([yRangeWidth, 0]);
				yAxis = d3.svg.axis()
								.scale(yScale)
								.orient("left");
				
				svg.selectAll("#xaxis")
					.attr("transform","translate(" + padding1.left + "," + (h - padding1.bottom) +  ")")
					.call(xAxis);
				svg.selectAll("#yaxis")
					.attr("transform","translate(" + padding1.left + "," + (h - padding1.bottom - yRangeWidth) +  ")")
					.call(yAxis); 
			}
			
			function getData(){
				$.ajax({
					type : "post",
					url : "group/queryTechnologyCompare",
					async:false,
					data : {
						company : $("#company option:selected").text(),
						year : $("#year1 option:selected").text(),
						type: $("#group option:selected").text(),
					},
					dataType : "json",
					success : function(data) {
						var obj = eval(data);
						dataset=[];
						var inventItems=[];
						var count=0;
						var company = $("#company option:selected").text();
						
						
						var year1 = parseInt($("#year1 option:selected").text());
						if(obj.IsNull.IsNull=="true"){alert("没有数据")}
						else{var Patent1={'name':'发明专利'};
							for(item in obj.inventPatent){
								inventItems.push(item);
								count++;
								if(count==8){
									break;
								}
							}
							var patentInfo=[];
							$.each(inventItems,function(index,content) {
								var jo={};
								jo.group=content;
								jo.quantity=parseInt(obj.inventPatent[content]);
								patentInfo.push(jo);
								//alert(JSON.stringify(patentInfo));
							});
							//alert(JSON.stringify(patentInfo));
							var Patent={};
							Patent.name="发明专利";
							Patent.quantities=patentInfo;
							dataset.push(Patent);
							//alert(JSON.stringify(dataset));
							var patentInfo=[];
							$.each(inventItems,function(index,content) {
								var jo={};
								jo.group=content;
								if(typeof(JSON.stringify(obj.practicPatent[content])) == "undefined"){
									jo.quantity=0;
								}
								else{
									jo.quantity=parseInt(obj.practicPatent[content]);
								}
								patentInfo.push(jo);
								//alert(JSON.stringify(jo));
							});
							var Patent={};
							Patent.name="实用新型";
							Patent.quantities=patentInfo;
							dataset.push(Patent);
							//alert(JSON.stringify(dataset));
							//alert(dataset);
						}
					},
					error : function(msg) {
						alert("post fail!!!");
					}
				});
			}
		</script>
</body>
</html>