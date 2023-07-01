<?php 

    $connection = new mysqli("localhost","root","","data_siswa");
    $data       = mysqli_query($connection, "select * from tbl_siswa where id=".$_GET['id']);
    $data       = mysqli_fetch_array($data, MYSQLI_ASSOC);

    echo json_encode($data);
?>