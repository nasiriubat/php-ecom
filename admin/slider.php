<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
    header('location:index.php');
} else {

    if (isset($_GET['del'])) {
        $sql = "SELECT * FROM slider WHERE id='" . $_GET['id'] . "'";
        $result = mysqli_query($con, $sql);
        $row = mysqli_fetch_assoc($result);
        $image = $row['image'];

        // Delete image from the server
        $target_dir = "sliderImages/";
        $target_file = $target_dir .$row['id'].'/'. $image;
        unlink($target_file);

        mysqli_query($con, "delete from slider where id = '" . $_GET['id'] . "'");
        $_SESSION['delmsg'] = "Product deleted !!";
    }

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
                                <div class="module-head" style="display:flex;justify-content:space-between;">
                                    <h3>Slider Image</h3>
                                    <a class="btn btn-primary" href="createSlider.php">Add New</a>
                                </div>
                                <div class="module-body table">


                                    <table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" width="100%">
                                        <thead>
                                            <tr>
                                                <th style="width:10%">#</th>
                                                <th style="width:65%"> Image</th>
                                                <th style="width:25%"> Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            $sql = "SELECT * FROM slider";
                                            $query = mysqli_query($con, $sql);
                                            if (gettype($query) == "object") {
                                                $cnt = 1;
                                                while ($row = mysqli_fetch_array($query)) {
                                            ?>
                                                    <tr>
                                                        <td><?php echo htmlentities($cnt); ?></td>
                                                        <td>
                                                            <img style="width:100%;" src="./sliderImages/<?= $row['id'] ?>/<?= $row['image'] ?>" alt="">
                                                        </td>
                                                        <td>
                                                            <a href="slider.php?id=<?php echo $row['id'] ?>&del=delete" class="btn btn-danger" onClick="return confirm('Are you sure you want to delete?')">Delete</i></a>
                                                        </td>
                                                    </tr>
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