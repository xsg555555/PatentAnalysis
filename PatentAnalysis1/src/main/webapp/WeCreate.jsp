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
					<li class="active"><a href="#section1">专利申请趋势</a></li>
					<li><a href="#section2">专利公开趋势</a></li>
					<li><a href="#section3">专利类型</a></li>
					<li><a href="#section4">技术分布</a></li>
					<li><a href="#section5">研发人员数量趋势</a></li>
				</ul>
			</div>
			<div class="col-md-9">
				<div id="section1" class="animated wow fadeInRight"
					data-wow-delay=".3s">
					<div class="panel">
						<div class="panel-heading" align="center"
							style="color: black; height: 50px; background-color: #E6E8FA">
							<font size="5px" style="font-weight: bold; font-family: KaiTi">专利申请趋势图</font>
						</div>
						<div class="panel-body" align="center">
							<img class="media-object" src="img/p_logo1.png" alt="...">
						</div>
						<div class="panel-footer"></div>
					</div>
				</div>
				<hr>
				<div id="section2" class="animated fadeInRight" data-wow-delay=".4s">
					<div class="panel">
						<div class="panel-heading" align="center"
							style="color: black; height: 50px; background-color: #E6E8FA">
							<font size="5px" style="font-weight: bold; font-family: KaiTi">专利公开趋势图</font>
						</div>
						<div class="panel-body" align="center">
							<img class="media-object" src="img/p_logo3.png" alt="...">
						</div>
						<div class="panel-footer"></div>
					</div>
				</div>
				<hr>
				<div id="section3" class="animated fadeInRight" data-wow-delay=".5s">
					<div class="panel">
						<div class="panel-heading" align="center"
							style="color: black; height: 50px; background-color: #E6E8FA">
							<font size="5px" style="font-weight: bold; font-family: KaiTi">专利类型图</font>
						</div>
						<div class="panel-body" align="center">
							<img class="media-object" src="img/p_logo4.png" alt="...">
						</div>
						<div class="panel-footer"></div>
					</div>
				</div>
				<div id="section4" class="animated fadeInRight" data-wow-delay=".5s">
					<div class="panel">
						<div class="panel-heading" align="center"
							style="color: black; height: 50px; background-color: #E6E8FA">
							<font size="5px" style="font-weight: bold; font-family: KaiTi">技术分布图</font>
						</div>
						<div class="panel-body" align="center">
							<img class="media-object" src="img/p_logo2.png" alt="...">
						</div>
						<div class="panel-footer"></div>
					</div>
				</div>
				<div id="section5" class="animated fadeInRight" data-wow-delay=".5s">
					<div class="panel">
						<div class="panel-heading" align="center"
							style="color: black; height: 50px; background-color: #E6E8FA">
							<font size="5px" style="font-weight: bold; font-family: KaiTi">研发人员数量趋势图</font>
						</div>
						<div class="panel-body" align="center">
							<img class="media-object" src="img/p_logo5.png" alt="...">
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
	})
</script>
</html>