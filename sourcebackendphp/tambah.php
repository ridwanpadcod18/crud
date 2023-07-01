<?php

$connection = new mysqli("localhost", "root", "", "data_siswa");
$nama      = $_POST['nama']; 
$nim    = $_POST['nim'];
$alamat    = $_POST['alamat'];

$result = mysqli_query($connection, "insert into tbl_siswa set nama='$nama', nim='$nim', alamat='$alamat'");

if($result){
    echo json_encode([
        'message' => 'Data input successfully'
    ]);
}else{
    echo json_encode([
        'message' => 'Data Failed to input'
    ]);
}
?>