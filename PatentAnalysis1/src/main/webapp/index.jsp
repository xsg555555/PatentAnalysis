<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>专利分析展示</title>
<meta charset="utf-8">
<meta name="author" content="pixelhint.com">
<meta name="description"/>

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

	<!-- Services Section -->
	<section class="services container clearfix">
			
			<!-- Services Title  -->
			<div class="section_title animated wow fadeInUp">
				<h2>What We Do.</h2>
			</div>

			<!-- Services List  -->
			<div class="services_list">
				<ul>
					<li class="animated wow fadeInRight" data-wow-delay=".3s">
						<h3>We Design.</h3>
						<p>Our data visualization program is to design a web site that uses graphs to present patent data.</p>
						<a href="WeDesign.jsp">read more<span class="arrow">&rarr;</span></a>
					</li>
					<li class="animated wow fadeInRight" data-wow-delay=".4s">
						<h3>We Implement.</h3>
						<p>In order to better present the implementation of ideas, we produced the use case diagram, database E-R diagram, sequence diagram</p>
						<a href="WeImplement.jsp">read more<span class="arrow">&rarr;</span></a>
					</li>
					<li class="animated wow fadeInRight" data-wow-delay=".5s">
						<h3>We Create.</h3>
						<p>There are five webpage for our data visualization program to meet requirements documentation .</p>
						<a href="WeCreate.jsp">read more<span class="arrow">&rarr;</span></a>
					</li>
				</ul>
			</div>
	</section><!-- end services -->

	<!-- Projects Section -->
	<section class="projects container clearfix">
			<div class="row">
			<!-- Projects Title  -->
				<div class="section_title animated wow fadeInUp col-md-3">
					<h2>Our Work.</h2>
				</div>
				<!-- Projects List  -->
				<div class="projects_list clearfix">
					<ul>
						<li class="animated wow fadeInRight col-md-4" data-wow-delay=".4s">
							<img class="media-object" src="img/p_logo1.png" alt="..." width="100%" height="100%"> 
						</li>
						<li class="animated wow fadeInRight col-md-4" data-wow-delay=".5s">
							<img class="media-object" src="img/p_logo2.png" alt="..." width="100%" height="100%"> 
						</li>
					</ul>
				</div>
			</div>
	</section><!-- end projects -->

	<!-- Footer Section -->
	<footer class="clearfix">
		<div class="container">
			<!-- Copyrights  -->
			<div class="copyright animated wow fadeInUp">
				<div class="section_title animated wow fadeInUp">
					<h3>Authors.</h3>
				</div>
				<p>Team of zhejiang university </p>
				<p>More info please call our phone 18868814473</p>
			</div>
			
			<div class="footer_links">

				<div class="sm columns animated wow fadeInRight media" data-wow-delay=".3s">
					<div class="pull-left">
            			<img class="media-object img-circle" src="img/man1.png" alt="..." height="100" width="100"> 
       				 </div>
        			<div class="media-body">
            		<h3 class="media-heading">shangguangxie</h3>
            		<div>Responsible for the overall design and front-end production</div>
        			</div>
				</div>

				<!-- About Links  -->
				<div class="sm columns animated wow fadeInRight media" data-wow-delay=".4s">
					<div class="pull-left" >
            			<img class="media-object img-circle" src="img/man2.png" alt="..." height="100" width="100">
       				 </div>
        			<div class="media-body">
            		<h3 class="media-heading">biyuanlin</h3>
            		<div>Responsible for the preparation of data preparation and control layer</div>
        			</div>
				</div>

				<!-- Address  -->
				<div class="sm columns animated wow fadeInRight media" data-wow-delay=".5s">
					<div class="pull-left">
            			<img class="media-object img-circle" src="img/man3.png" alt="..." height="100" width="100">
       				 </div>
        			<div class="media-body">
            		<h3 class="media-heading">qiaojieyang</h3>
            		<div>Responsible for database data operation and background process</div>
        			</div>
				</div>

			</div>
		</div>
	</footer><!-- end footer -->
</body>
</html>