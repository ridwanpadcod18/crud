<?php

$connection = new mysqli("localhost", "root", "", "data_siswa");

$kode_buku = $_POST['id'];

$result = mysqli_query($connection, "delete from tbl_siswa where id=".$id);

if($result){
	echo json_encode([
		'message' => 'Data delete successfully'
	]);
}else{
	echo json_encode([
		'message' => 'Data Failed to delete'
	]);
}
?>