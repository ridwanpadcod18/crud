<?php 

$connection = new mysqli("localhost","root","","data_siswa");
$query       = mysqli_query($connection, "select * from tbl_siswa");
$data       = mysqli_fetch_all($query, MYSQLI_ASSOC);
echo json_encode($data);
?>