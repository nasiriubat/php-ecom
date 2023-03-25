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
		<title>Admin| Products</title>
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
									<h3>Top Products</h3>
									<div class="filter-top-user">
										<form action="top-products.php" method="GET">
											<div class="filter-input">
												<?php
												// Get the values of from_date and to_date from the form
												$from_date =  $_GET['from_date'] ?? date('Y-m-d');
												$to_date =  $_GET['to_date'] ?? date('Y-m-d');
												?>
												<div class="input-group">
													From Date: <input type="date" name="from_date" value="<?php print $from_date; ?>">
												</div>
												<div class="input-group">
													To Date: <input type="date" name="to_date" value="<?php print $to_date; ?>">
												</div>
												<input class="date-filter-submit" type="submit" value="Submit">
											</div>
										</form>
									</div>
								</div>
								<div class="module-body table">


									<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" width="100%">
										<thead>
											<tr>
												<th>#</th>
												<th> Product Name</th>
												<th> Product Sale Quantity</th>
												<th>Total sold amount</th>

											</tr>
										</thead>
										<tbody>

											<?php
											if (isset($_GET['from_date']) && isset($_GET['to_date'])) {
												// Get the values of from_date and to_date from the form
												$from_date = $_GET['from_date'];
												$to_date = $_GET['to_date'];

												$sql = "SELECT p.productName, SUM(o.quantity) AS totalQuantity, SUM(o.quantity * p.productPrice) AS totalPrice
												FROM products p
												JOIN orders o ON p.id = o.productId
												WHERE o.orderDate BETWEEN '$from_date' AND '$to_date'
												GROUP BY p.id
												ORDER BY totalQuantity DESC, totalPrice DESC ";
											} else {
												$sql = "SELECT p.productName, SUM(o.quantity) AS totalQuantity, SUM(o.quantity * p.productPrice) AS totalPrice
												FROM products p
												JOIN orders o ON p.id = o.productId
												GROUP BY p.id
												ORDER BY totalQuantity DESC, totalPrice DESC ";
											}
											$query = mysqli_query($con, $sql);
											if (gettype($query) == "object") {
												$cnt = 1;
												while ($row = mysqli_fetch_array($query)) {
											?>
													<tr>
														<td><?php echo htmlentities($cnt); ?></td>
														<td><?php echo htmlentities($row['productName']); ?></td>
														<td><?php echo htmlentities($row['totalQuantity']); ?></td>
														<td><?php echo htmlentities($row['totalPrice']); ?></td>
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