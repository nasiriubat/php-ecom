<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
	header('location:index.php');
} else {

?>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Admin| Stock</title>
		<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
		<link type="text/css" href="css/theme.css" rel="stylesheet">
		<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
		<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
		<link rel="stylesheet" href="./assets/css/admin-shohag.css">
	</head>

	<body>
		<?php include('include/header.php'); ?>

		<div class="wrapper">
			<div class="container">
				<div class="row">
					<?php include('include/sidebar.php'); ?>
					<div class="span9">
						<div class="content">

							<div class="module">
								<div class="module-head">
									<h3>Product Stock</h3>
								</div>
								<div class="module-body table">


									<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" width="100%">
										<thead>
											<tr>
												<th>#</th>
												<th> Product Name</th>
												<th> Available</th>

											</tr>
										</thead>
										<tbody>

											<?php
											$sql = "SELECT productName,stock,size FROM products";
											$query = mysqli_query($con, $sql);
											if (gettype($query) == "object") {
												$cnt = 1;
												while ($row = mysqli_fetch_array($query)) {
													if ($row['stock'] == 0) {
														$color = "#d9534f";
													} elseif ($row['stock'] < 5) {
														$color = "#f0ad4e";
													} else {
														$color = "#5cb85c";
													}
											?>
													<tr>
														<td><?php echo htmlentities($cnt); ?></td>
														<?php
														$psize = '';
														if (!empty($row['size'])) {
															$psize = ' - ( Size : ' . $row['size'] . ' )';
														}
														?>
														<td><?php echo $row['productName'].$psize ?></td>
														<td style="color:white;background-color:<?php echo $color ?>"><?php echo htmlentities($row['stock']); ?></td>
												<?php $cnt = $cnt + 1;
												}
											}
												?>

									</table>
								</div>
							</div>



						</div><!--/.content-->
					</div><!--/.span9-->
				</div>
			</div><!--/.container-->
		</div><!--/.wrapper-->

		<?php include('include/footer.php'); ?>

		<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
		<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
		<script src="scripts/datatables/jquery.dataTables.js"></script>
		<script>
			$(document).ready(function() {
				$('.datatable-1').dataTable();
				$('.dataTables_paginate').addClass("btn-group datatable-pagination");
				$('.dataTables_paginate > a').wrapInner('<span />');
				$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
				$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
			});
		</script>
	</body>
<?php } ?>