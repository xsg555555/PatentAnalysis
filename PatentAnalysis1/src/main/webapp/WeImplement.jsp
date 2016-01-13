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
					<li class="active"><a href="#section1">数据库设计</a></li>
					<li><a href="#section2">前后端接口文档</a></li>
					<li><a href="#section3">系统流程顺序设计</a></li>
				</ul>
			</div>
			<div class="col-md-9">
				<div id="section1" class="animated wow fadeInRight"
					data-wow-delay=".3s">
					<div class="lead">数据库设计思想：</div>
					根据需求，每一个需求建立一张表，除此之外，额外增加一张时间维度表，用来对数据进行关于时间的分析
					<hr>
					<div class="lead">数据库E-R图</div>
					<div align="center">
						<img class="media-object" src="img/E_R.png" alt="...">
					</div>
					<hr>
					<div class="panel">
						<div class="panel-heading" align="center"
							style="color: black; height: 50px; background-color: #E6E8FA">
							<font size="5px" style="font-weight: bold; font-family: KaiTi">主要数据表设计（Patent）</font>
						</div>
						<div class="panel-body" align="center">
							<table
								class="table table-striped table-bordered table-hover table-responsive">
								<thead class="active" align="center">
									<tr align="center">
										<th class="col-md-2">字段名</th>
										<th class="col-md-8">含义</th>
										<th class="col-md-2">备注</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><font size="4px">id</font></td>
										<td><font size="4px">记录ID</font></td>
										<td><font size="4px">主键</font></td>
									</tr>
									<tr>
										<td><font size="4px">apply_number</font></td>
										<td><font size="4px">专利号</font></td>
										<td><font size="4px"></font></td>
									</tr>
									<tr>
										<td><font size="4px">name</font></td>
										<td><font size="4px">专利名称</font></td>
										<td><font size="4px"></font></td>
									</tr>
									<tr>
										<td><font size="4px">main_classify_code</font></td>
										<td><font size="4px">主要分类号</font></td>
										<td><font size="4px"></font></td>
									</tr>
									<tr>
										<td><font size="4px">apply_man</font></td>
										<td><font size="4px">专利申请者</font></td>
										<td><font size="4px"></font></td>
									</tr>
									<tr>
										<td><font size="4px">invente_man</font></td>
										<td><font size="4px">技术人员</font></td>
										<td><font size="4px"></font></td>
									</tr>
									<tr>
										<td><font size="4px">patent_agent</font></td>
										<td><font size="4px">专利机构</font></td>
										<td><font size="4px"></font></td>
									</tr>
									<tr>
										<td><font size="4px">type</font></td>
										<td><font size="4px">类型</font></td>
										<td><font size="4px"></font></td>
									</tr>
									<tr>
										<td><font size="4px">aplly_date_sk</font></td>
										<td><font size="4px">申请时间键值</font></td>
										<td><font size="4px">对应date_dim表</font></td>
									</tr>
									<tr>
										<td><font size="4px">publicity_date_sk</font></td>
										<td><font size="4px">公开时间键值</font></td>
										<td><font size="4px">对应date_dim表</font></td>
									</tr>
									<tr>
										<td><font size="4px">address</font></td>
										<td><font size="4px">地址</font></td>
										<td><font size="4px"></font></td>
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
							<font size="5px" style="font-weight: bold; font-family: KaiTi">主要数据表设计（Patent）</font>
						</div>
						<div class="panel-body" align="center">
							<div class="row">
								<table
									class="table table-striped table-bordered table-hover table-responsive">
									<thead class="active" align="center">
										<tr align="center">
											<th class="col-md-2">请求页</th>
											<th class="col-md-2">请求url</th>
											<th class="col-md-4">传输参数</th>
											<th class="col-md-4">接受参数</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><font>所有查询页</font></td>
											<td><font>company/getCompanyList</font></td>
											<td><font>无</font></td>
											<td><font>{ companyList：{，}} </font></td>
										</tr>
										<tr>
											<td><font>PatentApply</font></td>
											<td><font>patent/queryApplyData</font></td>
											<td><font> {startYear,endYear,company}</font></td>
											<td><font>{applyData:{月份:数 量}}</font></td>
										</tr>
										<tr>
											<td><font>PatentPublicity</font></td>
											<td><font>patent/queryPublicity</font></td>
											<td><font> {startYear,endYear,company}</font></td>
											<td><font>{publicityData:{月份: 数量}}</font></td>
										</tr>
										<tr>
											<td><font>PatentCatagory</font></td>
											<td><font>patent/ queryPatentCatagory</font></td>
											<td><font>{year,company} </font></td>
											<td><font>{发明专利:数量，实用新 型:数量，外观设计:数量}</font></td>
										</tr>
										<tr>
											<td><font>TechnologyCompare</font></td>
											<td><font>group/queryTechnologyCompare</font></td>
											<td><font>{year,company,type} </font></td>
											<td><font>Map{F16D55/224：{inventPatent：10,practicPatent：15}}</font></td>
										</tr>
										<tr>
											<td><font>PeopleQuantity</font></td>
											<td><font>people/queryPeopleQuantity</font></td>
											<td><font>{year,company} </font></td>
											<td><font>{peopleQuantityData:{ 月份:数量}}</font></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="panel-footer"></div>
					</div>
				</div>
				<hr>
				<div id="section3" class="animated fadeInRight" data-wow-delay=".5s">
					<div class="lead">顺序图</div>
					<div align="center">
						<img class="media-object" src="img/sequence.png" alt="...">
					</div>
					<div class="panel">
						<div class="panel-heading" align="center"
							style="color: black; height: 50px; background-color: #E6E8FA">
							<font size="5px" style="font-weight: bold; font-family: KaiTi">顺序图返回数据表</font>
						</div>
						<div class="panel-body" align="center">
							<table
								class="table table-striped table-bordered table-hover table-responsive"
								align="center">
								<thead class="active" align="center">
									<tr align="center">
										<th class="col-md-2">接受页</th>
										<th class="col-md-7">数据库返回参数</th>
										<th class="col-md-3">Controller返回参数</th>
									</tr>
								</thead>
								<tbody style="height: 300px">
									<tr>
										<td><font size="4px">PatentApply</font></td>
										<td><font size="4px">Map(String, String),返回该公司该年份区间内12个月的公司申请专利数量,key为月份，value为该月的该公司申请的专利数，若没有，返回0.</font></td>
										<td><font size="4px">{JsonObject{applyMonth:applyQuantity（以月份为精度的公司申请专利数量）}}</font></td>
									</tr>
									<tr>
										<td><font size="4px">PatentPublicity</font></td>
										<td><font size="4px">Map(String, String),返回该公司该年份区间内12个月的公司公开专利数量,key为月份，value为该月的该公司申请的专利数，若没有，返回0.</font></td>
										<td><font size="4px">{JsonObject{publicityMonth:publicityQuantity（以月份为精度的公司公开专利数量）}}</font></td>
									</tr>
									<tr>
										<td><font size="4px">PatentCatagory</font></td>
										<td><font size="4px">Map(String, String),返回该公司该年份公开的各个专利类型的专利个数。分为发明专利、外观设计、实用新型,key为专利类型名称，value为该专利类型的个数，若没有，返回0.</font></td>
										<td><font size="4px">{JsonObject{CatagoryName:CatagoryQuantity(以年为精度，分为发明专利、实用新型、外观设计)}}</font></td>
									</tr>
									<tr>
										<td><font size="4px">TechnologyCompare</font></td>
										<td><font size="4px">Map(String, Map<String,String>),查询某公司某年份根据“小组/大组”数据统计的技术类型的数量，技术类型分别“inventPatent”（发明专利）、“practicPatent”（实用新型）。返回一个HashMap，其key值为小组/大组值，value值为HashMap,其key值为专利类型名称，value为技术类型分别对应的数量.</font></td>
										<td><font size="4px">{JsonObject{groupName:{CatagoryName:CatagoryQuantity}}}（以年为精度，只有发明专利、实用新型）</font></td>
									</tr>
									<tr>
										<td><font size="4px">PeopleQuantity</font></td>
										<td><font size="4px">List(String),查询从开始年份到终止年份，以月份为精度的该公司的技术人员数量,List顺序存储从起始年1月开始到终止年12月的所有月份的人员数量.</font></td>
										<td><font size="4px">{JsonObject{publicityMonth:peopleQuantity}}(以月份为精度的公司人员数量)</font></td>
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

	<!-- end body-->

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