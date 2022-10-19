<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<c:url value='/templates/user/img/favicon2.ico" type="image/x-icon' /> ">
<title>Molistar Entertainment | Admin</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='/templates/admin/plugins/fontawesome-free/css/all.min.css '/> ">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="<c:url value='/templates/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css '/> ">
<!-- iCheck -->
<link rel="stylesheet"
	href="<c:url value='/templates/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css '/> ">
<!-- JQVMap -->
<link rel="stylesheet"
	href="<c:url value='/templates/admin/plugins/jqvmap/jqvmap.min.css '/> ">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value='/templates/admin/dist/css/adminlte.min.css '/> ">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="<c:url value='/templates/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css '/> ">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="<c:url value='/templates/admin/plugins/daterangepicker/daterangepicker.css '/> ">
<!-- summernote -->
<link rel="stylesheet"
	href="<c:url value='/templates/admin/plugins/summernote/summernote-bs4.min.css '/> ">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="<c:url value='/templates/admin/dist/img/logoAdmin.png '/>"
				alt="AdminMLST" height="100px" width="100px">
		</div>

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="index" class="nav-link">Home</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="<c:url value='/admin'/> " class="brand-link"> <i class="fab fa-gg mr-1"></i> <span
				class="brand-text font-weight-light">Admin | Molistar</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img
							src="<c:url value='/templates/admin/dist/img/admin.png '/> "
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">${sessionScope.currentUser.username}</a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item menu-open"><a href="<c:url value='admin'/> "
							class="nav-link active"> <i
								class="fas fa-bars mr-1"></i>
								<p>
									Home <i class="right fas fa-angle-down"></i>
								</p>
						</a></li>
						<li class="nav-item menu">
						<a href="admin/video?action=view" class="nav-link">
								<i class="fab fa-youtube-square mr-1"></i>
								<p>
									Video <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="admin/video?action=view"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Overview</p>
								</a></li>
								<li class="nav-item"><a href="admin/video?action=add"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>New Or Edit</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-item menu">
						<a href="admin/account?action=view" class="nav-link">
								<i class="fab fas fa-address-book mr-1"></i>
								<p>
									Account <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="admin/account?action=view"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Overview</p>
								</a></li>
								
							</ul>
						</li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Dashboard</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Favorites</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Favorites Statistic</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr style="background: yellow">
									<th>Title</th>
									<th>Link</th>
									<th>Total Like</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${videos}" var="item">
									<tr>
										<td>${item.title}</td>
										<td><a href="video?action=watch&id=${item.href}">${item.href}</a></td>
										<td>${item.totalLike}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Favorites Info</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div class="form-group">
							<label>List Videos</label>
							<select class="form-control" id="selectVideo">
							<option selected disabled>Select one</option>
								<c:forEach items="${videos}" var="item">
									<option value="${item.href}">${item.title}</option>
								</c:forEach>
							</select>
						</div>
						<table id="example2" class="table table-bordered table-striped">
							<thead>
								<tr style="background: yellow">
									<th>Username</th>
									<th>Email</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title"><i class="fab fa-gg mr-1"></i>MOLISTAR - ENTERTAINMENT</h3>
                </div>
                <div class="row">
                <div class="col-lg-8 col-md-7 col-12 px-5 mb-3">
                    Copyright 2022 &copy; by Molistar Entertainment. All rights reserved.
                </div>
                <div class="col-lg-4 col-md-5 col-12 px-5 text-right">
                    Designed by <a href="https://www.facebook.com/hung.nt.2011" class="tm-text-gray" rel="sponsored" target="_parent">Nguyen The Hung<i class="fab fa-gg ml-1"></i></a>
                </div>
            </div>
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="<c:url value='/templates/admin/plugins/jquery/jquery.min.js '/> "></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="<c:url value='/templates/admin/plugins/jquery-ui/jquery-ui.min.js '/> "></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script
		src="<c:url value='/templates/admin/plugins/bootstrap/js/bootstrap.bundle.min.js '/>"></script>
	<!-- ChartJS -->
	<script
		src="<c:url value='/templates/admin/plugins/chart.js/Chart.min.js '/> "></script>
	<!-- Sparkline -->
	<script
		src="<c:url value='/templates/admin/plugins/sparklines/sparkline.js '/> "></script>
	<!-- JQVMap -->
	<script
		src="<c:url value='/templates/admin/plugins/jqvmap/jquery.vmap.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/jqvmap/maps/jquery.vmap.usa.js '/> "></script>
	<!-- jQuery Knob Chart -->
	<script
		src="<c:url value='/templates/admin/plugins/jquery-knob/jquery.knob.min.js '/> "></script>
	<!-- daterangepicker -->
	<script
		src="<c:url value='/templates/admin/plugins/moment/moment.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/daterangepicker/daterangepicker.js '/> "></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="<c:url value='/templates/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js '/> "></script>
	<!-- Summernote -->
	<script
		src="<c:url value='/templates/admin/plugins/summernote/summernote-bs4.min.js '/> "></script>
	<!-- overlayScrollbars -->
	<script
		src="<c:url value='/templates/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js '/> "></script>
	<!-- AdminLTE App -->
	<script src="<c:url value='/templates/admin/dist/js/adminlte.js '/> "></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value='/templates/admin/dist/js/demo.js '/> "></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="<c:url value='/templates/admin/dist/js/pages/dashboard.js '/> "></script>
	<!-- DataTables  & Plugins -->
	<script
		src="<c:url value='/templates/admin/plugins/datatables/jquery.dataTables.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/jszip/jszip.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/pdfmake/pdfmake.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/pdfmake/vfs_fonts.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/datatables-buttons/js/buttons.html5.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/datatables-buttons/js/buttons.print.min.js '/> "></script>
	<script
		src="<c:url value='/templates/admin/plugins/datatables-buttons/js/buttons.colVis.min.js '/> "></script>
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print"
									]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});
		
		$('#selectVideo').change(function() {
			var videoHref = $(this).val();
			$.ajax({
				url: 'admin/favorites?href=' + videoHref,
				type : 'GET',
				contentType: 'application/json'
			}).done(function(data) {
				$('#example2').DataTable({
					destroy: true,
					"paging" : true,
					"lengthChange" : false,
					"searching" : false,
					"ordering" : true,
					"info" : true,
					"autoWidth" : false,
					"responsive" : true,
					"aaData": data,
					"columns": [
						{"data": "username"},
						{"data":  "email"}
						]
				});
			}).fail(function(error) {
				$('#example2').dataTable().fnClearTable();
			});
				
			});
	</script>
</body>
</html>