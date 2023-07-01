            

<?php

$connection = new mysqli("localhost", "root", "", "data_siswa");
$id    = $_POST['id'];
$nama      = $_POST['nama']; 
$nim    = $_POST['nim'];
$alamat    = $_POST['alamat'];
	
$result = mysqli_query($connection, "update tbl_siswa set nama='$nama', nim='$nim', alamat='$alamat' where id='$id'");
	
if($result){
	echo json_encode([
		'message' => 'Data edit successfully'
	]);
}else{
	echo json_encode([
		'message' => 'Data Failed to update'
	]);
}