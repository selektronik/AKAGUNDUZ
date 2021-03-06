<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="page-wrapper" ng-controller="adminhomeController">

	<!-- Page Heading -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Dashboard <small>Statistics Overview</small>
				</h1>
				<ol class="breadcrumb">
					<li class="active"><i class="fa fa-dashboard"></i> Dashboard</li>
				</ol>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-comments fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">{{newCommentCount}}</div>
								<div>New Comments!</div>
							</div>
						</div>
					</div>
					<a href="<c:url value='/protected/comments'/>">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-files-o fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">{{articleCount}}</div>
								<div>Articles!</div>
							</div>
						</div>
					</div>
					<a href="<c:url value='/protected/articles'/>">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-yellow">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-users fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">{{usersCount}}</div>
								<div>Users!</div>
							</div>
						</div>
					</div>
					<a href="<c:url value='/protected/users'/>">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-red">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="fa fa-tasks fa-5x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">{{categoriesCount}}</div>
								<div>Categories!</div>
							</div>
						</div>
					</div>
					<a href="<c:url value='/protected/categories'/>">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-bar-chart-o fa-fw"></i> Area Chart
						</h3>
					</div>
					<div class="panel-body">
						<div id="morris-area-chart"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-long-arrow-right fa-fw"></i> Donut Chart
						</h3>
					</div>
					<div class="panel-body">
						<div id="morris-donut-chart"></div>
						<div class="text-right">
							<a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-clock-o fa-fw"></i> Tasks Panel
						</h3>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<a href="#" class="list-group-item"> <span class="badge">just
									now</span> <i class="fa fa-fw fa-calendar"></i> Calendar updated
							</a> <a href="#" class="list-group-item"> <span class="badge">4
									minutes ago</span> <i class="fa fa-fw fa-comment"></i> Commented on a
								post
							</a> <a href="#" class="list-group-item"> <span class="badge">23
									minutes ago</span> <i class="fa fa-fw fa-truck"></i> Order 392 shipped
							</a> <a href="#" class="list-group-item"> <span class="badge">46
									minutes ago</span> <i class="fa fa-fw fa-money"></i> Invoice 653 has
								been paid
							</a> <a href="#" class="list-group-item"> <span class="badge">1
									hour ago</span> <i class="fa fa-fw fa-user"></i> A new user has been
								added
							</a> <a href="#" class="list-group-item"> <span class="badge">2
									hours ago</span> <i class="fa fa-fw fa-check"></i> Completed task:
								"pick up dry cleaning"
							</a> <a href="#" class="list-group-item"> <span class="badge">yesterday</span>
								<i class="fa fa-fw fa-globe"></i> Saved the world
							</a> <a href="#" class="list-group-item"> <span class="badge">two
									days ago</span> <i class="fa fa-fw fa-check"></i> Completed task: "fix
								error on sales page"
							</a>
						</div>
						<div class="text-right">
							<a href="#">View All Activity <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-money fa-fw"></i> Transactions Panel
						</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
								<thead>
									<tr>
										<th>Order #</th>
										<th>Order Date</th>
										<th>Order Time</th>
										<th>Amount (USD)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>3326</td>
										<td>10/21/2013</td>
										<td>3:29 PM</td>
										<td>$321.33</td>
									</tr>
									<tr>
										<td>3325</td>
										<td>10/21/2013</td>
										<td>3:20 PM</td>
										<td>$234.34</td>
									</tr>
									<tr>
										<td>3324</td>
										<td>10/21/2013</td>
										<td>3:03 PM</td>
										<td>$724.17</td>
									</tr>
									<tr>
										<td>3323</td>
										<td>10/21/2013</td>
										<td>3:00 PM</td>
										<td>$23.71</td>
									</tr>
									<tr>
										<td>3322</td>
										<td>10/21/2013</td>
										<td>2:49 PM</td>
										<td>$8345.23</td>
									</tr>
									<tr>
										<td>3321</td>
										<td>10/21/2013</td>
										<td>2:23 PM</td>
										<td>$245.12</td>
									</tr>
									<tr>
										<td>3320</td>
										<td>10/21/2013</td>
										<td>2:15 PM</td>
										<td>$5663.54</td>
									</tr>
									<tr>
										<td>3319</td>
										<td>10/21/2013</td>
										<td>2:13 PM</td>
										<td>$943.45</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="text-right">
							<a href="#">View All Transactions <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

	</div>



</div>
<!-- /.container-fluid -->


<script src="<c:url value="/resources/js/pages/adminhome.js" />"></script>
<script src="../resources/js/pages/sampledata.js"></script>