<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>专利申请趋势</title>
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
<body>
	<!-- header Section -->
	<header>
		<div class="container navbar navbar-inverse">
			<div class="row">
				<!-- Logo  -->
				<div class="section_title animated wow fadeInUp col-md-3"
					style="margin-bottom: 10px">
					<a href="index.jsp"><font color="white" size="6px">PatentAnalysis</font></a>
				</div>
				<!-- Navigation Menu  -->
				<nav style="margin-bottom: 10px; margin-top: 30px" class="col-md-8">
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
	</header>
	<!-- end header -->

	<!-- body section -->
	<div class="container">
		<div class="row">
			<div class="col-md-3" id="navbar-section">
				<ul class="nav nav-pills nav-stacked"
					style="position: fixed; top: 120">
					<li class="active"><a href="#section1">需求文档</a></li>
					<li><a href="#section2">系统用例图</a></li>
					<li><a href="#section3">用例描述典例</a></li>
				</ul>
			</div>
			<div class="col-md-9">
				<div id="section1" class="animated wow fadeInRight" data-wow-delay=".3s">
					<div class="panel">
						<div class="panel-heading" align="center"
							style="color: black; height: 50px; background-color: #E6E8FA">
							<font size="5px" style="font-weight: bold; font-family: KaiTi">需求文档</font>
						</div>
						<div class="panel-body" align="center">
							<table
								class="table table-striped table-bordered table-hover table-responsive"
								align="center">
								<thead class="active" align="center">
									<tr align="center">
										<th class="col-md-2">需求名</th>
										<th class="col-md-8">需求描述</th>
									</tr>
								</thead>
								<tbody style="height: 300px">
									<tr>
										<td><font size="4px">专利申请趋势（折线图）</font></td>
										<td><font size="4px">申请趋势反应专利申请数随时间变化的趋势，以时间（年或季度）为横轴，统计“申请日”落在刻度时间段中的专利个数，以专利申请数为纵轴做折线图，连接相应的点，形成专利申请趋势。</font></td>
									</tr>
									<tr>
										<td><font size="4px">专利公开趋势（折线图）</font></td>
										<td><font size="4px">公开趋势烦应专利公开数随时间变化的趋势，以时间（年或季度）为横轴，统计“公开日”落在刻度时间段中的专利个数，以专利申请数为纵轴做折线图，连接相应的点，形成专利公开趋势。</font></td>
									</tr>
									<tr>
										<td><font size="4px">专利类型（饼图或标准环形图）</font></td>
										<td><font size="4px">专利类型用于反应公司持有专利的类型，统计“专利类型”项下发明专利、实用新型、外观设计各自的总数，按照比例呈现。</font></td>
									</tr>
									<tr>
										<td><font size="4px">技术分布（条形堆积图）</font></td>
										<td><font size="4px">技术分布用于反应公司持有专利的主要技术方向，此处仅对“专利类型”项为发明专利和实用新型的专利进行统计，不包括外观设计。</font></td>
									</tr>
									<tr>
										<td><font size="4px">研发人员数量趋势（折线图）</font></td>
										<td><font size="4px">研发人员数量趋势用于反应公司研发人员的数量随时间变化的趋势，在抓取到的数据中，“发明（设计）人”以分号隔开.</font></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="panel-footer"></div>
					</div>
				</div>
				<hr>
				<div id="section2" class="animated fadeInRight" data-wow-delay=".4s">
					<div class="panel">
						<div class="panel-heading" align="center"
							style="color: black; height: 50px; background-color: #E6E8FA">
							<font size="5px" style="font-weight: bold; font-family: KaiTi">系统用例图</font>
						</div>
						<div class="panel-body" align="center">
							<img class="media-object" src="img/useCase.png" alt="...">
						</div>
						<div class="panel-footer"></div>
					</div>
				</div>
				<hr>
				<div id="section3" class="animated fadeInRight" data-wow-delay=".5s">
					<div class="panel">
						<div class="panel-heading" align="center"
							style="color: black; height: 50px; background-color: #E6E8FA">
							<font size="5px" style="font-weight: bold; font-family: KaiTi">用例描述典例</font>
						</div>
						<div class="panel-body" align="center">
							<table
								class="table table-striped table-bordered table-hover table-responsive"
								align="center">
								<thead class="active" align="center">
									<tr align="center">
										<th class="col-md-2">用例项</th>
										<th class="col-md-8">项目描述</th>
									</tr>
								</thead>
								<tbody style="height: 300px">
									<tr>
										<td><font size="4px">用例名称</font></td>
										<td><font size="4px">查询专利类型对比</font></td>
									</tr>
									<tr>
										<td><font size="4px">范围</font></td>
										<td><font size="4px">专利分析系统</font></td>
									</tr>
									<tr>
										<td><font size="4px">级别</font></td>
										<td><font size="4px">用户目标</font></td>
									</tr>
									<tr>
										<td><font size="4px">主要参与者</font></td>
										<td><font size="4px">用户</font></td>
									</tr>
									<tr>
										<td><font size="4px">涉众及其关注点</font></td>
										<td><font size="4px">用户：实现各公司某年各类型专利数据查询</font></td>
									</tr>
									<tr>
										<td><font size="4px">前置条件</font></td>
										<td><font size="4px">存在该公司数据</font></td>
									</tr>
									<tr>
										<td><font size="4px">成功保证</font></td>
										<td><font size="4px">成功查询到特定公司某年专利类型数据</font></td>
									</tr>
									<tr>
										<td><font size="4px">主成功场景</font></td>
										<td><font size="4px">更新专利类型对比图</font></td>
									</tr>
									<tr>
										<td><font size="4px">扩展</font></td>
										<td><font size="4px">该公司改年不存在专利数据.<br>1.弹窗提示不存在数据<br>2.重新查询</font></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="panel-footer"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- body Section -->

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
</body>
<script type="text/javascript">
	$('body').scrollspy({
		target : '#navbar-section'
	});
</script>
</html>