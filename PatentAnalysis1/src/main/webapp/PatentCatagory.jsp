<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>专利类型</title>
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
	
	
	<script type="text/javascript">
	var w = 600;
	var h = 400;
	var dataset = [33,33,33];
	var padding = 40;
	var head_height = padding;
	var title = "专利类型图";
	var subTitle = "20xx年";
	//定义画布
	var svg = d3.select("div#display").append("svg").attr("width", w).attr("height", h);
	var pie = d3.layout.pie();
	var piedata = pie(dataset);
	var outerRadius = 150;	//外半径
	var innerRadius = 50;	//内半径，为0则中间没有空白
	var arc = d3.svg.arc()	//弧生成器
				.innerRadius(innerRadius)	//设置内半径
				.outerRadius(outerRadius);	//设置外半径
	var color = d3.scale.category10();
	var arcs = svg.selectAll("g")
				  .data(piedata)
				  .enter()
				  .append("g")
				  .attr("transform","translate("+ (w*1/2) +","+ (w*10/24) +")")
				  .attr("class","arcs");
	init();
	//添加标题
	if (title != "") {
		svg.append("g").append("text").text(title).attr("class", "title")
				.attr("x", w/ 2).attr("y", head_height);
		head_height += 30;
	}
	//添加副标题
	if (subTitle != "") {
		svg.append("g").append("text").text(subTitle).attr("class",
				"subTitle").attr("x", w / 2).attr("y", head_height);
		head_height += 20;
	}
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
	arcs.append("path")
		.attr("fill",function(d,i){
			return color(i);
		})
		.attr("d",function(d){
			return arc(d);
		});
	arcs.append("text")
		.attr("transform",function(d){
			return "translate(" + arc.centroid(d) + ")";
		})
		.attr("text-anchor","middle")
		.text(function(d,i){
			if((d.data!=0)){
				if(i==0){return "发明专利:"+d.data;}
				if(i==1){return "外观专利:"+d.data;}
				return "实用专利:"+d.data;
			}
			return;
		});
	}
	function drawChart(){
		getData();
		piedata = pie(dataset);
		arcs = svg.selectAll("g")
		  .data(piedata)
		  .attr("transform","translate("+ (w*1/2) +","+ (w*10/24) +")")
		  .attr("class","arcs");
		arcs.select("path")
		.attr("fill",function(d,i){
			return color(i);
		})
		.attr("d",function(d){
			return arc(d);
		});
		arcs.select("text")
		.attr("transform",function(d){
			return "translate(" + arc.centroid(d) + ")";
		})
		.attr("text-anchor","middle")
		.text(function(d,i){
			if((d.data!=0)){
				if(i==0){return "发明专利:"+d.data;}
				if(i==1){return "外观专利:"+d.data;}
				return "实用专利:"+d.data;
			}
			return;
		});
	}
	//获取json长度
	function getJsonLength(jsonData) {
		var jsonLength = 0;
		for ( var item in jsonData) {
			jsonLength++;
		}
		return jsonLength;
	}
	function getData(){
		$.ajax({
			type : "post",
			url : "patent/queryPatentCatagory",
			async:false,
			data : {
				company : $("#company option:selected").text(),
				year : $("#year1 option:selected").text(),
			},
			dataType : "json",
			success : function(data) {
				var obj = eval(data);
				if(getJsonLength(obj)==1&&parseInt(obj.inventPatent)==0){
					alert("该年该公司没有专利");
				}
				else{
					dataset=[];
					var company = $("#company option:selected").text();
					var year1 = parseInt($("#year1 option:selected").text());
					title = company+"专利类型图";
					subTitle = year1+"年 ";
					$(".title").text(title);
					$(".subTitle").text(subTitle);
					dataset.push(parseInt(obj.inventPatent));
					dataset.push(parseInt(obj.outlookPatent));
					dataset.push(parseInt(obj.practicPatent));
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